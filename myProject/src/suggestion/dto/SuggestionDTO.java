package suggestion.dto;

import java.sql.Date;

public class SuggestionDTO {
	private int num;//게시물 번호
	private String writer;//작성자(client 테이블의 userid 참조하는 외래키)
	private String subject;//제목
	private String passwd;//게시물 작성할 때 사용할 비밀번호
	private Date reg_date;//작성일자
	private int readcount;//조회수
	
	private int ref;//게시물 그룹
	private int re_step;//게시물 그룹의 순번
	private int re_level;//답변 단계
	
	private String content;//본문
	private String ip;//작성자 ip
	private int comment_count;	//댓글 갯수, DB테이블에는 없음
	
	private String filename;//파일 이름
	private int filesize;//파일 사이즈
	private int down;//다운로드 횟수
	
	private String ext;//첨부파일의 확장자, DB테이블에는 없음
	private String show;//테이블을 보여줄지 말지 결정
	//getter, setter, toString
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public int getDown() {
		return down;
	}
	public void setDown(int down) {
		this.down = down;
	}
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	@Override
	public String toString() {
		return "SuggestionDTO [num=" + num + ", writer=" + writer + ", subject=" + subject + ", passwd=" + passwd
				+ ", reg_date=" + reg_date + ", readcount=" + readcount + ", ref=" + ref + ", re_step=" + re_step
				+ ", re_level=" + re_level + ", content=" + content + ", ip=" + ip + ", comment_count=" + comment_count
				+ ", filename=" + filename + ", filesize=" + filesize + ", down=" + down + ", ext=" + ext + ", show="
				+ show + "]";
	}
}
