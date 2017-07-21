package com.flu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.flu.file.FileService;
import com.flu.member.MemberDTO;
import com.flu.schedule.ScheduleService;
import com.flu.schedule.client.ScheduleMainDTO;
import com.flu.schedule.client.SchedulePartArrayDTO;
import com.flu.schedule.client.SchedulePartDTO;
import com.flu.schedule.client.ScheduleUnitDTO;

@Controller
@RequestMapping(value="/schedule/**")
public class ScheduleController {
	
		@Autowired
		private ScheduleService scheduleService;
		
		
		//main스케줄인서트로 바로가기  테스트 
		@RequestMapping(method=RequestMethod.GET)
		public String scheduleMain(@RequestParam(defaultValue="0") Integer projectNum, Model model, RedirectAttributes rd) throws Exception{ //넘어온 projectNum 이 저장되어있다 
			//project가 있는지 확인해야한다 
			String path = "redirect:/";
			int result = scheduleService.checkProject(projectNum);
			if(result>0){
				model.addAttribute("projectNum", projectNum);
				path = "schedule/scheduleMain";
			}else{
				rd.addFlashAttribute("message", "해당 프로젝트가 존재하지 않습니다");
			}
			return path;
		}
		
		


		// 프로젝트에 생성된 스케줄이 있는지 확인 //1번
		@ResponseBody
		@RequestMapping(value="check", method=RequestMethod.GET)
		public Map<String, Object> checkSchedule(Integer projectNum){
			System.out.println("check하러옴");
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

		
		

		
		//스케줄 없을 경우 //서비스에서 먼저 main을 만들어서 생성후(시작,마감일은 당일로 우선 설정) 가져온다 
		@RequestMapping(value="create", method=RequestMethod.GET)
		public String createSchedule(Integer projectNum, Model model){
			int scheduleNum = scheduleService.createSchedule(projectNum);
			if(scheduleNum > 0){ //생성 성공
				
			}else{ //생성실패
				
			}
			model.addAttribute("scheduleNum", scheduleNum);
			return "schedule/mainInsertForm"; //스케줄넘을 가지고 파트 등록하는 화면			
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
		public List<SchedulePartDTO> partList(Integer scheduleNum, Model model){
		//public String partList(int scheduleNum, Model model){
			List<SchedulePartDTO> partList = scheduleService.partList(scheduleNum);
			System.out.println("컨트롤러 에서 part리스트"+partList);
			//model.addAttribute("partList",partList);
			//model.addAttribute("scheduleNum",scheduleNum);
			
			//return "schedule/partView";
			return partList;
		} 
		
		
		
		public void partOne(){}
		
		
		//DTO내의 배열에 각각 값이 저장됨
		@RequestMapping(value="addPart", method=RequestMethod.POST)
		public String partWrite(SchedulePartArrayDTO schedulePartArrayDTO){
			int result =  scheduleService.insertPart(schedulePartArrayDTO);

			System.out.println("part등록 Controller result = "+result);

			return "schedule/main"; 
		}
		
		@RequestMapping(value="partUpdate", method=RequestMethod.GET)
		public void partUpdate(SchedulePartDTO schedulePartDTO){
			
		}
		
		@RequestMapping(value="partDelete", method=RequestMethod.POST)
		public String partDelete(SchedulePartDTO schedulePartDTO){
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
			List<ScheduleUnitDTO> list = scheduleService.unitList(scheduleUnitDTO);
			for(int i=0;i<list.size();i++){
				System.out.println(i+"번째 할일이름 = "+list.get(i).getUnitName());
			}
			return list;
		}
		
		public void unitOne(){}
		
		/*
		@RequestMapping(value="unitWrite", method=RequestMethod.GET)
		public String unitWrite(){
			System.out.println("unit 등록하러옴 ");
			return "index";
		}
		*/
		
		@ResponseBody //이건 리턴을 json으로 해주는애임
		@RequestMapping(value="unitWrite", method=RequestMethod.POST)
		public Map<String, Object> unitWrite(ScheduleUnitDTO scheduleUnitDTO,Model model){
			System.out.println("scheduleUnit scheduleNum "+scheduleUnitDTO.getScheduleNum());
			System.out.println("scheduleUnit unitname "+scheduleUnitDTO.getUnitName());
			System.out.println("scheduleUnit username"+scheduleUnitDTO.getEmail());
			System.out.println("scheduleUnit partnum"+scheduleUnitDTO.getPartNum());
			System.out.println("unit 등록하러옴 내용가지고");
			//System.out.println("파일 "+scheduleUnitDTO.getUnitDescFile().getOriginalFilename());
			
			int result = scheduleService.insertUnit(scheduleUnitDTO);
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
		public List<MemberDTO> userList(Integer scheduleNum){ 
			List<MemberDTO> list = scheduleService.userList(scheduleNum);
			System.out.println("해당 스케줄의 사용자들 데려오기");
			System.out.println("사용자 list = "+list.get(0).getEmail());
			return list;
		} 

		public void userOne(){}

		public void userWrite(){}

		public void userUpdate(){}

		public void userDelete(){}



		
		

		
		//프리랜서 용 // 할일에 지정되있는 user가 email 계정과 동일해야한다  
		public void stateChange(String user,Integer doNum){
			//clientSchedule 부분에 state를 변경해준다 
		}	
		
		//프리랜서 용 // 할일에 지정되있는 user가 email 계정과 동일해야한다  
		public void uploadResult(String file,String contents){ //파일이 여러개일 수 있음 //멀티파트파일리스트를 받아야할수도 있음
			
		}  
		
		
		
		

		
		//part수정하기 //진행중에 part 수정하는 경우에는 DB에서 part와 clientSchedule 의 part도 같이 수정되어야한다
		public int updatePart(ScheduleMainDTO scheduleMainDTO){
			return 0;
		}
		
		//수정이 아니라 삭제인 경우 이 part 에 해당하는 상세항목을 처리해줄 수 있어야한다 
		public void deletePart(){}
		
		
		//세부항목
		public int insertUnit(ScheduleUnitDTO scheduleUnitDTO){
			return 0;
		}
		
		public int updateUnit(ScheduleUnitDTO scheduleUnitDTO){
			return 0;
		}
		
		//권한이 맞으면 삭제 허용하되 // 확인작업은 거쳐야한다
		public int deleteUnit(String email){
			return 0;
		}
		


		
	
	

}
