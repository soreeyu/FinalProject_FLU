package com.flu.schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flu.member.MemberDTO;
import com.flu.schedule.client.ScheduleMainDTO;
import com.flu.schedule.client.SchedulePartArrayDTO;
import com.flu.schedule.client.SchedulePartDTO;
import com.flu.schedule.client.ScheduleUnitDTO;

@Service
public class ScheduleService {
	
	@Autowired
	private ScheduleDAO scheduleDAO;
	
	
	
	public ScheduleMainDTO checkSchedule(Integer projectNum){
		return scheduleDAO.checkSchedule(projectNum);
	}
	
	
	
	
	
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
		public int insertMainSchedule(ScheduleMainDTO scheduleMainDTO, SchedulePartArrayDTO schedulePartArrayDTO){ //넘어온 projectNum 이 저장되어있다 
			System.out.println("받아온 main "+scheduleMainDTO.getProjectNum());
			System.out.println("받아온 part array "+schedulePartArrayDTO.getPartName()[0]);
			
			int scheduleNum = 0;
			//시퀀스 사용하여 스케줄테이블에 하나가 생성된다
			int result = scheduleDAO.insertMainSchedule(scheduleMainDTO); //main DB 
			if(result > 0){
				scheduleNum = scheduleDAO.getScheduleNum(scheduleMainDTO.getProjectNum()); //성공하면 result는 schedulenum임
				if(scheduleNum > 0){
					schedulePartArrayDTO.setScheduleNum(scheduleNum);
					result = this.insertPart(schedulePartArrayDTO); // part 추가
					
					if(result < 1){
						scheduleNum = 0; 
						//여기서 트랜잭션..롤백하면 좋은뒙 
					}
				}
			}
			
			
			return scheduleNum; //실패하면 0 성공하면 스케줄 넘
		}
		
		//make Schedule2 //같은 view에서 받아온 것들 //스케줄 생성이 성공하면 실행된다
		public int insertPart(SchedulePartArrayDTO schedulePartArrayDTO){
			int result = 0;
			//여러개의 값이 올수가 있습니다 
			if(schedulePartArrayDTO != null){
				for(int i=0;i<schedulePartArrayDTO.getPartName().length;i++){
					System.out.println("schedulePartDTO names = "+schedulePartArrayDTO.getPartName()[i]); //같은이름여러개면 ~~,~~,~~ 로 넘어가짐
					System.out.println("startDates = "+schedulePartArrayDTO.getPartStartDate()[i]); //마지막꺼만 들어와집니다..
					SchedulePartDTO schedulePartDTO = new SchedulePartDTO();
					schedulePartDTO.setScheduleNum(schedulePartArrayDTO.getScheduleNum());
					schedulePartDTO.setPartStartDate(schedulePartArrayDTO.getPartStartDate()[i]);
					schedulePartDTO.setPartFinishDate(schedulePartArrayDTO.getPartFinishDate()[i]);
					schedulePartDTO.setPartName(schedulePartArrayDTO.getPartName()[i]);
					schedulePartDTO.setPartNum(i);
					result = scheduleDAO.insertPart(schedulePartDTO); 
					System.out.println("잘들어갔나요 서비스 에서 반복문"+i+" 결과 "+result);
				}
			}
			
			return result;
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
