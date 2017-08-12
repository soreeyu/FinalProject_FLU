package com.flu.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.flu.alarm.AlarmDTO;
import com.flu.alarm.AlarmService;
import com.flu.applicant.ApplicantDTO;
import com.flu.checkMember.CheckMemberService;
import com.flu.checkMember.CheckMemberViewDTO;
import com.flu.file.FileSaver;
import com.flu.member.MemberDTO;
import com.flu.member.MemberService;
import com.flu.project.ProjectDTO;
import com.flu.reservation.ReservationDTO;
//import com.flu.util.AES256Util;
import com.flu.util.ListInfo;

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
		public String MemberJoin(Model model) throws Exception{
			model.addAttribute("memberList", memberService.memberList());
			
			return "member/memberJoinForm";
		}
		//사이트 회원 가입
		@RequestMapping(value="MemberJoin", method=RequestMethod.POST)
		public String MemberJoin(MemberDTO memberDTO, Model model, HttpSession session, RedirectAttributes re) throws Exception{
			String pw = memberDTO.getPw();
			
			int result =memberService.memberInsert(memberDTO);
			if(result > 0){
				this.EmailAccess(memberDTO.getEmail());
				memberDTO.setPw(pw);
				System.out.println("멤버 비번은 ? :"+memberDTO.getPw());
				this.login(memberDTO, session, re);
			}
			System.out.println("회원가입 성공");
			model.addAttribute("title", "회원가입 요청 완료");
			model.addAttribute("message", "FLU 이용을 위해서는 인증 메일 확인이 필요합니다.");
			
			return "redirect:/member/emailCK";
		}
		//이메일 미인증시 화면
		@RequestMapping(value="emailCK")
		public String emailCK(Model model){
			System.out.println("이메일 미인증화면");
			
			model.addAttribute("title", "이메일 인증이 필요합니다.");
			model.addAttribute("message", "FLU 이용을 위해서는 인증 메일 확인이 필요합니다.");
			
			return "/member/emailCK";
		}
		
		
		//이메일 재전송
		@RequestMapping(value="re_email" ,method=RequestMethod.POST)
		public String emailrequest(String email){
			this.EmailAccess(email);
			
			return "redirect:/member/emailCK";
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
		public String EmailAccessCk(String num, String email, HttpSession session){	
			System.out.println(memberService.memberView2(email).getEmail());
			System.out.println(memberService.memberView2(email).getEmailcheck());

			
			if(num.equals(memberService.memberView2(email).getEmailcheck()) && email.equals(memberService.memberView2(email).getEmail())){
				MemberDTO memberDTO = new MemberDTO();
				memberDTO.setEmail(email);
				memberDTO.setEmailcheck("1");
				if(!num.equals("1")){
					memberService.emailck(memberDTO);
					session.setAttribute("member", memberDTO);
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
		public String login(MemberDTO memberDTO, HttpSession session, RedirectAttributes ra) throws Exception{
			System.out.println("로그인 컨트롤러");

			memberDTO = memberService.login(memberDTO);
			String message = "";
			if(memberDTO != null){
				alarmDTO = new AlarmDTO();
				session.setAttribute("member", memberDTO);
				message= "로그인 하였습니다.";
				alarmDTO.setEmail(memberDTO.getEmail());

				ra.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));
				System.out.println("카운트"+alarmService.alarmCount(alarmDTO));
				ra.addFlashAttribute("message", message);
				
				System.out.println("회원");
				//관리자 로그인시 리턴하는 주소는 인덱스 myflu가 아님
				if(memberDTO.getKind().equals("admin")){
					return "redirect:/";
				}
				return "redirect:/member/myflu";
				
			}else{
				ra.addFlashAttribute("message", message);

				return "redirect:/member/login";
				
			}
		}
		//로그아웃
		@RequestMapping(value="logout")
		public String logout(HttpSession session){
			session.invalidate();
			return "redirect:/";
		}
		
		//회원 탈퇴 비번확인
		@RequestMapping(value="pwCheck")
		@ResponseBody
		public String pwCheck(MemberDTO memberDTO) throws Exception{
			
			return memberService.pwcheck(memberDTO);
		}
		
		//회원 탈퇴
		@RequestMapping(value="memberDelete")
		public String memberDelte(MemberDTO memberDTO, HttpSession session) throws Exception{
			int result =memberService.memberDelete(memberDTO);
			
			if(result > 0){
				session.invalidate();
			}
			
			return "redirect:/";
		}
		
		//MY FLU
		@RequestMapping(value="myflu")
		public void myflu(HttpSession session, Model model) throws Exception{
			//알람 List
			List<AlarmDTO> ar = memberService.memberAlarmList(((MemberDTO)session.getAttribute("member")).getEmail());
			
			
			
			//로그인한 사람이 프리랜서일 경우 아래의 코드 실행
			if(((MemberDTO)session.getAttribute("member")).getKind().equals("freelancer")){
				//진행중인 프로젝트 List
				List<ProjectDTO> far = memberService.memberProjectList_ING(((MemberDTO)session.getAttribute("member")).getEmail());
				//지원한 프로젝트 List
				List<ProjectDTO> far2 = memberService.memberProjectList_APP(((MemberDTO)session.getAttribute("member")).getEmail());
				//완료한 프로젝트 List
				List<ProjectDTO> far3 = memberService.memberProjectList_FIN(((MemberDTO)session.getAttribute("member")).getEmail());
				//지원한 프로젝트 Count
				int count2 = memberService.memberProjectCount_APP(((MemberDTO)session.getAttribute("member")).getEmail());
				//진행중인 프로젝트 Count
				int count1 = memberService.memberProjectCount_ING(((MemberDTO)session.getAttribute("member")).getEmail());
				//완료한 프로젝트 Count
				int count3 = memberService.memberProjectCount_FIN(((MemberDTO)session.getAttribute("member")).getEmail());
				//누적 완료 금액
				int pay = memberService.memberProjectSumPay(((MemberDTO)session.getAttribute("member")).getEmail());
				System.out.println("PAY"+pay);
				model.addAttribute("ingList", far);
				model.addAttribute("appList", far2);			
				model.addAttribute("finList", far3);
				model.addAttribute("ingCount", count1);
				model.addAttribute("appCount", count2);
				model.addAttribute("finCount", count3);
				model.addAttribute("pay", pay);
				
				//로그인한 사람이 클라이언트일 경우 아래의 코드를 실행
			}else if(((MemberDTO)session.getAttribute("member")).getKind().equals("client")){
				//검수중인 프로젝트 List
				List<ProjectDTO> car = memberService.memberProjecttList_CHK(((MemberDTO)session.getAttribute("member")).getEmail());
				//지원자 모집중인 프로젝트 List
				List<ProjectDTO> car2 = memberService.memberProjectList_REC(((MemberDTO)session.getAttribute("member")).getEmail());
				//진행중인 프로젝트 List
				List<ProjectDTO> car3 = memberService.memberProjectList_INGC(((MemberDTO)session.getAttribute("member")).getEmail());
				//등록한 프로젝트 Count
				int count1 = memberService.memberProjectCount_CHK(((MemberDTO)session.getAttribute("member")).getEmail());
				//진행중인 프로젝트 Count
				int count2 = memberService.memberProjectCount_INGC(((MemberDTO)session.getAttribute("member")).getEmail());
				//완료한 프로젝트 Count
				int count3 = memberService.memberProjectCount_FINC(((MemberDTO)session.getAttribute("member")).getEmail());
				//누적 완료 금액
				int budget = memberService.memberProjectSumBudget(((MemberDTO)session.getAttribute("member")).getEmail());
				
				model.addAttribute("chkList", car);
				model.addAttribute("recList", car2);
				model.addAttribute("ingcList", car3);
				model.addAttribute("insCount", count1);
				model.addAttribute("ingCount", count2);
				model.addAttribute("finCount", count3);
				model.addAttribute("budget", budget);
			}
			model.addAttribute("alrList", ar);
			
		}
		
		
		//MY PAGE
		@RequestMapping(value="mypage")
		public ModelAndView mypage(String email, HttpSession session, ModelAndView model, RedirectAttributes re){
			MemberDTO memberDTO =  (MemberDTO)session.getAttribute("member");
			System.out.println("마이페이지 이메일 : "+email);
			if(memberDTO.getKind().equals("client")){
				model.setView(new RedirectView("/flu/member/client/mypage?email="+email));
				return model;
			}else{
				model.setView(new RedirectView("/flu/member/freelancermypage?email="+email));
				return model;
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
				session.setAttribute("member", memberService.memberView2(this.getEmail(session)));
				//알람 디비에 인서트
				
				AlarmDTO alarmDTO = new AlarmDTO();
				alarmDTO.setEmail(memberDTO.getEmail());
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
				session.setAttribute("member", memberService.memberView2(this.getEmail(session)));
				//알람 디비에 인서트
				AlarmDTO alarmDTO = new AlarmDTO();
				alarmDTO.setEmail(memberDTO.getEmail());

				alarmDTO.setContents("개인정보를 수정 하셨습니다.");

				alarmService.alarmInsert(alarmDTO);
				ra.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));
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
				
			//계좌 관리 폼
				@RequestMapping(value="accountView")
				public String accountView(Model model){
					
					model.addAttribute("active3", "a");
					return "/member/account";
				}
				//계좌 등록폼
				@RequestMapping(value="accountInsert", method=RequestMethod.GET)
				public String accountInsert(Model model){
					
					
					model.addAttribute("active3", "a");
					return "/member/accountform";
				}
				//계좌 등록/수정
				@RequestMapping(value="accountInsert", method=RequestMethod.POST)
				public String accountInsert(Model model, MemberDTO memberDTO, HttpSession session) throws Exception{
					alarmDTO = new AlarmDTO();
					int result = memberService.accountInsert(memberDTO);
					
					if(result > 0){
						session.setAttribute("member", memberService.memberView2(this.getEmail(session)));
						alarmDTO.setEmail(memberDTO.getEmail());
						alarmDTO.setContents("계좌 정보를 수정했습니다.");
						alarmService.alarmInsert(alarmDTO);
					}
					
					return "redirect:/member/accountView";
				}
		
}
