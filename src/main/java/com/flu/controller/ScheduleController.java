package com.flu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.flu.schedule.ScheduleService;
import com.flu.schedule.client.ScheduleMainDTO;
import com.flu.schedule.client.SchedulePartArrayDTO;
import com.flu.schedule.client.ScheduleUnitDTO;

@Controller
@RequestMapping(value="/schedule/**")
public class ScheduleController {
	
		@Autowired
		private ScheduleService scheduleService;
		
		
		// 프로젝트에 생성된 스케줄이 있는지 확인
		@RequestMapping(value="checkS", method=RequestMethod.GET)
		public void checkSchedule(Integer projectNum){
			//있으면 바로 스케줄메인화면
			//없으면
			//시작날짜,마감날짜,파트 입력화면
			
			
		}
		
		
		
		@RequestMapping(value="create", method=RequestMethod.GET)
		public String createSchedule(Integer projectNum, Model model){ //넘어온 projectNum 이 저장되어있다 
			model.addAttribute("projectNum", projectNum);
			return "schedule/mainInsertForm";
		}
		
		
		//make Schedule1 //애초에 이 작업이 제대로 진행안되면 스케줄이 아예 생성이 안된다고 보면됨
		@RequestMapping(value="create", method=RequestMethod.POST)
		public String insertMainSchedule(ScheduleMainDTO scheduleMainDTO,Model model){ //넘어온 projectNum 이 저장되어있다 
			//시퀀스 사용하여 스케줄테이블에 하나가 생성된다 
			int result =  scheduleService.insertMainSchedule(scheduleMainDTO);
			System.out.println("Controller에서insertMainS result = " + result);
			if(result > 0){
				model.addAttribute("scheduleNum", result);
				return "schedule/partInsertForm";
			}else{
				return "home";
			}
		}

		
		

		
		//main스케줄 수정하기 //시작 날짜, 마감날짜가 바뀐다 
		public int updateMainSchedule(ScheduleMainDTO scheduleMainDTO){
			return 0;
		}
		
		
		
		
		

		
		
		//저장된 part들 가져오기 //세부사항 등록시 필요
		public void partList(int scheduleNum){
			//List<SchedulePartDTO>
		} 
		
		public void partOne(){}
		
		
		//DTO내의 배열에 각각 값이 저장됨
		@RequestMapping(value="addPart", method=RequestMethod.POST)
		public String partWrite(SchedulePartArrayDTO schedulePartArrayDTO){
			int result =  scheduleService.insertPart(schedulePartArrayDTO);

			System.out.println("part등록 Controller result = "+result);

			return "schedule/main";
		}
		
		public void partUpdate(){}
		
		public void partDelete(){}
		
		
		
		
		
		
		
		//할일 리스트 뿌려주기 
		public void unitList(int scheduleNum){ 
			//List<ScheduleUnitDTO>
		}
		
		public void unitOne(){}
		
		
		public void unitWrite(){}
		
		public void unitUpdate(){}
		
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
