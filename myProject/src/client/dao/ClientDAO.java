package client.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import client.dto.ClientDTO;
import config.DB;

public class ClientDAO {

	//회원이 맞는지 확인하는 로그인 정보확인 메소드 (mybatis사용 안하고 작성)
	public String loginCheck(ClientDTO dto) {
		//반환 값이 될 String 변수 result를 선언
		String result = "";
		
		//JDBC연동 객체 선언
		Connection conn=null;	//DB에 접근하는 객체(가장 먼저 선언해야 한다. DB와 Connect 되어야 DML문을 사용하는 객체(pstmt)를 사용할 수 있기 때문.
		PreparedStatement pstmt=null;	//DB에 쿼리를 보내기 위한 객체
		ResultSet rs=null;	//PreparedStatement객체로 select문을 사용하여 얻어온 레코드(row) 값들을
							//테이블의 형태로 갖게 되는 객체
		
		try {
			conn = DB.getConn();	//config 패키지의 DB.java파일을 import한다. DB.java파일 설정은 필수
			
			//DB에 보낼 쿼리문
			String sql="select * from client where userid=? and passwd=?";
			//쿼리문을 보내고 sql을 실행할 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			//sql 쿼리문에 있는 ? (물음표)는 함수에서의 인자같은 역할을 한다.
			//setString(n번째 물음표(위치), 위치에 대입할 값)
			
			//첫번째 물음표에 id저장(dto에는 Controller에서 이미 값을 대입해 놓았다. 그렇기 때문에 값을 받아올 수 있다.)
			pstmt.setString(1, dto.getUserid());
			//두번째 물음표에 passwd저장
			pstmt.setString(2, dto.getPasswd());
			
			//select문을 실행한 후 레코드(row)값의 테이블을 반환받는다. (반환되는 객체의 자료형 ResultSet, 그러므로 rs으로 받아준다)
			rs=pstmt.executeQuery();
			
			//next() : 레코드를 하나씩 읽는다.(제일 처음 next()를 실행하면 첫 번째 레코드가 있는 행으로 이동한다. 그 다음 호출되면 하나씩 읽어온다.
			//아이디 비밀번호를 구하는 쿼리같은 경우에는 입력한 정보가 DB에 저장되어있는 정보와 일치하지 않으면
			//select문으로 출력되는 데이터가 없기 때문에 반복해서 값을 읽어들이지 않아도 된다.
			if (rs.next()) {//로그인 성공
				result = rs.getString("name")+"님 안녕하세요!";
			} else {//로그인 실패
				result = "로그인 실패";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)
					rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt != null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		//로그인 결과 String값 반환
		return result;
	}//loginCheck()
	
	//계정 찾기 메소드 (이름, 번호, 이메일 값이 회원정보와 일치하는지 확인)
	public String infoCheck(ClientDTO dto) {
		//반환 값이 될 String 변수 result를 선언
		String result = "";
		
		//JDBC연동 객체 선언
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;	//select문 사용
		
		try {
			conn = DB.getConn();	//config 패키지의 DB.java파일을 import
			
			//DB에 보낼 쿼리문
			String sql="select * from client where name=? and hp=? and email=?";
			//쿼리문을 보내고 sql을 실행할 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			//첫번째 물음표에 이름 저장(dto에는 Controller에서 이미 값을 대입해 놓았다. 그렇기 때문에 값을 받아올 수 있다.)
			pstmt.setString(1, dto.getName());
			//두번째 물음표에 전화번호 저장
			pstmt.setString(2, dto.getHp());
			//세번째 물음표에 이메일 저장
			pstmt.setString(3, dto.getEmail());
			
			//select문을 실행한 후 레코드(row)값의 테이블을 반환받는다. (반환되는 객체의 자료형 ResultSet, 그러므로 rs으로 받아준다)
			rs=pstmt.executeQuery();
			
			//next() : 레코드를 하나씩 읽는다.(제일 처음 next()를 실행하면 첫 번째 레코드가 있는 행으로 이동한다. 그 다음 호출되면 하나씩 읽어온다.
			//아이디 비밀번호를 구하는 쿼리같은 경우에는 입력한 정보가 DB에 저장되어있는 정보와 일치하지 않으면
			//select문으로 출력되는 데이터가 없기 때문에 반복해서 값을 읽어들이지 않아도 된다.
			if (rs.next()) {//계정유무 확인 성공
				result = rs.getString("name")+"님이 맞으시군요!";
			} else {//계정유무 확인 실패
				result = "해당정보가 없습니다";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)
					rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt != null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		//계정유무 확인 결과 String값 반환
		return result;
	}//infoCheck()
	
	//계정 찾은 후 계정 수정을 하기 위해 기존 DB를 불러올 메소드
	public ClientDTO clientFind(String name) {
		//ClientDTO형의 값을 반환해야 하기 때문에 dto객체 인스턴스 생성
		ClientDTO dto = new ClientDTO();
		
		//JDBC연동객체 선언
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			//DB와 연결
			conn = DB.getConn();
			//DB에 보낼 쿼리문
			String sql="select * from client where name=?";
			//쿼리문을 보내고 sql을 실행할 객체 생성
			pstmt = conn.prepareStatement(sql);
			//첫번째 물음표에 매개변수로 받아온 name대입
			pstmt.setString(1, name);
			//select문을 실행한 후 레코드(row)값의 테이블을 반환받는다.
			rs=pstmt.executeQuery();
			
			//next() : 레코드를 하나씩 읽는다.
			if(rs.next()) {
				//ResultSet 클래스의 객체 인스턴스인 rs의 메소드 getNString
				//getNString : ResultSet 객체는 SELECT문으로 가져온 레코드를 테이블 형태로 가지고 있으며,
				//그 레코드 값을 가져오기 위해서는 getXXX() 형식의 메소드를 사용한다.
				dto.setUserid(rs.getNString("userid"));
				dto.setPasswd(rs.getNString("passwd"));
				dto.setName(rs.getNString("name"));
				dto.setHp(rs.getNString("hp"));
				dto.setEmail(rs.getNString("email"));
				dto.setAddress(rs.getNString("address"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)
					rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt != null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		//dto 반환
		return dto;
	}//clientFind()
	
	//회원 정보를 sql을 사용하여 DB에 저장하는 메소드 (mybatis사용 안하고 작성)
	public void insert(ClientDTO dto) {
		//JDBC연동 객체 선언
		Connection conn=null;	//DB에 접근하는 객체(가장 먼저 선언해야 한다. DB와 Connect 되어야 DML문을 사용하는 객체(pstmt)를 사용할 수 있기 때문.
		PreparedStatement pstmt=null;	//DB에 쿼리를 보내기 위한 객체
	//	ResultSet rs=null;	//데이터를 읽어올 것이 아니기 때문에 ResultSet객체는 사용하지 않는다.
		
		try {
			conn = DB.getConn();	//config 패키지의 DB.java파일을 import한다. DB.java파일 설정은 필수
			
			//StringBuilder 객체 생성 (하나의 인스턴스를 이용하여 문자열을 계속 이어붙일 수 있다.)
			StringBuilder sql=new StringBuilder();
			//append()메소드를 이용하여 StringBuilder클래스의 인스턴스인 sql객체에 문자열을 이어붙인다.
			sql.append("insert into client ");
			sql.append("(userid,passwd,name,hp,email,address) values ");
			sql.append("(?,?,?,?,?,?)");
			
			//쿼리문을 보내고 sql을 실행할 객체 생성 (toString()메소드를 이용하여 sql에 담겨진 데이터를 받아온다)
			pstmt = conn.prepareStatement(sql.toString());
			
			//sql 쿼리문에 있는 ? (물음표)는 함수에서의 인자같은 역할을 한다.
			//setString(n번째 물음표(위치), 위치에 대입할 값)
			//첫번째 물음표부터 값 대입(dto에는 Controller에서 이미 값을 대입해 놓았다. 그렇기 때문에 값을 받아올 수 있다.)
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getHp());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getAddress());
			
			//executeUpdate() 메소드는 삽입, 수정, 삭제와 관련된 SQL문(DML) 실행에 쓰인다.
			pstmt.executeUpdate();//insert, update, delete
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}//insert()

	public ClientDTO clientInfo(String userid) {
		//ClientDTO형의 값을 반환해야 하기 때문에 dto객체 인스턴스 생성
		ClientDTO dto = new ClientDTO();
		
		//JDBC연동객체 선언
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			//DB와 연결
			conn = DB.getConn();
			//DB에 보낼 쿼리문
			String sql="select * from client where userid=?";
			//쿼리문을 보내고 sql을 실행할 객체 생성
			pstmt = conn.prepareStatement(sql);
			//첫번째 물음표에 매개변수로 받아온 userid대입
			pstmt.setString(1, userid);
			//select문을 실행한 후 레코드(row)값의 테이블을 반환받는다.
			rs=pstmt.executeQuery();
			
			//next() : 레코드를 하나씩 읽는다.
			if(rs.next()) {
				dto.setUserid(userid);
				//ResultSet 클래스의 객체 인스턴스인 rs의 메소드 getNString
				//getNString : ResultSet 객체는 SELECT문으로 가져온 레코드를 테이블 형태로 가지고 있으며,
				//그 레코드 값을 가져오기 위해서는 getXXX() 형식의 메소드를 사용한다.
				dto.setPasswd(rs.getNString("passwd"));
				dto.setName(rs.getNString("name"));
				dto.setHp(rs.getNString("hp"));
				dto.setEmail(rs.getNString("email"));
				dto.setAddress(rs.getNString("address"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)
					rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt != null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		//dto 반환
		return dto;
	}//clientInfo()

	public void update(ClientDTO dto) {
		//JDBC연동객체 선언
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			//DB와 연결
			conn = DB.getConn();
			
			//StringBuilder 객체 생성 (하나의 인스턴스를 이용하여 문자열을 계속 이어붙일 수 있다.)
			StringBuilder sql=new StringBuilder();
			//append()메소드를 이용하여 StringBuilder클래스의 인스턴스인 sql객체에 문자열을 이어붙인다.
			sql.append("update client set ");
			sql.append("passwd=?, name=?, hp=?, email=?, address=? ");
			sql.append("where userid=?");
			
			//쿼리문을 보내고 sql을 실행할 객체 생성 (toString()메소드를 이용하여 sql에 담겨진 데이터를 받아온다)
			pstmt = conn.prepareStatement(sql.toString());
			
			//sql 쿼리문에 있는 ? (물음표)는 함수에서의 인자같은 역할을 한다.
			//setString(n번째 물음표(위치), 위치에 대입할 값)
			//첫번째 물음표부터 값 대입(dto에는 Controller에서 이미 값을 대입해 놓았다. 그렇기 때문에 값을 받아올 수 있다.)
			//대입되는 인덱스의 갯수(물음표의 갯수)가 몇개인지 잘 보고 코딩할 것
			pstmt.setString(1, dto.getPasswd());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getHp());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getAddress());
			pstmt.setString(6, dto.getUserid());
			
			//executeUpdate() 메소드는 삽입, 수정, 삭제와 관련된 SQL문(DML) 실행에 쓰인다.
			pstmt.executeUpdate();//insert, update, delete
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}//update()

	public void delete(String userid) {
		//JDBC연동객체 선언
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			//DB와 연결
			conn = DB.getConn();
			
			//DB에 보낼 쿼리문
			String sql="delete from client where userid=?";
			//쿼리문을 보내고 sql을 실행할 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			//setString(n번째 물음표(위치), 위치에 대입할 값은 폼에서 받아온 아이디)
			pstmt.setString(1, userid);
			
			//executeUpdate() 메소드를 이용하여 레코드 삭제
			pstmt.executeUpdate();//insert, update, delete
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}//delete()
}
