package com.flu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.flu.applicant.ApplicantDAO;
import com.flu.applicant.ApplicantService;
import com.flu.file.FileService;
import com.flu.member.MemberDTO;
import com.flu.project.ProjectDTO;
import com.flu.project.ProjectService;
import com.flu.schedule.ScheduleService;
import com.flu.schedule.ScheduleSummaryDTO;
import com.flu.schedule.client.ScheduleMainDTO;
import com.flu.schedule.client.SchedulePartArrayDTO;
import com.flu.schedule.client.SchedulePartDTO;
import com.flu.schedule.client.ScheduleUnitDTO;
import com.flu.schedule.freelancer.ScheduleResultFileDTO;
import com.flu.schedule.freelancer.SheduleFreeTodoResultDTO;

@Controller
@RequestMapping(value="/schedule/**")
public class ScheduleController {
	
		@Autowired
		private ScheduleService scheduleService;
		@Autowired
		private ProjectService projectService;
		@Autowired
		private ApplicantDAO applicantDAO;
		@Autowired
		private ApplicantService applicantService;
		
		//이게 보배언니의 프로젝트 뷰 라고 가정한다 
		@RequestMapping(value="testProjectView")
		public String testProjectView(){
			return "schedule/testProjectView";
		}
		
		
		
		@RequestMapping(value="test" , method= {RequestMethod.GET,RequestMethod.POST})
		public String test(@RequestParam(defaultValue="0") Integer scheduleNum, String currentTab, Model model, RedirectAttributes rd, HttpSession session) throws Exception{
			System.out.println("test 링크로 오는 애임 Controller = "+scheduleNum);
			Integer result = applicantService.checkApp(((MemberDTO)session.getAttribute("member")).getEmail());
			ScheduleMainDTO scheduleMainDTO = scheduleService.mainScheduleOne(scheduleNum);
			if(result == null){
				rd.addFlashAttribute("message", "참여하지 않는 프로젝트입니다");
				return "redirect:/";
			}else if(scheduleMainDTO == null){

				rd.addFlashAttribute("message", "해당프로젝트에 대한 스케줄이 없습니다");
				return "redirect:/";
		
			}else{
				
				model.addAttribute("scheduleNum", scheduleNum);
				model.addAttribute("mainScheduleDTO", scheduleMainDTO);
				ProjectDTO dto = new ProjectDTO(); 
				dto.setProjectNum(scheduleMainDTO.getProjectNum());
				//ProjectDTO projectDTO = projectService.projectView(scheduleMainDTO.getProjectNum());//처리필요
				ProjectDTO projectDTO = projectService.projectView(dto);
				model.addAttribute("projectDTO",projectDTO); //프로젝트 정보 뿌려주기용 
				model.addAttribute("applicantCount", applicantDAO.ingCount(scheduleMainDTO.getProjectNum())); //해당 스케줄에 참여한 프리랜서수 
				
				
				ScheduleSummaryDTO scheduleSummaryDTO = scheduleService.getfirstViewData(scheduleNum); //tab1 의 개요를 위한 아이
				model.addAttribute("summary",scheduleSummaryDTO);

				model.addAttribute("currentTab", currentTab);
				
				ScheduleUnitDTO scheduleUnitDTO = new ScheduleUnitDTO();
				scheduleUnitDTO.setScheduleNum(scheduleNum);
				scheduleUnitDTO.setEmail(((MemberDTO)session.getAttribute("member")).getEmail());
				scheduleUnitDTO.setPartNum(-1);
				scheduleUnitDTO.setUnitState("");
			    
				
				List<MemberDTO> list = scheduleService.userList(scheduleNum);
				List<SchedulePartDTO> list2 = scheduleService.partList(scheduleNum);
				//System.out.println("list온거 좀 보세 "+list.get(0).getEmail());
				model.addAttribute("userList2", list);
				model.addAttribute("partList2", list2);
				model.addAttribute("scheduleNum",scheduleNum);
				
				
				
				
				return "schedule/scheduleTemp";

			}



		}
		
		
		@ResponseBody
		@RequestMapping(value="mainInsert" , method=RequestMethod.POST)
		public int mainInsert(ScheduleMainDTO scheduleMainDTO) throws Exception{
			int result = scheduleService.mainInsert(scheduleMainDTO);
			return result;
		}

		
		
		@RequestMapping(value="firstView" , method=RequestMethod.GET)
		public String test3(@RequestParam(defaultValue="0") Integer scheduleNum, Model model) throws Exception{
			model.addAttribute("scheduleNum", scheduleNum);
			
			ScheduleMainDTO mainScheduleDTO = scheduleService.getScheduleMainDTO(scheduleNum);
			model.addAttribute("mainScheduleDTO", mainScheduleDTO);
			
			ScheduleSummaryDTO scheduleSummaryDTO = scheduleService.getfirstViewData(scheduleNum); //개요를 위한 아이			
			model.addAttribute("summary",scheduleSummaryDTO);
			return "schedule/firstView";
		}
		
		
		
		@RequestMapping(value="secondView")
		public String test2(@RequestParam(defaultValue="0") Integer scheduleNum, Model model){
			model.addAttribute("scheduleNum", scheduleNum);
			return "schedule/secondView";
		}
		
		
		@RequestMapping(value="thirdView")
		public String test4(@RequestParam(defaultValue="0") Integer scheduleNum, Model model){
			model.addAttribute("scheduleNum", scheduleNum);
			return "schedule/thirdView";
		}
		
		
		@RequestMapping(value="sixthView")
		public String test6(@RequestParam(defaultValue="0") Integer scheduleNum, Model model){
			//model.addAttribute("scheduleNum", scheduleNum);
			//return "schedule/ganttchartTest2";
			return "schedule/ganttchartTest";
		}
		
		@RequestMapping(value="dhxTest" , method=RequestMethod.GET)
		public String test7(@RequestParam(defaultValue="0") Integer scheduleNum, Model model){
			model.addAttribute("scheduleNum", scheduleNum);
			return "schedule/dhx_ganttTest";
		}
		
		@RequestMapping(value="test8")
		public String test8(@RequestParam(defaultValue="0") Integer scheduleNum, Model model) throws Exception{
			model.addAttribute("scheduleNum", scheduleNum);
			ScheduleSummaryDTO scheduleSummaryDTO = scheduleService.getfirstViewData(scheduleNum); //개요를 위한 아이
			model.addAttribute("summary",scheduleSummaryDTO);
			return "schedule/firstViewTestGoogleChart";
		}
		
		@ResponseBody
		@RequestMapping(value="test8Json",method=RequestMethod.POST)
		public HashMap<String, Object> test8Json(@RequestParam(defaultValue="0") Integer scheduleNum) throws Exception{
			System.out.println("json보내주러 들어옴");
			ScheduleSummaryDTO scheduleSummaryDTO = scheduleService.getfirstViewData(scheduleNum); //개요를 위한 아이
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("summary2", scheduleSummaryDTO);
			return map;
		}
		
		
		@RequestMapping(value="detailView",method=RequestMethod.GET)
		public String detailView(@RequestParam(defaultValue="0") Integer scheduleNum, Model model) throws Exception{
			HashMap<String, Object> map = scheduleService.forExcelData(scheduleNum);
			/*HashMap<String, Object> map = new HashMap<String, Object>();
			
			List<SchedulePartDTO> partList = scheduleService.partList(scheduleNum);
			map.put("partList",partList);
			
			for(int i=0;i<partList.size();i++){
				ScheduleUnitDTO scheduleUnitDTO = new ScheduleUnitDTO();
				scheduleUnitDTO.setScheduleNum(scheduleNum);
				scheduleUnitDTO.setEmail("");
				scheduleUnitDTO.setUnitState("");
				scheduleUnitDTO.setPartNum(partList.get(i).getPartNum());
				List<ScheduleUnitDTO> unitList = scheduleService.unitList(scheduleUnitDTO);
				partList.get(i).setUnitList(unitList);
			}
			
			System.out.println("0번째 유닛꺼내기"+((List<SchedulePartDTO>)map.get("partList")).get(0).getUnitList().get(0).getUnitName());*/
			model.addAttribute("map", map);
			model.addAttribute("scheduleNum", scheduleNum);
			return "schedule/detailViewforExcel";
		}
		
		@RequestMapping(value="makeExcel")
		public void makeExcel(Integer scheduleNum ,HttpSession session) throws Exception{
			
			scheduleService.makeExcel(scheduleNum,session);

		}
		
		
		
		/*
		 * /schedule 로 접근할때 동작 //url 쳤을때 프로젝트가 있는지 확인해주는 것
		 * projectNum으로 project DB 에 존재하고 state가 ing인지 체크 
		 * 
		 * 		부재 : index.jsp 
		 * 		존재 : schedule메인화면(firstView)으로 이동 
		 * */
		@RequestMapping(method=RequestMethod.GET)
		public String scheduleMain(@RequestParam(defaultValue="0") Integer projectNum, Model model, RedirectAttributes rd) throws Exception{ //넘어온 projectNum 이 저장되어있다 
			//project가 있는지 확인해야한다 
			String path = "redirect:/";
			int result = scheduleService.checkProject(projectNum);
			if(result>0){ //프로젝트가 있으면
				//model.addAttribute("projectNum", projectNum);
				path = "schedule/testProjectView";//firstView로 수정해야함
			}else{ //프로젝트가 없으면
				rd.addFlashAttribute("message", "해당 프로젝트가 존재하지 않습니다");
			}
			return path;
		}
		
		


		//ajax로 불려져서 json 보내줌 
		// 프로젝트에 생성된 스케줄이 있는지 확인 //1번
		@ResponseBody
		@RequestMapping(value="check", method=RequestMethod.GET)
		public Map<String, Object> checkSchedule(Integer projectNum){ //Exception 던지기
			System.out.println("스케줄 있는지 check하러옴 Controller");
			System.out.println("projectNum = "+projectNum);
			Map<String, Object> map = new HashMap<String, Object>();
			ScheduleMainDTO result = null;
			try {
				result = scheduleService.checkSchedule(projectNum);

				System.out.println("check의 result = "+result);
				if(result != null){ //스케줄이 있음
					map.put("schedule", "y");
					map.put("scheduleMainDTO", result);//있을경우는 scheduleNum을 보내줌  
					//model.addAttribute("schedule", "y");
					//model.addAttribute("scheduleMainDTO", result); 
					System.out.println("스케줄있음");

				}else{//스케줄이 없음 
					map.put("schedule", "n");
					map.put("projectNum", projectNum);
					//model.addAttribute("schedule", "n");
					//model.addAttribute("projectNum", projectNum); //없으면 없으니까 만들건지 물어보기
					System.out.println("스케줄없음");
				}
				//map.put("", "schedule/scheduleMain")
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("check할때 오류임 ");
				map.put("schedule", "error");
				e.printStackTrace();
			}
			return map;

		}

		
		

		
		//프로젝트뷰에서 호출함
		//스케줄 없을 경우 //서비스에서 먼저 main을 만들어서 생성후(시작,마감일은 당일로 우선 설정) 가져온다 
		@ResponseBody
		@RequestMapping(value="create", method=RequestMethod.GET)
		public Map<String, Object> createSchedule(Integer projectNum, Model model) throws Exception{
			int scheduleNum = scheduleService.createSchedule(projectNum);
			Map<String, Object> map = new HashMap<String, Object>();
			if(scheduleNum > 0){ //생성 성공
				map.put("result", "y");
				map.put("scheduleNum", scheduleNum);
			}else{ //생성실패
				map.put("result", "n");
			}
			return map;
		}
		
		
		

		
		
		
		//파트 입력 받는 폼 
		@RequestMapping(value="create", method=RequestMethod.POST)
		public String insertMainSchedule(ScheduleMainDTO scheduleMainDTO,SchedulePartArrayDTO schedulePartArrayDTO, Model model ,HttpSession session) throws Exception{ 
			System.out.println("컨트롤러");
	
			//int result = 0;//업데이트 해야할듯 scheduleService.insertMainSchedule(scheduleMainDTO,schedulePartArrayDTO, session);
			int result = scheduleService.insertMainPartSchedule(scheduleMainDTO, schedulePartArrayDTO, session);
			System.out.println("Controller insertMainS result = " + result);

			if(result > 0){
				//model.addAttribute("scheduleNum", result);
				return "schedule/scheduleMain";

			}else{
				return "redirect:/";
			}

		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		//상세파일 등록 테스트
		@RequestMapping(value="testUnit", method=RequestMethod.GET)
		public String insertUnitScheduleT(){ //넘어온 projectNum 이 저장되어있다 
			return "schedule/testInsertUnit";
		}
		

		//테스트
		//넘어온 파일 확인하기 
		@RequestMapping(value="createT", method=RequestMethod.POST)
		public String insertMainScheduleT(SchedulePartArrayDTO schedulePartArrayDTO,HttpSession session) throws Exception{
			FileService fileService = new FileService();
			
			for(int i=0;i<schedulePartArrayDTO.getPartDescFileO().length;i++){
				System.out.println(i+1+"번째 파일 이름 = "+ (schedulePartArrayDTO.getPartDescFile())[i].getOriginalFilename());
				
				String fileNameF = fileService.fileSave((schedulePartArrayDTO.getPartDescFile())[i], session);
			}
			
			

			return "";

		}
		
		
		
		/////////////////////////////////////////////
		
		
		
		
		
		
		

		
		


		
		//main스케줄 수정하기 //시작 날짜, 마감날짜가 바뀐다 
		public int updateMainSchedule(ScheduleMainDTO scheduleMainDTO){
			return 0;
		}
		
		
		
		
		

		
		//json으로 넘어감 //jaskson api
		//저장된 partList 가져오기 //세부사항 등록시 필요
		@ResponseBody
		@RequestMapping(value="partList",method=RequestMethod.GET)
		public List<SchedulePartDTO> partList(Integer scheduleNum, Model model) throws Exception{
		//public String partList(int scheduleNum, Model model){
			List<SchedulePartDTO> partList = scheduleService.partList(scheduleNum);
			System.out.println("컨트롤러 에서 part리스트"+partList);
			//model.addAttribute("partList",partList);
			//model.addAttribute("scheduleNum",scheduleNum);
			
			//return "schedule/partView";
			return partList;
		} 
		
		
		
		public void partOne(){
			
		}
		
		
		//DTO내의 배열에 각각 값이 저장됨
		
		//public String partInsert(SchedulePartArrayDTO schedulePartArrayDTO,HttpSession session, RedirectAttributes rd,String currentTab,Model model) throws Exception{
		//@ResponseBody
		@RequestMapping(value="addPart", method=RequestMethod.POST)
		public String partInsert(SchedulePartArrayDTO schedulePartArrayDTO,HttpSession session, RedirectAttributes rd,String currentTab,Model model) throws Exception{	
			System.out.println("partWrite scheduleNum = "+schedulePartArrayDTO.getScheduleNum());
			int result =  scheduleService.insertPart(schedulePartArrayDTO,session);
			int scheduleNum = schedulePartArrayDTO.getScheduleNum();
			String message = "";
			System.out.println("part등록 Controller result = "+result);
			System.out.println("addPart 링크타고들어왔을때 scheduleNum = " + scheduleNum);
			if(result > 0 ){
				//part 등록성공	
				message = "part등록완료";
			}else{
				//part 등록 실패
				message = "part등록실패";
			}
			model.addAttribute("currentTab", currentTab);
			model.addAttribute("scheduleNum", scheduleNum);
			model.addAttribute("message", message);
			rd.addFlashAttribute("currentTab", currentTab);
			rd.addFlashAttribute("scheduleNum", scheduleNum);
			//return "redirect:/schedule/test?scheduleNum"+scheduleNum; 
			return "schedule/addPartResult";
			//return result;
		}
		
		@RequestMapping(value="partUpdate", method=RequestMethod.GET)
		public void partUpdate(SchedulePartDTO schedulePartDTO){
			
		}
		
		@RequestMapping(value="partDelete", method=RequestMethod.POST)
		public String partDelete(SchedulePartDTO schedulePartDTO) throws Exception{
			System.out.println("ScheduleNum="+schedulePartDTO.getScheduleNum()+", partNum="+schedulePartDTO.getPartNum());
			int result = scheduleService.deletePart(schedulePartDTO);
			return "schedule/partView";
		}
		
		
		
		
		
		
		
		//할일 리스트 뿌려주기 
		@ResponseBody
		@RequestMapping(value="unitList", method=RequestMethod.POST)
		public List<ScheduleUnitDTO> unitList(ScheduleUnitDTO scheduleUnitDTO) throws Exception{ 
			System.out.println("schduleNum_partNum "+scheduleUnitDTO.getScheduleNum()+"_"+scheduleUnitDTO.getPartNum());
			System.out.println("email "+scheduleUnitDTO.getEmail());
			System.out.println("unitState "+scheduleUnitDTO.getUnitState());
			List<ScheduleUnitDTO> list = scheduleService.unitList(scheduleUnitDTO);
			for(int i=0;i<list.size();i++){
				System.out.println(i+"번째 할일이름 = "+list.get(i).getUnitName() + "  "+ list.get(i).getPartName());
			}
			return list;
		}
		
		
		@ResponseBody
		@RequestMapping(value="unitOne",method=RequestMethod.POST)
		public ScheduleUnitDTO unitOne(ScheduleUnitDTO scheduleUnitDTO) throws Exception{
			System.out.println("unitOne정보보기");
			System.out.println("ggg"+scheduleUnitDTO.getScheduleNum()+" "+scheduleUnitDTO.getUnitNum());
			ScheduleUnitDTO dto = scheduleService.unitOne(scheduleUnitDTO);	
			System.out.println("unitOne정보보기다녀옴");
			return dto;
			
		}
		
		/*
		@RequestMapping(value="unitWrite", method=RequestMethod.GET)
		public String unitWrite(){
			System.out.println("unit 등록하러옴 ");
			return "index";
		}
		*/
		
		@ResponseBody //이건 리턴을 json으로 해주는애임
		@RequestMapping(value="unitWrite", method=RequestMethod.POST)
		public Map<String, Object> unitWrite(ScheduleUnitDTO scheduleUnitDTO,Model model) throws Exception{
			System.out.println("scheduleUnit scheduleNum "+scheduleUnitDTO.getScheduleNum());
			System.out.println("scheduleUnit unitname "+scheduleUnitDTO.getUnitName());
			System.out.println("scheduleUnit username"+scheduleUnitDTO.getEmail());
			System.out.println("scheduleUnit partnum"+scheduleUnitDTO.getPartNum());
			System.out.println("unit 등록하러옴 내용가지고");
			//System.out.println("파일 "+scheduleUnitDTO.getUnitDescFile().getOriginalFilename());
			
			int result = scheduleService.unitInsert(scheduleUnitDTO);
			if(result > 0){
				
			}else{
				System.out.println("내용등록 실패");
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("result", result);
			return map;
			/*
			model.addAttribute("message", "힘들다");
			model.addAttribute("path", "/flu/schedule/main");
			return "common/result";
			*/
		}
		
		
		
		@RequestMapping(value="unitUpdate", method=RequestMethod.POST)
		public String unitUpdate(ScheduleUnitDTO scheduleUnitDTO){
			System.out.println("unit 수정하러옴");
			return "schedule/main";
		}
		
		public void unitDelete(){}
		
		
		

		//참여하고 있는 프리랜서 목록 가져오기 
		@ResponseBody
		@RequestMapping(value="userList", method=RequestMethod.GET)
		public List<MemberDTO> userList(Integer scheduleNum) throws Exception{ 
			List<MemberDTO> list = scheduleService.userList(scheduleNum);
			
			System.out.println("해당 스케줄의 사용자들 데려오기");
			
			if(list != null && list.size() >0){
				System.out.println("사용자 list = "+list.get(0).getEmail());
			}else{
				System.out.println("사용자가 없네");
			}
	
			return list;
		} 




		
		

		
		//프리랜서 용 // 할일에 지정되있는 user가 email 계정과 동일해야한다
		@ResponseBody
		@RequestMapping(value="stateChange", method=RequestMethod.POST)
		public int stateChange(ScheduleUnitDTO scheduleUnitDTO) throws Exception{
			
			//clientSchedule 부분에 state를 변경해준다 
			/*System.out.println("상태변환용 em  "+scheduleUnitDTO.getEmail());
			System.out.println("상태변환용 st  "+scheduleUnitDTO.getUnitState());
			System.out.println("상태변환용 sn  "+scheduleUnitDTO.getScheduleNum());
			System.out.println("상태변환용 un  "+scheduleUnitDTO.getUnitNum());
			*/
			return scheduleService.stateChange(scheduleUnitDTO);

		}	
		
		
		
		
		//프리랜서 용 // 할일에 지정되있는 user가 email 계정과 동일해야한다  
		@ResponseBody
		@RequestMapping(value="uploadResult", method=RequestMethod.POST)
		public int uploadResult(SheduleFreeTodoResultDTO freeTodoResultDTO,ScheduleResultFileDTO resultFileDTO, HttpSession session) throws Exception{ //파일이 여러개일 수 있음 //멀티파트파일리스트를 받아야할수도 있음
			
			int result = scheduleService.uploadUnitResult(freeTodoResultDTO, resultFileDTO, session);
			
			return result;
		}  
		
		
		
		

		
		//part수정하기 //진행중에 part 수정하는 경우에는 DB에서 part와 clientSchedule 의 part도 같이 수정되어야한다
		public int updatePart(ScheduleMainDTO scheduleMainDTO){
			return 0;
		}
		
		//수정이 아니라 삭제인 경우 이 part 에 해당하는 상세항목을 처리해줄 수 있어야한다 
		public void deletePart(){}
		
		
		//세부항목
		@ResponseBody
		@RequestMapping(value ="addUnit", method={RequestMethod.POST, RequestMethod.GET})
		public int insertUnit(ScheduleUnitDTO scheduleUnitDTO) throws Exception{
			System.out.println("값왓니?"+scheduleUnitDTO.getUnitDescribe());
			return scheduleService.unitInsert(scheduleUnitDTO);
		}
		
		
		public int updateUnit(ScheduleUnitDTO scheduleUnitDTO){
			return 0;
		}
		
		//권한이 맞으면 삭제 허용하되 // 확인작업은 거쳐야한다
		public int deleteUnit(String email){
			return 0;
		}
		
		
		@ResponseBody
		@RequestMapping(value="setUnits",method=RequestMethod.POST)
		public int setUnits(String jsonData, HttpSession session) throws Exception{
			
			
			
			System.out.println("받아온 json데이터"+jsonData);
			
			int result = scheduleService.setUnits(jsonData);
			return 1;
				
		}

		
		@RequestMapping(value="checkListForFreelancer",method=RequestMethod.POST)
		public String checkListForFreelancer(ScheduleUnitDTO scheduleUnitDTO,String currentTab, Model model) throws Exception{
			/*List<MemberDTO> list = scheduleService.userList(scheduleUnitDTO.getScheduleNum());
			List<ScheduleUnitDTO> list2 = scheduleService.unitList(scheduleUnitDTO);
			model.addAttribute("userList2", list);
			model.addAttribute("partList2", list2);
			model.addAttribute("scheduleNum", scheduleUnitDTO.getScheduleNum());*/
			
			scheduleUnitDTO.setUnitState("할일");
			List<ScheduleUnitDTO> freeWillList = scheduleService.unitList(scheduleUnitDTO);
			model.addAttribute("freeWillList", freeWillList);
			
			
			
			return "schedule/checkListForFreelancer";
		}
		
	
	

}
