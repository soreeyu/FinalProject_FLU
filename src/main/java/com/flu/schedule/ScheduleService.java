package com.flu.schedule;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.flu.file.FileService;
import com.flu.member.MemberDAO;
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
		System.out.println("check하러 서비스옴");
		return scheduleDAO.checkSchedule(projectNum);
	}
	
	

	public int createSchedule(Integer projectNum){
		int scheduleNum = 0;
		//시퀀스 사용하여 스케줄테이블에 하나가 생성된다
		int result = scheduleDAO.createSchedule(projectNum); //우선 하나 생성함
		if(result > 0){
			scheduleNum = scheduleDAO.getScheduleNum(projectNum); //생성된 아이를 가져옴 
			System.out.println("만들고 가져온 scheduleNum(서비스) = "+scheduleNum);
			if(scheduleNum < 1){ //가져왔는데 이상한거지
				scheduleNum = 0; 
				//여기서 트랜잭션..롤백하면 좋은뒙 
			}
		}
		return scheduleNum; //실패하면 0 성공하면 스케줄 넘
	}






	//저장된 part들 가져오기 //세부사항 등록시 필요
	public List<SchedulePartDTO> partList(int scheduleNum){
		return scheduleDAO.partList(scheduleNum);
	} 




	//참여하고 있는 프리랜서 목록 가져오기 
	public List<MemberDTO> userList(int scheduleNum){ //재식친구의 DTO 리스트
		//여기서는 scheduleNum으로 projectNum 만 구해오고 그 projectNum을 사용해서 Member를 데려온다 //걍sql로 해결함
		//int projectNum = scheduleDAO.getProjectNum(scheduleNum);
		return scheduleDAO.userList(scheduleNum);
	} 



	//할일 리스트 뿌려주기 
	public List<ScheduleUnitDTO> unitList(int scheduleNum){ 
		return null;
	}



/*
	//make Schedule1 //애초에 이 작업이 제대로 진행안되면 스케줄이 아예 생성이 안된다고 보면됨
	public int insertMainSchedule(ScheduleMainDTO scheduleMainDTO, SchedulePartArrayDTO schedulePartArrayDTO ,HttpSession session) throws Exception{ 
		System.out.println("서비스");

		System.out.println("받아온 main "+scheduleMainDTO.getProjectNum());
		System.out.println("받아온 part array "+schedulePartArrayDTO.getPartName()[0]);
		FileService fileService = new FileService();
		int partCount = schedulePartArrayDTO.getPartDescFile().length;
		String [] partDescFileO = new String[partCount];
		String [] partDescFileF = new String[partCount];

		for(int i=0;i<partCount;i++){
			System.out.println(i+1+"번째 파일 이름 = "+ (schedulePartArrayDTO.getPartDescFile())[i].getOriginalFilename());
			String fileNameF = fileService.fileSave((schedulePartArrayDTO.getPartDescFile())[i], session); //upload파일에 저장하기 
			System.out.println("생성된 이름 = " + fileNameF);
			partDescFileO[i] = schedulePartArrayDTO.getPartDescFile()[i].getOriginalFilename();
			partDescFileF[i] = fileNameF;
		}


		schedulePartArrayDTO.setPartDescFileO(partDescFileO);
		schedulePartArrayDTO.setPartDescFileF(partDescFileF);


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
*/
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
				schedulePartDTO.setPartDescFileF(schedulePartArrayDTO.getPartDescFileF()[i]);
				schedulePartDTO.setPartDescFileO(schedulePartArrayDTO.getPartDescFileO()[i]);
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
	public int deletePart(SchedulePartDTO schedulePartDTO){
		return scheduleDAO.deletePart(schedulePartDTO);
	}





	//세부항목
	public int insertUnit(ScheduleUnitDTO scheduleUnitDTO){
		scheduleUnitDTO.setUnitDescFileF("파일이름");
		scheduleUnitDTO.setUnitDescFileO("파일진짜이름");
		return scheduleDAO.insertUnit(scheduleUnitDTO);
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
