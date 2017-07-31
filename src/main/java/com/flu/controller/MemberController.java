package com.flu.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.flu.alarm.AlarmDTO;
import com.flu.alarm.AlarmService;

import com.flu.applicant.ApplicantService;
import com.flu.checkMember.CheckMemberService;

import com.flu.file.FileSaver;
import com.flu.meetRoom.MeetRoomDTO;
import com.flu.meetRoom.MeetRoomServiceImpl;
import com.flu.member.MemberDTO;
import com.flu.member.MemberService;

import com.flu.reservation.ReservationDTO;
import com.flu.room.RoomDTO;

import com.flu.util.ListInfo;

@Controller
@RequestMapping(value="/member/**")
public class MemberController {

	@Inject
	private MemberService memberService;
	@Inject
	private AlarmService alarmService;

	@Inject
	private CheckMemberService checkMemberService;
	
	private AlarmDTO alarmDTO;

	//AJAX 뒤로가기 테스트
	@RequestMapping(value="test")
	public void test(){
		
	}
	
	//멤버 이메일 가져오기
	private String getEmail(HttpSession session){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		return memberDTO.getEmail();
	}
	
	//사이트 회원 가입폼 이동
		@RequestMapping(value="MemberJoin", method=RequestMethod.GET)
		public String MemberJoin(){
			return "member/memberJoinForm";
		}
		//사이트 회원 가입
		@RequestMapping(value="MemberJoin", method=RequestMethod.POST)
		public String MemberJoin(MemberDTO memberDTO) throws Exception{
			

			int result = memberService.memberInsert(memberDTO);

			if(result > 0){
				this.EmailAccess(memberDTO.getEmail());
			}
			
			
			//알람 디비에 인서트
			AlarmDTO alarmDTO = new AlarmDTO();
			alarmDTO.setEmail(memberDTO.getEmail());
			alarmDTO.setContents("회원가입이 성공적으로 이루어졌습니다.");
			alarmService.alarmInsert(alarmDTO);
			System.out.println("회원가입 성공");
			return "/member/emailCK";
		}
		//이메일 미인증시 화면
		@RequestMapping(value="emailCK")
		public String emailCK(){
			System.out.println("이메일 미인증화면");
			
			return "/member/emailCK";
		}
		
		//이메일 중복 확인
		@RequestMapping(value="jungbokCK", method=RequestMethod.POST)
		@ResponseBody
		public String jungbokCK(String email){
			System.out.println("중복확인 이메일 : "+email);
			return memberService.jungbok(email);
		}
		
		
		//Email 인증
		private void EmailAccess(String email){
			StringBuffer buffer = new StringBuffer();
			for(int i = 0; i<= 6; i++){
				int n = (int) (Math.random()*10);
				buffer.append(n);
			}
			memberService.EmailAccess(email, buffer.toString());
			
			
			
		}
		
		//Email 인증 확인
		@RequestMapping(value="EmailAccessCk")
		public String EmailAccessCk(String num, String email){
			
			System.out.println(memberService.memberView(email).getEmail());
			System.out.println(memberService.memberView(email).getEmailcheck());
			
			if(num.equals(memberService.memberView(email).getEmailcheck()) && email.equals(memberService.memberView(email).getEmail())){
				MemberDTO memberDTO = new MemberDTO();
				memberDTO.setEmail(email);
				memberDTO.setEmailcheck("1");
				if(!num.equals("1")){
					memberService.emailck(memberDTO);
				}
				return "redirect:/";
			}else{
				return "redirect:/member/memberJoinForm";
			}
			
		}
		
		//로그인 폼
		@RequestMapping(value="login", method=RequestMethod.GET)
		public void login(){
			
		}
		
		//로그인 
		@RequestMapping(value="login", method=RequestMethod.POST)
		public ModelAndView login(MemberDTO memberDTO, HttpSession session) throws Exception{
			ModelAndView mv = new ModelAndView();
			memberDTO = memberService.login(memberDTO);
			String message = "0";
			if(memberDTO != null){
				alarmDTO = new AlarmDTO();
				session.setAttribute("member", memberDTO);
				message= "1";
				alarmDTO.setEmail(memberDTO.getEmail());
				mv.addObject("alarm", alarmService.alarmCount(alarmDTO));
				System.out.println(alarmService.alarmCount(alarmDTO));
				mv.setViewName("/member/myflu");
				return mv;
			}else{
				mv.addObject("message", message);
				mv.setViewName("/member/login");
				return mv;
				
			}
		}
		//로그아웃
		@RequestMapping(value="logout")
		public String logout(HttpSession session){
			session.invalidate();
			return "redirect:/";
		}
		
		
		//MY FLU
		@RequestMapping(value="myflu")
		public void myflu(){
			
		}
		
		
		//MY PAGE
		@RequestMapping(value="mypage")
		public String mypage(HttpSession session, Model model){
			MemberDTO memberDTO =  (MemberDTO)session.getAttribute("member");
			
			if(memberDTO.getKind().equals("client")){
				
				return "redirect:/member/client/mypage";
			}else{
				return "redirect:/member/freelancermypage";
			}
			//model.addAttribute("active1", "a");
			/*return "/member/freelancer/mypage";*/
		}
		
		
		
		
		//멤버 테스트 페이지
		@RequestMapping(value="memberTest")
		public void memberTest(){
			
		}
		
		//계정 정보 등록 폼
		@RequestMapping(value="personaldataInsert", method=RequestMethod.GET)
		public String psersonaldataInsert(Model model){
			
			
			model.addAttribute("path", "personaldataInsert");
			model.addAttribute("active1", "a");
			return "/member/personaldataform";
		}
		//계정 등록(내정보 수정)
		@RequestMapping(value="personaldataInsert", method=RequestMethod.POST)
		public String psersonaldataInsert(MemberDTO memberDTO, Model model, HttpSession session) throws Exception
		{
			System.out.println(memberDTO.getEmail());
			System.out.println(memberDTO.getType());
			System.out.println(memberDTO.getName());
			System.out.println(memberDTO.getNamegender());
			System.out.println(memberDTO.getBirth());
			System.out.println(memberDTO.getAddr_num());
			System.out.println(memberDTO.getAddr_main());
			System.out.println(memberDTO.getAddr_detail());
			
			System.out.println(memberDTO.getPhone());
			System.out.println(memberDTO.getPhone2());
			System.out.println(memberDTO.getFax());
			System.out.println("-------------------------");
			
			String realPath = session.getServletContext().getRealPath("resources/profile");
			
			FileSaver fileSaver = new FileSaver();
			try {
				String fileName = fileSaver.fileSave(realPath, memberDTO.getF1());
				memberDTO.setfProfileImage(fileName);
				memberDTO.setoProfileImage(memberDTO.getF1().getOriginalFilename());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(memberDTO.getfProfileImage());
			System.out.println(memberDTO.getoProfileImage());
			
			int result = memberService.memberUpdate(memberDTO);
			if(result>0){
				session.setAttribute("member", memberService.memberView(this.getEmail(session)));
				//알람 디비에 인서트
				AlarmDTO alarmDTO = new AlarmDTO();
				alarmDTO.setEmail(((MemberDTO)session.getAttribute("member")).getEmail());
				alarmDTO.setContents("개인정보를 성공적으로 등록 하셨습니다.");
				alarmService.alarmInsert(alarmDTO);
			}
			
			return "redirect:/member/personaldataView";
		}
		
		//계정 정보 뷰
		@RequestMapping(value="personaldataView", method=RequestMethod.GET)
		public String personaldataView(Model model, HttpSession session,String email){
			
			if(((MemberDTO)session.getAttribute("member")).getType().equals("admin")){
				model.addAttribute("active1", "a");
				model.addAttribute("dto", checkMemberService.checkView(email));
				
			}else{
				model.addAttribute("active1", "a");
				model.addAttribute("dto", memberService.memberView(this.getEmail(session)));
			}
			

			return "/member/personaldata";
		}
		
		//내정보 수정 폼
		@RequestMapping(value="personaldataUpdate", method=RequestMethod.GET)
		public String personaldataUpdate(Model model, HttpSession session){
			
			
			model.addAttribute("dto", memberService.memberView(this.getEmail(session)));
			model.addAttribute("path", "personaldataUpdate");
			model.addAttribute("active1", "a");
			return "/member/personaldataform";
		}
		
		//내정보 수정
		@RequestMapping(value="personaldataUpdate", method=RequestMethod.POST)
		public String personaldataUpdate(MemberDTO memberDTO, HttpSession session) throws Exception{
			
			System.out.println(memberDTO.getEmail());
			System.out.println(memberDTO.getType());
			System.out.println(memberDTO.getName());
			System.out.println(memberDTO.getNamegender());
			System.out.println(memberDTO.getBirth());
			System.out.println(memberDTO.getAddr_num());
			System.out.println(memberDTO.getAddr_main());
			System.out.println(memberDTO.getAddr_detail());
			
			System.out.println(memberDTO.getPhone());
			System.out.println(memberDTO.getPhone2());
			System.out.println(memberDTO.getFax());
			System.out.println("-------------------------");
			
			String realPath = session.getServletContext().getRealPath("resources/profile");
			
			FileSaver fileSaver = new FileSaver();
			try {
				if(!memberDTO.getF1().getOriginalFilename().equals("")){
					String fileName = fileSaver.fileSave(realPath, memberDTO.getF1());
					memberDTO.setfProfileImage(fileName);
					memberDTO.setoProfileImage(memberDTO.getF1().getOriginalFilename());
				}else{
					memberDTO.setfProfileImage(((MemberDTO)session.getAttribute("member")).getfProfileImage());
					memberDTO.setoProfileImage(((MemberDTO)session.getAttribute("member")).getoProfileImage());
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(memberDTO.getfProfileImage());
			System.out.println(memberDTO.getoProfileImage());
			
			
			int result = memberService.memberUpdate(memberDTO);
			if(result>0){
				session.setAttribute("member", memberService.memberView(this.getEmail(session)));
				//알람 디비에 인서트
				AlarmDTO alarmDTO = new AlarmDTO();
				alarmDTO.setEmail(((MemberDTO)session.getAttribute("member")).getEmail());
				alarmDTO.setContents("개인정보를 수정을 하셨습니다.");
				alarmService.alarmInsert(alarmDTO);
			}

			return "redirect:/member/personaldataView";
		}
		
		

		//미팅룸 예약 현황 가져오기 
		@RequestMapping(value="myMeetRoom", method=RequestMethod.GET)
		public void MemberReservedList(HttpSession session, ListInfo listInfo, Model model) throws Exception{
			
			//관리자를 위한 미팅룸 예약현황 리스트 가져오기 reservation 테이블에 있는 모든 데이터를 가져온다.
			List<ReservationDTO> ar = null;
			//세션이 사용자 인경우
			if(!((MemberDTO)session.getAttribute("member")).getEmail().equals("admin")){
				System.out.println("세션이 회원입니다.");
				MemberDTO memberDTO = new MemberDTO();
				memberDTO.setEmail(((MemberDTO)session.getAttribute("member")).getEmail());
				
				ar = memberService.memberReservedList(memberDTO);
				
			//세션이 관리자인경우	
			}else if(((MemberDTO)session.getAttribute("member")).getEmail().equals("admin")){
				System.out.println("세션이 관리자 입니다.");
				ar =  memberService.adminReservedlist(listInfo);
				
			}
			
			if(ar!=null){
				for(int i=0;i<ar.size();i++){
					ar.get(i).setTime(ar.get(i).getTime().replaceAll(",", "~"));
					
				}
				
				model.addAttribute("list", ar);
				model.addAttribute("listInfo", listInfo);
			}				
			
		}

		
}
