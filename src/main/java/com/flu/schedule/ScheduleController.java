package com.flu.schedule;

import java.util.List;

import com.flu.member.MemberDTO;
import com.flu.schedule.client.ScheduleMainDTO;
import com.flu.schedule.client.SchedulePartDTO;
import com.flu.schedule.client.ScheduleUnitDTO;

public class ScheduleController {
	
	private ScheduleService scheduleService;
	
	   //참여하고 있는 프리랜서 목록 가져오기 
		public List<MemberDTO> getUsers(int projectNum){ //재식친구의 DTO 리스트
			return null;
		} 
		//저장된 part들 가져오기 //세부사항 등록시 필요
		public List<SchedulePartDTO> getParts(int scheduleNum){
			return null;
		} 
		
		//할일 리스트 뿌려주기 
		public List<ScheduleUnitDTO> getUnitList(int scheduleNum){ 
			return null;
		}
		
		
		
		
		
		
		//make Schedule1 //애초에 이 작업이 제대로 진행안되면 스케줄이 아예 생성이 안된다고 보면됨
		public int insertMainSchedule(ScheduleMainDTO scheduleMainDTO){ //넘어온 projectNum 이 저장되어있다 
			//시퀀스 사용하여 스케줄테이블에 하나가 생성된다 
			return 0;
		}
		
		//make Schedule2 //같은 view에서 받아온 것들 //스케줄 생성이 성공하면 실행된다
		public int insertPart(SchedulePartDTO schedulePartDTO){
			return 0;
		}
		
		
		
		
		
		//main스케줄 수정하기 //시작 날짜, 마감날짜가 바뀐다 
		public int updateMainSchedule(ScheduleMainDTO scheduleMainDTO){
			return 0;
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
		


		
		//프리랜서 용 // 할일에 지정되있는 user가 email 계정과 동일해야한다  
		public void stateChange(String user,Integer doNum){
			//clientSchedule 부분에 state를 변경해준다 
		}	
		
		//프리랜서 용 // 할일에 지정되있는 user가 email 계정과 동일해야한다  
		public void uploadResult(String file,String contents){ //파일이 여러개일 수 있음 //멀티파트파일리스트를 받아야할수도 있음
			
		}  
		
	
	

}