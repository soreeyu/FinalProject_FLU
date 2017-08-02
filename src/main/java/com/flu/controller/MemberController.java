package com.flu.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.flu.alarm.AlarmDTO;
import com.flu.alarm.AlarmService;
import com.flu.checkMember.CheckMemberService;
import com.flu.checkMember.CheckMemberViewDTO;
import com.flu.file.FileSaver;
import com.flu.member.MemberDTO;
import com.flu.member.MemberService;

@Controller
@RequestMapping(value="/member/**")
public class MemberController {

	@Inject
	private MemberService memberService;


	@Inject
	private AlarmService alarmService;
	private AlarmDTO alarmDTO;
	
	@Inject
	private CheckMemberService checkMemberService;
	
	

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
		public String MemberJoin(MemberDTO memberDTO){
			
			
			int result =memberService.memberInsert(memberDTO);
			if(result > 0){
				this.EmailAccess(memberDTO.getEmail());
			}
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
			System.out.println(memberService.memberView2(email).getEmail());
			System.out.println(memberService.memberView2(email).getEmailcheck());

			
			if(num.equals(memberService.memberView2(email).getEmailcheck()) && email.equals(memberService.memberView2(email).getEmail())){
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
				mv.addObject("alarmCount", alarmService.alarmCount(alarmDTO));
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
			model.addAttribute("alarmCount", alarmService.alarmCount(alarmDTO));

			return "redirect:/member/personaldataView";
		}
		
		//계정 정보 뷰
		@RequestMapping(value="personaldataView", method=RequestMethod.GET)
		public String personaldataView(Model model, HttpSession session,String email){
			
			if(((MemberDTO)session.getAttribute("member")).getKind().equals("admin")){
				model.addAttribute("active1", "a");
				model.addAttribute("dto", checkMemberService.checkView(email));
				
			}else{
				model.addAttribute("active1", "a");
				model.addAttribute("dto", memberService.memberView2(this.getEmail(session)));
			}
			

			return "/member/personaldata";
		}
		
		//내정보 수정 폼
		@RequestMapping(value="personaldataUpdate", method=RequestMethod.GET)
		public String personaldataUpdate(Model model, HttpSession session){
			
			
			model.addAttribute("dto", memberService.memberView2(this.getEmail(session)));
			model.addAttribute("path", "personaldataUpdate");
			model.addAttribute("active1", "a");
			return "/member/personaldataform";
		}
		
		//내정보 수정
		@RequestMapping(value="personaldataUpdate", method=RequestMethod.POST)

		public String personaldataUpdate(MemberDTO memberDTO, HttpSession session, RedirectAttributes ra) throws Exception{

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
				alarmDTO.setEmail(((CheckMemberViewDTO)session.getAttribute("member")).getEmail());
				alarmDTO.setContents("개인정보를 수정을 하셨습니다.");
				alarmService.alarmInsert(alarmDTO);
				ra.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));
			}


			return "redirect:/member/personaldataView";
		}
		
		
}
