package com.sol.reply;

import java.util.Date;

public class ReplyVO {

		private Integer rno; //댓글번호
		private Integer bno; //게시글번호
		private String reply_content; //댓글 내용
		private String userId; //댓글 작성자
		private String userName; //댓글 작성자의 이름
		private Date reply_regdate; //댓글 작성일자
		private Date updatedate; //댓글 수정일자
		private int reply_contentgood; //댓글 좋아요
		private int reply_contentbod; //댓글 싫어요
		
		public ReplyVO() {
			// TODO Auto-generated constructor stub
		}

		public Integer getRno() {
			return rno;
		}

		public void setRno(Integer rno) {
			this.rno = rno;
		}

		public Integer getBno() {
			return bno;
		}

		public void setBno(Integer bno) {
			this.bno = bno;
		}

		public String getReply_content() {
			return reply_content;
		}

		public void setReply_content(String reply_content) {
			this.reply_content = reply_content;
		}

		public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
			this.userId = userId;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}

		public Date getReply_regdate() {
			return reply_regdate;
		}

		public void setReply_regdate(Date reply_regdate) {
			this.reply_regdate = reply_regdate;
		}

		public Date getUpdatedate() {
			return updatedate;
		}

		public void setUpdatedate(Date updatedate) {
			this.updatedate = updatedate;
		}

		public int getReply_contentgood() {
			return reply_contentgood;
		}

		public void setReply_contentgood(int reply_contentgood) {
			this.reply_contentgood = reply_contentgood;
		}

		public int getReply_contentbod() {
			return reply_contentbod;
		}

		public void setReply_contentbod(int reply_contentbod) {
			this.reply_contentbod = reply_contentbod;
		}

		@Override
		public String toString() {
			return "ReplyVO [rno=" + rno + ", bno=" + bno + ", reply_content=" + reply_content + ", userId=" + userId
					+ ", userName=" + userName + ", reply_regdate=" + reply_regdate + ", updatedate=" + updatedate
					+ ", reply_contentgood=" + reply_contentgood + ", reply_contentbod=" + reply_contentbod
					+ ", getRno()=" + getRno() + ", getBno()=" + getBno() + ", getReply_content()=" + getReply_content()
					+ ", getUserId()=" + getUserId() + ", getUserName()=" + getUserName() + ", getReply_regdate()="
					+ getReply_regdate() + ", getUpdatedate()=" + getUpdatedate() + ", getReply_contentgood()="
					+ getReply_contentgood() + ", getReply_contentbod()=" + getReply_contentbod() + ", getClass()="
					+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
		}

		public ReplyVO(Integer rno, Integer bno, String reply_content, String userId, String userName,
				Date reply_regdate, Date updatedate, int reply_contentgood, int reply_contentbod) {
			super();
			this.rno = rno;
			this.bno = bno;
			this.reply_content = reply_content;
			this.userId = userId;
			this.userName = userName;
			this.reply_regdate = reply_regdate;
			this.updatedate = updatedate;
			this.reply_contentgood = reply_contentgood;
			this.reply_contentbod = reply_contentbod;
		}
		
		
		
}
