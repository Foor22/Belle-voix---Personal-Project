package notice.dto;

import java.util.Date;

public class NoticeCommentDTO {
	private int comment_num;//댓글 번호
	private int notice_num;//게시물 번호
	private String writer;//작성자
	
	private int comment_ref;//댓글 그룹
	private int comment_re_step;//댓글 그룹의 순번
	private int comment_re_level;//답변 단계
	
	private String content;//댓글 본문
	private Date reg_date;//댓글 게시 시간
	//getter,setter,toString 까지만
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getComment_ref() {
		return comment_ref;
	}
	public void setComment_ref(int comment_ref) {
		this.comment_ref = comment_ref;
	}
	public int getComment_re_step() {
		return comment_re_step;
	}
	public void setComment_re_step(int comment_re_step) {
		this.comment_re_step = comment_re_step;
	}
	public int getComment_re_level() {
		return comment_re_level;
	}
	public void setComment_re_level(int comment_re_level) {
		this.comment_re_level = comment_re_level;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "NoticeCommentDTO [comment_num=" + comment_num + ", notice_num=" + notice_num + ", writer=" + writer
				+ ", comment_ref=" + comment_ref + ", comment_re_step=" + comment_re_step + ", comment_re_level="
				+ comment_re_level + ", content=" + content + ", reg_date=" + reg_date + "]";
	}
}
