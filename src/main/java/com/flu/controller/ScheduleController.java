package com.flu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flu.file.FileService;
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
		@RequestMapping(value="test", method=RequestMethod.GET)
		public String insertMainScheduleT(){ //넘어온 projectNum 이 저장되어있다 
			return "schedule/main";
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
		
		
		
		
		
		
		
		
		// 프로젝트에 생성된 스케줄이 있는지 확인
		@RequestMapping(value="create", method=RequestMethod.GET)
		public String checkSchedule(Integer projectNum, Model model){
			//있으면 바로 스케줄메인화면
			//없으면
			//시작날짜,마감날짜,파트 입력화면
			ScheduleMainDTO result = scheduleService.checkSchedule(projectNum);
			String path = "redirect:/";
			if(result != null){
				model.addAttribute("scheduleMainDTO", result); //있을 경우 일단 home으로 보내기 
			}else{
				model.addAttribute("projectNum", projectNum);
				path = "schedule/mainInsertForm";
			}
			
			return path;
			
		}
		

		
		//진행중인 스케줄이 없을때 넘어오는 창으로 main, part, 첨부파일을 받는다  //진짜
		@RequestMapping(value="create", method=RequestMethod.POST)
		public String insertMainSchedule(ScheduleMainDTO scheduleMainDTO,SchedulePartArrayDTO schedulePartArrayDTO, Model model ,HttpSession session) throws Exception{ 
			System.out.println("컨트롤러");
			//시퀀스 사용하여 스케줄테이블에 하나가 생성된다 
			int result =  scheduleService.insertMainSchedule(scheduleMainDTO,schedulePartArrayDTO, session);
			System.out.println("Controller insertMainS result = " + result);

			if(result > 0){

				model.addAttribute("scheduleNum", result);
				return "schedule/main";

			}else{
				return "redirect:/";
			}

		}
		
		
		
		
		

		
		


		
		//main스케줄 수정하기 //시작 날짜, 마감날짜가 바뀐다 
		public int updateMainSchedule(ScheduleMainDTO scheduleMainDTO){
			return 0;
		}
		
		
		
		
		

		
		//json으로 넘어감 //jaskson api
		//저장된 partList 가져오기 //세부사항 등록시 필요
		@ResponseBody
		@RequestMapping(value="partList",method=RequestMethod.GET)
		public List<SchedulePartDTO> partList(int scheduleNum, Model model){
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
		public void unitList(int scheduleNum){ 
			//List<ScheduleUnitDTO>
		}
		
		public void unitOne(){}
		
		/*
		@RequestMapping(value="unitWrite", method=RequestMethod.GET)
		public String unitWrite(){
			System.out.println("unit 등록하러옴 ");
			return "index";
		}
		*/
		
		//@ResponseBody //이건 리턴을 json으로 해주는애임
		@RequestMapping(value="unitWrite", method=RequestMethod.POST)
		public String unitWrite(ScheduleUnitDTO scheduleUnitDTO,Model model){
			System.out.println("scheduleUnit "+scheduleUnitDTO.getUnitName());
			System.out.println("unit 등록하러옴 내용가지고");
			System.out.println("파일 "+scheduleUnitDTO.getUnitDescFile().getOriginalFilename());
			model.addAttribute("message", "힘들다");
			model.addAttribute("path", "/flu/schedule/main");
			return "common/result";
		}
		
		
		
		@RequestMapping(value="unitUpdate", method=RequestMethod.POST)
		public String unitUpdate(ScheduleUnitDTO scheduleUnitDTO){
			System.out.println("unit 수정하러옴");
			return "schedule/main";
		}
		
		public void unitDelete(){}
		
		
		

		//참여하고 있는 프리랜서 목록 가져오기 
		public void userList(int projectNum){ //재식친구의 DTO 리스트
			//List<MemberDTO> 
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
