package client;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import client.dao.ClientDAO;
import client.dto.ClientDTO;


@WebServlet("/client_servlet/*")
public class ClientController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//사용자가 요청한 주소(뷰(jsp)에서 submit할 때 보내는 주소)
		String uri=request.getRequestURI();
		//DAO 객체 생성
		ClientDAO dao=new ClientDAO();
		//post방식으로 받아오는 모든 파라미터(매개변수)들을 인코딩(한글깨짐현상방지)
		request.setCharacterEncoding("utf-8");
		
		//로그인
		if(uri.indexOf("login.do") != -1) {
			//폼으로부터 아이디 비밀번호 받아오기
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			//DTO객체 생성
			ClientDTO dto=new ClientDTO();
			//dto setter에 아이디 비밀번호 값 대입
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			//dto setter에 대입된 값이 사용자 id,pw정보(db)와 일치하는지 체크(dao의 메소드 이용)
			String result=dao.loginCheck(dto);
			
			// DAO로부터 result 값이 반환되는지 콘솔창에서 확인
			System.out.println(result); 
			
			if(!result.equals("로그인 실패")) {//로그인 성공시
				//로그인 상태를 유지하기 위한 세션 객체를 생성한다.
				HttpSession session=request.getSession();
			
				//세션영역에 값을 저장한다 (setAttribute메소드 사용)
				session.setAttribute("userid", userid);
				//추후에 비밀번호 확인을 위해서 passwd도 저장한다.
				session.setAttribute("passwd", passwd);
				session.setAttribute("message", result);
				
				//로그인 성공 후 이동할 페이지 경로
				String page="/ui_page/index.jsp";
				//로그인은 페이지 세션의 정보가 변하므로 forward가 아닌 redirect를 사용한다.
				response.sendRedirect(request.getContextPath()+page);
			} else {//로그인 실패시
				//로그인 실패 후 이동할 페이지 경로
				String page="/ui_page/client/login.jsp";
				//페이지 리다이렉트(세션에 변화가 생기므로 redirect방식 사용)
				response.sendRedirect(request.getContextPath()+page+"?message=error");
			}
		}//login()
		
		//로그아웃
		else if(uri.indexOf("logout.do") != -1) {
			//세션에 관한 데이터 처리를 하기 위해 세션 객체를 생성한다.
			HttpSession session=request.getSession();
			//세션을 초기화 시킨다.
			session.invalidate();
			//세션 초기화 후 이동할 페이지 경로 설정
			String page=request.getContextPath()+"/ui_page/index.jsp?message=logout";
			//페이지 리다이렉트(세션에 변화가 생기므로 redirect방식 사용)
			response.sendRedirect(page);
		}//logout()
		
		//회원가입
		else if(uri.indexOf("join.do") != -1) {
			//폼으로부터 회원정보 받아오기
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd_1");
			String name=request.getParameter("name");
			String hp=request.getParameter("hp");
			String email=request.getParameter("email");
			String address=request.getParameter("address");
			//DTO객체 생성
			ClientDTO dto=new ClientDTO();
			//dto setter에 회원정보 값 대입
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setHp(hp);
			dto.setEmail(email);
			dto.setAddress(address);
			//dto setter에 대입된 값을 DB에 저장(dao의 메소드 이용)
			dao.insert(dto);
			
			//회원가입 완료 창으로 이동
			String page="/ui_page/client/join_done.jsp";
			//회원가입 후 url이 바뀌기 때문에 redirect 방식을 사용
			response.sendRedirect(request.getContextPath()+page);
		}//join()
		
		//정보 수정창
		else if(uri.indexOf("viewInfo.do") != -1) {
			//정보를 수정할 계정의 id를 가져온다
			String userid=request.getParameter("userid");
//			System.out.println("정보 수정할 계정의 아이디:"+userid);
			
			//클라이언트의 정보를 저장할 dto객체 생성(dao의 메소드 이용)
			ClientDTO dto=dao.clientInfo(userid);
			//DB로부터 받아온 dto 인스턴스를 request 객체의 영역에 저장
			request.setAttribute("dto", dto);
			
			String page="/ui_page/client/info_view.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}//viewInfo()
		
		//계정 찾기
		else if(uri.indexOf("checkInfo.do") != -1) {
			//찾을 계정의 이름, 번호, 이메일 값을 가져온다
			String name=request.getParameter("name");
			String hp=request.getParameter("hp");
			String email=request.getParameter("email");
			
			//DTO객체 생성
			ClientDTO dto=new ClientDTO();
			//dto setter에 회원정보 값 대입
			dto.setName(name);
			dto.setHp(hp);
			dto.setEmail(email);
			//dto setter에 대입된 값이 사용자 정보(db)와 일치하는지 체크(dao의 메소드 이용)
			String result=dao.infoCheck(dto);
			
			// DAO로부터 result 값이 반환되는지 콘솔창에서 확인
			System.out.println(result); 
			
			if(!result.equals("해당정보가 없습니다")) {//계정유무 확인 성공시
				//dto객체의 값을 변경
				dto=dao.clientFind(name);
			
				//DB로부터 받아온 dto 인스턴스를 request 객체의 영역에 저장
				request.setAttribute("dto", dto);
				
				//request객체의 보존을 위해 forward한다.
				String page="/ui_page/client/info_view.jsp?message=found";
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			} else {//로그인 실패시
				//로그인 실패 후 이동할 페이지 경로
				String page="/ui_page/client/login.jsp";
				//페이지 리다이렉트(세션에 변화가 생기므로 redirect방식 사용)
				response.sendRedirect(request.getContextPath()+page+"?message=miss");
			}
		}//checkInfo()
		
		//회원정보 업데이트
		else if(uri.indexOf("update.do") != -1) {
			//폼으로부터 변경된 회원정보 받아오기
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd_1");
			String name=request.getParameter("name");
			String hp=request.getParameter("hp");
			String email=request.getParameter("email");
			String address=request.getParameter("address");
			//DTO객체 생성
			ClientDTO dto=new ClientDTO();
			//dto setter에 변경된 회원정보 값 대입
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setHp(hp);
			dto.setEmail(email);
			dto.setAddress(address);
			//DB의 레코드를 수정(dao의 메소드 이용)
			dao.update(dto);
			//페이지 이동(url변경->redirect)
			response.sendRedirect(request.getContextPath()+"/ui_page/index.jsp?message=changed");
		}//update()
		
		//회원탈퇴
		else if(uri.indexOf("delete.do") != -1) {
			//폼으로부터 탈퇴할 회원의 id를 받아온다
			String userid=request.getParameter("userid");
			//레코드 삭제 처리
			dao.delete(userid);
			
			//페이지 이동하기 전에 세션을 초기화 시켜야한다.(하지않으면 페이지 이동시 세션이 유지가 되어 탈퇴한 회원이 로그인되어있다.)
			//세션 객체 생성
			HttpSession session=request.getSession();
			//세션을 비운다(초기화 시킴)
			session.invalidate();
			
			//페이지 이동
			response.sendRedirect(request.getContextPath()+"/ui_page/index.jsp?message=deleted");
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
