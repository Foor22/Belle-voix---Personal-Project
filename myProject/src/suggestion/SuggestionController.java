package suggestion;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import config.Constants;

import page.Pager;
import suggestion.dao.SuggestionDAO;
import suggestion.dto.SuggestionCommentDTO;
import suggestion.dto.SuggestionDTO;


@WebServlet("/suggestion_servlet/*")
public class SuggestionController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트에서 요청한 주소(뷰(jsp)에서 submit할 때 보내는 주소)
		//uri는 .toString() 안붙여도 되는데 url은 붙여야됨.(http://localhost/jsp02/Suggestion_servlet/* => 이런 형식으로 반환된다)
		String url=request.getRequestURL().toString();
		System.out.println(url);
		
		//컨텍스트 패스 (/myProject => 프로젝트명 반환)
		String contextPath=request.getContextPath();
		//dao 인스턴스 생성
		SuggestionDAO dao=new SuggestionDAO();
		
		//건의/피드백 출력
		if(url.indexOf("list.do") != -1) {
		//----------- 페이징 처리 --------------//
			//Suggestion 테이블의 레코드 갯수 계산 (dao의 count 메소드를 이용해서 값을 받아옴)
			int count=dao.count();
			//페이지 나누기를 위한 처리(페이징 처리)
			int curPage=1;//(현재페이지. 페이지는 1부터 시작)
			//숫자처리는 null포인트 exception 예외가 자주 발생하기 때문에
			//if문으로 처리해주는 것이 좋다.
			if(request.getParameter("curPage") != null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager=new Pager(count, curPage);//import page.Pager
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			
			
		//----------- list.do 처리 --------------//
			//리스트 생성
			System.out.println("list.do 호출"); //동작확인을 위한 출력문(콘솔)
			//dao.list()메소드의 반환형이 List이다.
			List<SuggestionDTO> list=dao.list(start, end);
			//request 객체에 반환된 list값 저장
			request.setAttribute("list", list);
			//페이지 네비게이션 출력을 위한 정보를 request 객체에 전달
			request.setAttribute("page", pager);
			String page="/ui_page/communication/suggestion_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}//list()
		
		//글쓰기
		else if(url.indexOf("insert.do") != -1) {
			//파일 업로드 처리(Constants.UPLOAD_PATH 에 해당하는 경로에 대한 File 객체 생성)
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()) {	//업로드 디렉토리가 존재하지 않으면
				uploadDir.mkdir();		//디렉토리를 생성
			}
			MultipartRequest multi=new MultipartRequest(request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
		//	MultipartRequest multi=new MultipartRequest(request(HttpServletRequest), "파일 저장경로(String)", 파일 크기(int), "인코딩방식", 파일명 중복 방지 처리 옵션(숫자로 처리));
			
			String writer=multi.getParameter("writer");
			String subject=multi.getParameter("subject");
			String content=multi.getParameter("content");
			String passwd=multi.getParameter("passwd");
			String ip=request.getRemoteAddr();//클라이언트의 ip주소 가져오기
			String filename=" ";//파일이름 공백1개
			int filesize=0;
			try {
				//첨부파일의 집합
				Enumeration files=multi.getFileNames();
				while(files.hasMoreElements()) {
					//첨부파일의 이름
					String file1=(String)files.nextElement();
					filename=multi.getFilesystemName(file1);
					File f1=multi.getFile(file1);
					if(f1 != null) {
						filesize=(int)f1.length();//파일 사이즈 저장
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			//글쓰기에 작성된 값들을 받아와서 저장하기위해 dto객체 인스턴스 생성
			SuggestionDTO dto=new SuggestionDTO();
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			
			//파일 첨부를 하지 않을 경우 (trim() : 문자열 양쪽 공백 제거)
			if(filename == null || filename.trim().equals("")) {
				//파일이 없을 경우 파일의 이름을 -로 표시.
				filename="-";
			}
			//파일 이름과 파일 크기까지 저장
			dto.setFilename(filename);
			dto.setFilesize(filesize);
			
			//DB에 저장하기 위해 dao호출
			dao.insert(dto);
			String page="/suggestion_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}//insert()
		
		//파일 다운로드
		else if(url.indexOf("download.do") != -1) {
			//게시물 번호에 해당하는 파일을 다운받기 위해 num값 받아옴
			int num=Integer.parseInt(request.getParameter("num"));
			//num번째 파일과 일치하는 파일의 이름을 DB에서 받아온다.
			String filename=dao.getFileName(num);
			System.out.println("첨부파일 이름 : "+filename);
			
			//다운로드 할 파일의 경로
			String path = Constants.UPLOAD_PATH+filename;
			byte b[]=new byte[4096];	//바이트 배열 생성
			//서버에 저장된 파일을 읽기 위한 스트림 생성
			FileInputStream fis=new FileInputStream(path);
			
			//mimeType(파일의 종류 - img, mp3, text... 등)
			String mimeType=getServletContext().getMimeType(path);
			
			if(mimeType == null) {
				mimeType="application/octet-stream;charset=utf-8";
			}
			//파일 이름에 한글이 포함된 경우 header로 값을 보내게 되는데
			//header에는 한글이나 특수문자가 올 수 없기 때문에 톰캣서버의
			//기본 언어 셋팅인 서유럽언어 8859_1을 한글처리가 가능한 utf-8로 인코딩 처리해야 한다.
			//new String(바이트 배열("변환할 인코딩 값"), "기본인코딩값")
			filename = new String(filename.getBytes("utf-8"), "8859_1");
			
			//http header
			response.setHeader("Content-Disposition", "attachment;filename="+filename);
			//http body
			//OutputStream 생성 (서버에서 클라이언트에 쓰기)
			ServletOutputStream out=response.getOutputStream();
			int numRead;
			while(true) {
				numRead = fis.read(b, 0, b.length);//데이터 읽음
				if(numRead == -1) break;//더이상 내용이 없으면
				out.write(b, 0, numRead);//데이터 쓰기
			}
			//파일 처리 관련 리소스 정리
			out.flush();
			out.close();
			fis.close();
			
			//다운로드 횟수 증가 처리
			dao.plusDown(num);
		}//download()
		
		//건의/피드백 글 보기
		else if(url.indexOf("view.do") != -1) {
			//게시물 번호에 해당하는 게시글을 보기 위해 num값 받아옴
			int num=Integer.parseInt(request.getParameter("num"));
			HttpSession session=request.getSession();
			
			//조회수 증가 처리
			dao.plusReadCount(num, session);
			
			//번호에 해당하는 게시물 리턴
			//SuggestionDTO dto=dao.view(num);
			SuggestionDTO dto=dao.viewReplace(num);
			
			//request 영역에 저장
			request.setAttribute("dto", dto);
			//화면 전환
			String page="/ui_page/communication/suggestion_view.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}//view()
		
		//댓글 기능
		else if(url.indexOf("commentList.do") != -1) {
			//num번째 게시물에 해당하는 댓글 목록 가져오기
			int num=Integer.parseInt(request.getParameter("num"));
			System.out.println("댓글을 위한 게시물번호 : "+num);
			//댓글 목록 리턴
			List<SuggestionDTO> list = dao.commentList(num);
			//request영역에 저장
			request.setAttribute("list", list);
			//출력 페이지로 이동
			String page="/ui_page/communication/suggestion_comment_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}//commentList()
		
		//댓글 추가 기능
		else if(url.indexOf("commentAdd.do") != -1) {
			SuggestionCommentDTO dto=new SuggestionCommentDTO();
			//게시물 번호
			int suggestion_num=Integer.parseInt(request.getParameter("suggestion_num"));
			String writer=request.getParameter("writer");
			String content=request.getParameter("content");
			dto.setSuggestion_num(suggestion_num);
			dto.setWriter(writer);
			dto.setContent(content);
			dao.commentAdd(dto);
			//이곳은 백그라운드로 실행되기 때문에 어느 page로 이동하던 상관없다.
		}//comment_add()
	
		//댓글 삭제 기능
		else if(url.indexOf("commentDlt.do") != -1) {
			SuggestionCommentDTO dto=new SuggestionCommentDTO();
			//게시물 번호
			int comment_num=Integer.parseInt(request.getParameter("c_num"));
			int suggestion_num=Integer.parseInt(request.getParameter("n_num"));
			String writer=request.getParameter("writer");
			System.out.println(comment_num);
			System.out.println(suggestion_num);
			System.out.println(writer);
			dto.setComment_num(comment_num);
			dto.setSuggestion_num(suggestion_num);
			dto.setWriter(writer);
			dao.commentDlt(dto);
		}//comment_dlt()
		
		//비밀번호 확인
		else if(url.indexOf("pass_check.do") != -1) {
			//게시물 번호 
			int num=Integer.parseInt(request.getParameter("num"));
			//입력한 비밀번호
			String passwd=request.getParameter("passwd");
			//비밀번호가 일치하는지 확인
			String result=dao.passwdCheck(num, passwd);
			String page="";
			if(result != null) {//비밀번호가 맞으면
				page="/ui_page/communication/suggestion_edit.jsp";
				request.setAttribute("dto", dao.view(num));
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			} else {//비밀번호가 틀리면
				page=contextPath+"/suggestion_servlet/view.do?num="+num+"&message=error";
				response.sendRedirect(page);
			}
		}//pass_check()
		
		//비밀번호 확인 후 게시물 수정or삭제 값 전달을 위한 컨트롤
		else if(url.indexOf("pass_check.do") != -1) {
			//해당 게시물 번호 
			int num=Integer.parseInt(request.getParameter("num"));
			//입력한 비밀번호
			String passwd=request.getParameter("passwd");
			//비밀번호가 일치하는지 확인
			String result=dao.passwdCheck(num, passwd);
			String page="";
			if(result != null) {//비밀번호가 맞으면
				page="/ui_page/communication/suggestion_edit.jsp";
				//num에 해당하는 레코드 불러와서 request 객체에 저장
				request.setAttribute("dto", dao.view(num));
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			} else {//비밀번호가 틀리면
				page=contextPath+"/suggestion_servlet/view.do?num="+num+"&message=error";
				response.sendRedirect(page);
			}
		}//pass_check()
	
		//건의/피드백 게시물 수정(업데이트)
		else if(url.indexOf("update.do") != -1) {
			//파일 업로드 처리(Constants.UPLOAD_PATH 에 해당하는 경로에 대한 File 객체 생성)
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()) {	//업로드 디렉토리가 존재하지 않으면
				uploadDir.mkdir();		//디렉토리를 생성
			}
			MultipartRequest multi=new MultipartRequest(request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
		//	MultipartRequest multi=new MultipartRequest(request(HttpServletRequest), "파일 저장경로(String)", 파일 크기(int), "인코딩방식", 파일명 중복 방지 처리 옵션(숫자로 처리));
			//수정할 게시물 번호 
			int num=Integer.parseInt(multi.getParameter("num"));
			
			String writer=multi.getParameter("writer");
			String subject=multi.getParameter("subject");
			String content=multi.getParameter("content");
			String passwd=multi.getParameter("passwd");
			String ip=request.getRemoteAddr();//클라이언트의 ip주소 가져오기
			String filename=" ";//파일이름 공백1개
			int filesize=0;
			try {
				//첨부파일의 집합
				Enumeration files=multi.getFileNames();
				while(files.hasMoreElements()) {
					//첨부파일의 이름
					String file1=(String)files.nextElement();
					filename=multi.getFilesystemName(file1);
					File f1=multi.getFile(file1);
					if(f1 != null) {
						filesize=(int)f1.length();//파일 사이즈 저장
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			SuggestionDTO dto=new SuggestionDTO();
			dto.setNum(num);
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			
			//파일 첨부를 하지 않을 경우 (trim() : 문자열 양쪽 공백 제거)
			if(filename == null || filename.trim().equals("")) {
				//새로운 첨부파일이 없을 때(테이블의 기존정보를 가져옴)
				SuggestionDTO dto2=dao.view(num);
				String fName=dto2.getFilename();
				int fSize=dto2.getFilesize();
				int fDown=dto2.getDown();
				dto.setFilename(fName);
				dto.setFilesize(fSize);
				dto.setDown(fDown);
			} else {//새로운 첨부파일이 있을 때
				dto.setFilename(filename);
				dto.setFilesize(filesize);
			}
			
			//첨부파일 삭제 처리
			String fileDel=multi.getParameter("fileDel");
			//체크박스에 체크가 되어있으면, value없이 썼기 때문에 on이 디폴트가 됨
			if(fileDel != null && fileDel.equals("on")) {
				String fileName=dao.getFileName(num);
				File f=new File(Constants.UPLOAD_PATH + fileName);
				f.delete();	//파일 삭제
				//첨부파일의 정보를 지움
				dto.setFilename("-");
				dto.setFilesize(0);
				dto.setDown(0);
			}
			//레코드 수정
			dao.update(dto);
			//페이지 이동
			String page="/suggestion_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}//update()
	
		//건의/피드백 게시물 삭제
		else if(url.indexOf("delete.do") != -1) {
			//파일업로드를 사용하지 않더라도 MultipartRequest 처리를 해야한다.
			MultipartRequest multi=new MultipartRequest(request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
			//삭제할 게시물 번호
			int num=Integer.parseInt(multi.getParameter("num"));
			//게시물을 삭제하기 전에 댓글을 모두 삭제해야 한다(외래키 사용으로 인해 댓글을 삭제하지 않으면 실행이 되지 않음)
			dao.commentAllDlt(num);
			//삭제
			dao.delete(num);
			//삭제 후 게시물 번호 수정 코드
			//레코드 총 갯수 받아오기
			int cntAll=dao.count();
			//num최댓값 받아오기(필요없어짐 count 사용하면 됨)
			//int maxNum=dao.getMaxNum();
			//게시물마다 num의 값 갱신
			for(int i=num; i<=cntAll+1; i++) {
				dao.updateNum(i);
			}
			//페이지 이동
			String page="/suggestion_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}
	
		//검색해서 찾기
		else if(url.indexOf("search.do") != -1) {
			//검색 옵션과 검색 키워드
			String search_option=request.getParameter("search_option");
			String keyword=request.getParameter("keyword");
			
			List<SuggestionDTO> list = dao.searchList(search_option, keyword);
			request.setAttribute("list", list);
			request.setAttribute("search_option", search_option);
			request.setAttribute("keyword", keyword);
			
			String page="/ui_page/communication/suggestion_search.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
