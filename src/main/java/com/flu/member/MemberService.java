package com.flu.member;

import java.util.List;
import java.util.Map;
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

import com.flu.alarm.AlarmDTO;
import com.flu.applicant.ApplicantDTO;
import com.flu.checkMember.CheckMemberViewDTO;
import com.flu.project.ProjectDTO;
import com.flu.reservation.ReservationDTO;
import com.flu.util.ListInfo;

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
				"<a href=\"http://localhost/flu/member/EmailAccessCk?num="+num+"&email="+email+"\">이메일 주소 인증하기</a>";

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
	public CheckMemberViewDTO memberView(String email){
		return memberDAO.memberView(email);
	}

	public MemberDTO memberView2(String email){
		return memberDAO.memberView2(email);
	}
	//회원 리스트(회원가입폼에 뿌려줌)
	public Map<String, Object> memberList(){
		return memberDAO.memberList();
	}

	//회원 정보 수정
	public int memberUpdate(MemberDTO memberDTO){
		return memberDAO.memberUpdate(memberDTO);
	}


	//예약현황 리스트
	public List<ReservationDTO> memberReservedList(MemberDTO memberDTO) throws Exception{
		return memberDAO.memberReservedList(memberDTO);
	}
	//예약현황 리스트 ( 관리자 전용 )
	public List<ReservationDTO> adminReservedlist(ListInfo listInfo) throws  Exception{
		int totalCount = memberDAO.totalCount();
		listInfo.makePage(totalCount);
		listInfo.makeRow();
		return memberDAO.adminReservedList(listInfo);
	}
	
	//진행중인 프로젝트 리스트
	public List<ProjectDTO> memberProjectList_ING(String email) throws Exception{
		return memberDAO.memberProjectList_ING(email);
	}
	//지원한 프로젝트 리스트
	public List<ProjectDTO> memberProjectList_APP(String email) throws Exception{
		return memberDAO.memberProjectList_APP(email);
	}
	//완료한 프로젝트 리스트
	public List<ProjectDTO> memberProjectList_FIN(String email) throws Exception{
		return memberDAO.memberProjectList_FIN(email);
	}
	//검수중인 프로젝트 리스트
	public List<ProjectDTO> memberProjecttList_CHK(String email) throws Exception{
		return memberDAO.memberProjecttList_CHK(email);
	}
	//지원자 모집중인 프로젝트 리스트
	public List<ProjectDTO> memberProjectList_REC(String email) throws Exception{
		return memberDAO.memberProjectList_REC(email);
	}
	//진행중인 프로젝트 리스트
	public List<ProjectDTO> memberProjectList_INGC(String email) throws Exception{
		return memberDAO.memberProjectList_INGC(email);
	}
	//진행중인 프로젝트 카운트(프리랜서)
	public int memberProjectCount_ING(String email) throws Exception{
		return memberDAO.memberProjectCount_ING(email);
	}
	//지원한 프로젝트 카운트(프리랜서)
	public int memberProjectCount_APP(String email) throws Exception{
		return memberDAO.memberProjectCount_APP(email);
	}
	//완료한 프로젝트 카운트(프리랜서)
	public int memberProjectCount_FIN(String email) throws Exception{
		return memberDAO.memberProjectCount_FIN(email);
	}
	//누적완료금액(프리랜서)
	public int memberProjectSumPay(String email) throws Exception{
		return memberDAO.memberProjectSumPay(email);
	}
	//등록한 프로젝트(클라이언트)
	public int memberProjectCount_CHK(String email) throws Exception{
		return memberDAO.memberProjectCount_CHK(email);
	}
	
	
	//진행중인 프로젝트카운트(클라이언트)
	public int memberProjectCount_INGC(String email) throws Exception{
		return memberDAO.memberProjectCount_INGC(email);
	}
	//완료한 프로젝트카운트(클라이언트)
	public int memberProjectCount_FINC(String email) throws Exception{
		return memberDAO.memberProjectCount_FINC(email);
	}
	//누적완료금액 ( 클라이언트)
	public int memberProjectSumBudget(String email) throws Exception{
		return memberDAO.memberProjectSumBudget(email);
	}
	//myflu에 뿌려질 알람 리스트
	public List<AlarmDTO> memberAlarmList(String email) throws Exception{
		return memberDAO.memberAlarmList(email);
	}
}
