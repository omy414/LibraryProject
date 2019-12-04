package com.sol.member;

import java.nio.ByteBuffer;
import java.security.AlgorithmParameters;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;


@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDAO MemberDAO;
	 
	@Override
	public void create(MemberVO vo) throws Exception{
		String userId = vo.getUserId();
		String userPassword = vo.getUserPassword();
		String userPwfindQ = vo.getUserPwfindQ();
		String userPwfindA = vo.getUserPwfindA();
		String userName = vo.getUserName();
		String userPnum1 = vo.getUserPnum1();
		String userBirth1 = vo.getUserBirth1();
		String userBirth2 = vo.getUserBirth2();
		String userBirth3 = vo.getUserBirth3();
		String userAddress = vo.getUserAddress();
		String userAddress2 = vo.getUserAddress2();
		String userGender = vo.getUserGender();
		int userPoint = vo.getUserPoint();
		String userEmail = vo.getUserEmail();
		String userEmailAgree = vo.getUserEmailAgree();
		
		
		userAddress = userAddress + " " + userAddress2;
		String userBirth = userBirth1+"-"+userBirth2+"-"+userBirth3;
		String str = encryptAES256(userPassword, "sdfsdf"); //암호화할 방식
		
		vo.setUserId(userId);
		vo.setUserPassword(str);
		vo.setUserPwfindQ(userPwfindQ);
		vo.setUserPwfindA(userPwfindA);
		vo.setUserName(userName);
		vo.setUserPnum1(userPnum1);
		vo.setUserBirth(userBirth);
		vo.setUserAddress(userAddress);
		vo.setUserGender(userGender);
		vo.setUserPoint(userPoint);
		vo.setUserEmail(userEmail);
		vo.setUserEmailAgree(userEmailAgree);
		
		MemberDAO.create(vo);
	}
	
	
	//로그인 처리 ----------------------------------------------------
	@Override
	public boolean idcheck(MemberVO vo, HttpSession session) throws Exception {
		
		MemberVO data = new MemberVO();
		boolean result = false;
		
		 // 비밀번호 가져오기
		data = MemberDAO.selectPw(vo);
		
		if(data != null) {
			// 가져온 비밀번호 복호화
			String str = decryptAES256(data.getUserPassword().toString(), "sdfsdf");
			System.out.println(str);
			// 입력한 값과 복호화한 비밀번호 비교
			if(str.equals(vo.getUserPassword().toString())) {
				result = MemberDAO.idcheck(vo);	
				MemberVO userId2= viewMember(vo);
				session.setAttribute("userId", userId2.getUserId().toString());
				session.setAttribute("userName", userId2.getUserName().toString());
				session.setAttribute("userNum", userId2.getUserNum());
				System.out.println("참");
			} else {
				result = false;
				System.out.println("거짓");
			}
		}else {
			return false;
		}
		
		return result;
	}
	
	public MemberVO viewMember(MemberVO vo) {
		return MemberDAO.viewMember(vo);
	}
	
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	
	public static String encryptAES256(String msg, String key) throws Exception {
		SecureRandom random = new SecureRandom();
		byte bytes[] = new byte[20];
		random.nextBytes(bytes);
		byte[] saltBytes = bytes;
		// Password-Based Key Derivation function 2
		SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
		// 70000번 해시하여 256 bit 길이의 키를 만든다.
		PBEKeySpec spec = new PBEKeySpec(key.toCharArray(), saltBytes, 70000, 256);
		SecretKey secretKey = factory.generateSecret(spec);
		SecretKeySpec secret = new SecretKeySpec(secretKey.getEncoded(), "AES");
		// 알고리즘/모드/패딩
		// CBC : Cipher Block Chaining Mode
		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		cipher.init(Cipher.ENCRYPT_MODE, secret);
		AlgorithmParameters params = cipher.getParameters();
		// Initial Vector(1단계 암호화 블록용)
		byte[] ivBytes = params.getParameterSpec(IvParameterSpec.class).getIV();
		byte[] encryptedTextBytes = cipher.doFinal(msg.getBytes("UTF-8"));
		byte[] buffer = new byte[saltBytes.length + ivBytes.length + encryptedTextBytes.length];
		System.arraycopy(saltBytes, 0, buffer, 0, saltBytes.length);
		System.arraycopy(ivBytes, 0, buffer, saltBytes.length, ivBytes.length);
		System.arraycopy(encryptedTextBytes, 0, buffer, saltBytes.length + ivBytes.length, encryptedTextBytes.length);
		return Base64.getEncoder().encodeToString(buffer);
	}

	// 복호화
	public static String decryptAES256(String msg, String key) throws Exception {
		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		ByteBuffer buffer = ByteBuffer.wrap(Base64.getDecoder().decode(msg));
		byte[] saltBytes = new byte[20];
		buffer.get(saltBytes, 0, saltBytes.length);
		byte[] ivBytes = new byte[cipher.getBlockSize()];
		buffer.get(ivBytes, 0, ivBytes.length);
		byte[] encryoptedTextBytes = new byte[buffer.capacity() - saltBytes.length - ivBytes.length];
		buffer.get(encryoptedTextBytes);
		SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
		PBEKeySpec spec = new PBEKeySpec(key.toCharArray(), saltBytes, 70000, 256);
		SecretKey secretKey = factory.generateSecret(spec);
		SecretKeySpec secret = new SecretKeySpec(secretKey.getEncoded(), "AES");
		cipher.init(Cipher.DECRYPT_MODE, secret, new IvParameterSpec(ivBytes));
		byte[] decryptedTextBytes = cipher.doFinal(encryoptedTextBytes);
		return new String(decryptedTextBytes);
	}
}
