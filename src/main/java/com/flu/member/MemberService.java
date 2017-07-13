package com.flu.member;

import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Inject
	private MemberDAO memberDAO;

	public void EmailAccess(String email, String num) {
		// TODO Auto-generated method stub
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setEmail(email);
		memberDTO.setEmailcheck(num);
		memberDAO.emailck(memberDTO);
		
		String host = "smtp.gmail.com";
		String subject ="인증번호 전달";
		String fromName ="이메일 테스트 관리자임";
		String from = "flu3793@gmail.com";
		String to1 = email;
		System.out.println("이메일 : "+to1);
		System.out.println(num);
		String content = 
				"<a href=\"http://localhost/flu/member/EmailAccessCk?num="+num+"&email="+email+"\">이메일 주소 인증하기</a>"
				
;
		
		try{
			Properties props = new Properties();
			//G-Mail SMTP 사용시
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mai.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			
			Session mailSession = Session.getInstance(props,
					new javax.mail.Authenticator(){
						protected PasswordAuthentication getPasswordAuthentication(){
							return new PasswordAuthentication("flu3793@gmail.com", "1q2w3e4r!");
						}
			});
			
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
			
			InternetAddress[] address1 = { new InternetAddress(to1) };
			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html;charset=euc-kr");
			
			Transport.send(msg);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//이메일 인증 클릭
	public int emailck(MemberDTO memberDTO){
		
		return memberDAO.emailck(memberDTO);
	}
	
	//아이디 중복확인
	public String jungbok(String email){
		
		return memberDAO.jungbok(email);
	}
	
	//로그인
	public MemberDTO login(MemberDTO memberDTO){
		
		return memberDAO.login(memberDTO);
	}
	
	//회원가입
	public int memberInsert(MemberDTO memberDTO){
		
		return memberDAO.memberInsert(memberDTO);
	}
	
	
	//회원 정보
	public MemberDTO memberView(String email){
		return memberDAO.memberView(email);
	}
}
