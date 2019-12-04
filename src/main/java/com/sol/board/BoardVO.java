package com.sol.board;

import java.util.Date;


public class BoardVO {
	private int bno;		//게시글번호
	private String userId;	//작성자
	private String title;	//제목
	private String content;	//내용
	private Date regdate;	//작성일
	private int viewcnt;	//조회수
	private int recnt; 		//게시글 댓글의 수 추가
	private int contentgood;//좋아요
	private int contentbad;	//싫어요
	private Date modidate;	//수정일
	
	
	public BoardVO() {
		// TODO Auto-generated constructor stub
	}


	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}


	public int getViewcnt() {
		return viewcnt;
	}


	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}


	public int getRecnt() {
		return recnt;
	}


	public void setRecnt(int recnt) {
		this.recnt = recnt;
	}


	public int getContentgood() {
		return contentgood;
	}


	public void setContentgood(int contentgood) {
		this.contentgood = contentgood;
	}


	public int getContentbad() {
		return contentbad;
	}


	public void setContentbad(int contentbad) {
		this.contentbad = contentbad;
	}


	public Date getModidate() {
		return modidate;
	}


	public void setModidate(Date modidate) {
		this.modidate = modidate;
	}


	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", userId=" + userId + ", title=" + title + ", content=" + content + ", regdate="
				+ regdate + ", viewcnt=" + viewcnt + ", recnt=" + recnt + ", contentgood=" + contentgood
				+ ", contentbad=" + contentbad + ", modidate=" + modidate + ", getBno()=" + getBno() + ", getUserId()="
				+ getUserId() + ", getTitle()=" + getTitle() + ", getContent()=" + getContent() + ", getRegdate()="
				+ getRegdate() + ", getViewcnt()=" + getViewcnt() + ", getRecnt()=" + getRecnt() + ", getContentgood()="
				+ getContentgood() + ", getContentbad()=" + getContentbad() + ", getModidate()=" + getModidate()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}


	public BoardVO(int bno, String userId, String title, String content, Date regdate, int viewcnt, int recnt,
			int contentgood, int contentbad, Date modidate) {
		super();
		this.bno = bno;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.viewcnt = viewcnt;
		this.recnt = recnt;
		this.contentgood = contentgood;
		this.contentbad = contentbad;
		this.modidate = modidate;
	}


	
	
	
}
