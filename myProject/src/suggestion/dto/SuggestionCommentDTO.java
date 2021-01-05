package suggestion.dto;

import java.util.Date;

public class SuggestionCommentDTO {
	private int comment_num;//댓글 번호
	private int suggestion_num;//게시물 번호
	private String writer;//작성자
	
	private String content;//댓글 본문
	private Date reg_date;//댓글 게시 시간
	//getter,setter,toString 까지만
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getSuggestion_num() {
		return suggestion_num;
	}
	public void setSuggestion_num(int suggestion_num) {
		this.suggestion_num = suggestion_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
		return "SuggestionCommentDTO [comment_num=" + comment_num + ", suggestion_num=" + suggestion_num + ", writer="
				+ writer + ", content=" + content + ", reg_date=" + reg_date + "]";
	}
}
