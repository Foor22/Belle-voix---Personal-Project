package notice.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import notice.dto.NoticeCommentDTO;
import notice.dto.NoticeDTO;
import sqlmap.MybatisManager;

public class NoticeDAO {
	
	//게시물의 목록을 리턴하는 list 메소드
	public List<NoticeDTO> list(int start, int end) {
		//하나의 테이블엔 여러개의 행(레코드(row))가 존재하므로 list로 받아온다.
		List<NoticeDTO> list=null;
		//mybatis를 사용하기 전에 sqlMapConfig.xml에 가서 정보수정 필수!
		//mybatis SqlSession 객체 인스턴스 생성
		SqlSession session=null;
		
		//예외발생을 처리하기 위해 try-catch문 사용
		try {
			//mybatis 실행 객체
			session=MybatisManager.getInstance().openSession();
			
			//페이징 처리를 위해 시작값과 끝 값을 map을 사용해서 받아온다.
			Map<String, Object> map=new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			//selectList() 메소드의 반환형은 List형이다.
			list=session.selectList("notice.list", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}
	
	//글쓰기 후 게시물 저장
	public void insert(NoticeDTO dto) {
		//mybatis SqlSession 객체 인스턴스 생성
		SqlSession session=null;
		
		try {
			session=MybatisManager.getInstance().openSession();
			//insert문을 실행해서 dto 객체의 값을 테이블에 추가
			session.insert("notice.insert", dto);
			session.commit();	//mybatis는 auto commit을 지원하지 않는다.
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	//첨부파일 이름 찾기
	public String getFileName(int num) {
		//파일 이름을 저장하기 위한 String변수 result 선언
		String result = "";
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			//selectOne : 한 개의 레코드 반환
			result=session.selectOne("notice.getFileName", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return result;
	}
	
	//다운로드 횟수 증가 처리
	public void plusDown(int num) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			//num 값을 조건문의 수정 값으로 사용해 update문 실행
			session.update("notice.plusDown", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	
	//번호에 해당하는 view
	public NoticeDTO view(int num) {
		NoticeDTO dto=null;//초기화
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto=session.selectOne("notice.view", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return dto;
	}
	
	//공지사항 조회수 증가 처리
	public void plusReadCount(int num, HttpSession count_session) {
		SqlSession session=null;
		try {
			long read_time=0;
			if(count_session.getAttribute("read_time_"+num) != null) {
				read_time=(long)count_session.getAttribute("read_time_"+num);
			}
			long current_time=System.currentTimeMillis();//현재시각 밀리세컨드	
			session=MybatisManager.getInstance().openSession();
			if(current_time-read_time > 10*1000) {//현재시간-읽은시간>10초
				//하루에 한번이면 24*60*60*1000
				session.update("notice.plusReadCount", num);
				session.commit();
				//최근 열람 시각 업데이트
				count_session.setAttribute("read_time_"+num, current_time);				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	
	//댓글 목록을 구하는 코드
	public List<NoticeCommentDTO> commentList(int num) {
		List<NoticeCommentDTO> list=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			list=session.selectList("notice.commentList", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}
	
	//댓글 추가
	public void commentAdd(NoticeCommentDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("notice.commentAdd", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	
	//댓글 삭제
	public void commentDlt(NoticeCommentDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.delete("notice.commentDlt", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	
	//모든 댓글 삭제
	public void commentAllDlt(int num) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.delete("notice.commentAllDlt", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	
	//줄바꿈 처리한 view
	public NoticeDTO viewReplace(int num) {
		NoticeDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto=session.selectOne("notice.view", num);
			//줄바꿈 처리
			String content=dto.getContent();
			content=content.replace("\n", "<br>");
			dto.setContent(content);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return dto;
	}

	//공지사항 게시물 수정처리
	public void update(NoticeDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.update("notice.update", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	//공지사항 게시물 삭제
	public void delete(int num) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.delete("notice.delete", num);//진짜 삭제
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	//게시물 번호 최댓값 갱신
	/*
	 * public void setMaxNum() { //try~with문 (try문을 벗어난 직 후 자동적으로 session을
	 * close()해주기 때문에 try-catch문보다 편리하다) try( SqlSession
	 * session=MybatisManager.getInstance().openSession() ) {
	 * session.update("notice.setMaxNum");//번호 최댓값 갱신 session.commit(); } catch
	 * (Exception e) { e.printStackTrace(); } }
	 */
	
	//게시물 삭제 후 모든 게시물 번호 수정
	public void updateNum(int num) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.update("notice.updateNum", num);//게시물 번호 갱신
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	//검색 기능
	public List<NoticeDTO> searchList(String search_option, String keyword) {
		List<NoticeDTO> list=null;
		try( SqlSession session=MybatisManager.getInstance().openSession() ) {
			Map<String,String> map=new HashMap<>();
			map.put("search_option", search_option);
			map.put("keyword", "%"+keyword+"%");
			list=session.selectList("notice.searchList", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	//게시물의 갯수 계산
	public int count() {
		int result=0;
		//try~with문 (try문을 벗어난 직 후 자동적으로 session을 close()해주기 때문에 try-catch문보다 편리하다)
		try( SqlSession session=MybatisManager.getInstance().openSession() ) {
			result = session.selectOne("notice.count");
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return result;
	}

		
}
