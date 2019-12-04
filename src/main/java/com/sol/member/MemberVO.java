package com.sol.member;

import java.util.Date;


public class MemberVO {
	private int userNum;		//유저 번호
	private String userId;		//유저 아이디
	private String userPassword;//유저 비밀번호
	private String userPwfindQ;	//유저 비밀번호질문
	private String userPwfindA; //유저 비밀번호답변
	private String userName;	//유저 이름
	private String userPnum1;		//유저 전화번호
	private String userBirth;		//유저 생년월일
	private String userBirth1;		//유저 태어난해
	private String userBirth2;		//유저 월
	private String userBirth3;		//유저 일
	private String userAddress; //유저 주소
	private String userAddress2; //유저 상세주소
	private String userGender;	//유저 성별
	private int userPoint;		//유저 포인트
	private String userEmail;	//유저 이메일
	private String userEmailAgree;//유저 이메일동의
	private Date userRegdate;	//유저 가입일
	
	public MemberVO() {
		// TODO Auto-generated constructor stub
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserPwfindQ() {
		return userPwfindQ;
	}

	public void setUserPwfindQ(String userPwfindQ) {
		this.userPwfindQ = userPwfindQ;
	}

	public String getUserPwfindA() {
		return userPwfindA;
	}

	public void setUserPwfindA(String userPwfindA) {
		this.userPwfindA = userPwfindA;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPnum1() {
		return userPnum1;
	}

	public void setUserPnum1(String userPnum1) {
		this.userPnum1 = userPnum1;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserBirth1() {
		return userBirth1;
	}

	public void setUserBirth1(String userBirth1) {
		this.userBirth1 = userBirth1;
	}

	public String getUserBirth2() {
		return userBirth2;
	}

	public void setUserBirth2(String userBirth2) {
		this.userBirth2 = userBirth2;
	}

	public String getUserBirth3() {
		return userBirth3;
	}

	public void setUserBirth3(String userBirth3) {
		this.userBirth3 = userBirth3;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserAddress2() {
		return userAddress2;
	}

	public void setUserAddress2(String userAddress2) {
		this.userAddress2 = userAddress2;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public int getUserPoint() {
		return userPoint;
	}

	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserEmailAgree() {
		return userEmailAgree;
	}

	public void setUserEmailAgree(String userEmailAgree) {
		this.userEmailAgree = userEmailAgree;
	}

	public Date getUserRegdate() {
		return userRegdate;
	}

	public void setUserRegdate(Date userRegdate) {
		this.userRegdate = userRegdate;
	}

	@Override
	public String toString() {
		return "MemberVO [userNum=" + userNum + ", userId=" + userId + ", userPassword=" + userPassword
				+ ", userPwfindQ=" + userPwfindQ + ", userPwfindA=" + userPwfindA + ", userName=" + userName
				+ ", userPnum1=" + userPnum1 + ", userBirth=" + userBirth + ", userBirth1=" + userBirth1
				+ ", userBirth2=" + userBirth2 + ", userBirth3=" + userBirth3 + ", userAddress=" + userAddress
				+ ", userAddress2=" + userAddress2 + ", userGender=" + userGender + ", userPoint=" + userPoint
				+ ", userEmail=" + userEmail + ", userEmailAgree=" + userEmailAgree + ", userRegdate=" + userRegdate
				+ ", getUserNum()=" + getUserNum() + ", getUserId()=" + getUserId() + ", getUserPassword()="
				+ getUserPassword() + ", getUserPwfindQ()=" + getUserPwfindQ() + ", getUserPwfindA()="
				+ getUserPwfindA() + ", getUserName()=" + getUserName() + ", getUserPnum1()=" + getUserPnum1()
				+ ", getUserBirth()=" + getUserBirth() + ", getUserBirth1()=" + getUserBirth1() + ", getUserBirth2()="
				+ getUserBirth2() + ", getUserBirth3()=" + getUserBirth3() + ", getUserAddress()=" + getUserAddress()
				+ ", getUserAddress2()=" + getUserAddress2() + ", getUserGender()=" + getUserGender()
				+ ", getUserPoint()=" + getUserPoint() + ", getUserEmail()=" + getUserEmail() + ", getUserEmailAgree()="
				+ getUserEmailAgree() + ", getUserRegdate()=" + getUserRegdate() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

	public MemberVO(int userNum, String userId, String userPassword, String userPwfindQ, String userPwfindA,
			String userName, String userPnum1, String userBirth, String userBirth1, String userBirth2,
			String userBirth3, String userAddress, String userAddress2, String userGender, int userPoint,
			String userEmail, String userEmailAgree, Date userRegdate) {
		super();
		this.userNum = userNum;
		this.userId = userId;
		this.userPassword = userPassword;
		this.userPwfindQ = userPwfindQ;
		this.userPwfindA = userPwfindA;
		this.userName = userName;
		this.userPnum1 = userPnum1;
		this.userBirth = userBirth;
		this.userBirth1 = userBirth1;
		this.userBirth2 = userBirth2;
		this.userBirth3 = userBirth3;
		this.userAddress = userAddress;
		this.userAddress2 = userAddress2;
		this.userGender = userGender;
		this.userPoint = userPoint;
		this.userEmail = userEmail;
		this.userEmailAgree = userEmailAgree;
		this.userRegdate = userRegdate;
	}

	
	
	
}
