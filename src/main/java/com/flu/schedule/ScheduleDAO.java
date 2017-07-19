package com.flu.schedule;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.flu.member.MemberDTO;
import com.flu.schedule.client.ScheduleMainDTO;
import com.flu.schedule.client.SchedulePartDTO;
import com.flu.schedule.client.ScheduleUnitDTO;

@Repository
public class ScheduleDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "ScheduleMapper.";
	
	//주어진 projectNum에 대한 schedule이 존재하는지 확인
	public ScheduleMainDTO checkSchedule(Integer projectNum){
		return sqlSession.selectOne(NAMESPACE+"checkS", projectNum);
	}

	
	
    //projectNum, 프로젝트 시작일 , 마감일 , scheduleNum 이 등록된다
	public int insertMainSchedule(ScheduleMainDTO scheduleMainDTO){ //넘어온 projectNum 이 저장되어있다 
		//시퀀스 사용하여 스케줄테이블에 하나가 생성된다 
		return sqlSession.insert(NAMESPACE+"addMainS", scheduleMainDTO); //스케줄 등록

	}
	
	//등록되어져잇는 scheduleNum 을 가져온다
	public int getScheduleNum(Integer projectNum){
		return sqlSession.selectOne(NAMESPACE+"getSNum", projectNum);
	}
	
	

	//main스케줄 수정하기 //시작 날짜, 마감날짜가 바뀐다 
	public int updateMainSchedule(ScheduleMainDTO scheduleMainDTO){
		return 0;
	}
	
	
	
	//저장된 part들 가져오기 //세부사항 등록시 필요
	public List<SchedulePartDTO> partList(int scheduleNum){
		List<SchedulePartDTO> ar = sqlSession.selectList(NAMESPACE+"listPart", scheduleNum);
		System.out.println("가져와졌나요 "+ar.get(0).getPartName());
		return sqlSession.selectList(NAMESPACE+"listPart", scheduleNum); 	
	} 
	
	//파트 하나 가져오기 
	public SchedulePartDTO partOne(int scheduleNum, int partNum){
		return null;
	}
	
	
	//파트 저장
	public int insertPart(SchedulePartDTO schedulePartDTO){
		return sqlSession.insert(NAMESPACE+"addPart", schedulePartDTO); 
	}
	
	

	
	//part수정하기 //진행중에 part 수정하는 경우에는 DB에서 part와 clientSchedule 의 part도 같이 수정되어야한다
	public int updatePart(SchedulePartDTO schedulePartDTO){
		return sqlSession.insert(NAMESPACE+"", schedulePartDTO); 
	}
	
	//수정이 아니라 삭제인 경우 이 part 에 해당하는 상세항목을 처리해줄 수 있어야한다 
	public int deletePart(SchedulePartDTO schedulePartDTO){
		return sqlSession.insert(NAMESPACE+"deletePart", schedulePartDTO); 
	}
	
	
	
	
	//세부항목
	public int insertUnit(ScheduleUnitDTO scheduleUnitDTO){
		return sqlSession.insert(NAMESPACE+"addUnit", scheduleUnitDTO); 
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
	
	
	
	//우선 안씀
	public int getProjectNum(int scheduleNum){
		return sqlSession.selectOne(NAMESPACE+"getPNum", scheduleNum);
	}
	
	
	//해당 스케줄에(프로젝트에) 참여중이 applicant 의 state가 'ing' 인 프리랜서들의 이메일, 이름, 닉네임을 가져옴
	public List<MemberDTO> userList(int scheduleNum){
		return sqlSession.selectList(NAMESPACE+"listUser", scheduleNum);
	}
	
	
	

	
	
	


}
