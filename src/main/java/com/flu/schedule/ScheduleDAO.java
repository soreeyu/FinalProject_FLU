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
	
	//해당 프로젝트가 존재하고 진행중이면 1
	public int checkProject(Integer projectNum) throws Exception{
		System.out.println("프로젝트 존재여부확인용 dao");
		return sqlSession.selectOne(NAMESPACE+"checkP",projectNum);
	}
	
	
	//주어진 projectNum에 대한 schedule이 존재하는지 확인 
	public ScheduleMainDTO checkSchedule(Integer projectNum) throws Exception{
		System.out.println("스케줄 check하러 DAO옴"+projectNum);
		ScheduleMainDTO dto = sqlSession.selectOne(NAMESPACE+"checkS", projectNum);
		System.out.println("스케줄 check하러 DAO 결과물"+dto);
		return dto;
	}
	
	//시퀀스 사용 insert mainschedule
	public int createSchedule(Integer projectNum) throws Exception{
		return sqlSession.insert(NAMESPACE+"createS", projectNum); //실패or성공임
	}
	

	//등록된 schedulemain 정보를 가져온다 (scheduleNum 필요할때도 사용)
	public ScheduleMainDTO getSchedule(Integer projectNum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"mainSInfo", projectNum);//만든 scheduleNum을 리던
	}
	
	//등록된 schedulemain 정보를 가져온다 (scheduleNum 으로 불러옴)
	public ScheduleMainDTO getSchedule2(Integer scheduleNum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"mainSInfo2", scheduleNum);//만든 scheduleNum을 리던
	}
	
	

	//main스케줄 수정하기 //시작 날짜, 마감날짜만 바꿈
	public int updateMainSchedule(ScheduleMainDTO scheduleMainDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"mainSUpdate",scheduleMainDTO);
	}
	
	//////////////////////////////////////////////////////
	
	//해당 스케줄에 존재하는 part 갯수
	public int partCount(SchedulePartDTO schedulePartDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"partCount", schedulePartDTO);
	}

	//파트 하나 정보 
	public SchedulePartDTO partOne(SchedulePartDTO schedulePartDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"partOne", schedulePartDTO);
	}


	//저장된 part들 가져오기 //세부사항 등록시 필요
	public List<SchedulePartDTO> partList(int scheduleNum) throws Exception{
		List<SchedulePartDTO> ar = sqlSession.selectList(NAMESPACE+"partList", scheduleNum);
		System.out.println("part list 확인 dao 0번째이름 "+ar.get(0).getPartName());
		return sqlSession.selectList(NAMESPACE+"partList", scheduleNum); 	
	} 
	
		
	//파트 세부정보저장
	public int insertPart(SchedulePartDTO schedulePartDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"partInsert", schedulePartDTO); 
	}
	
	

	
	//part수정하기 
	//진행중에 part 수정하는 경우에는 DB에서 part와 clientSchedule 의 part도 같이 수정되어야한다 ..?
	public int updatePart(SchedulePartDTO schedulePartDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"partUpdate", schedulePartDTO); 
	}
	
	//수정이 아니라 삭제인 경우 이 part 에 해당하는 상세항목을 처리해줄 수 있어야한다 
	public int deletePart(SchedulePartDTO schedulePartDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"partDelete", schedulePartDTO); 
	}
	
	
	
	
	//세부항목
	//원하는 조건에 해당하는 unit들의 갯수//아무조건도 없을경우는 전체갯수지요
	public int unitCount(ScheduleUnitDTO scheduleUnitDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"unitCount", scheduleUnitDTO);
	}
	
	//unit 하나에 대한 상세정보
	public ScheduleUnitDTO unitOne(ScheduleUnitDTO scheduleUnitDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"unitOne", scheduleUnitDTO);
	}

	//원하는 조건에 해당하는 unit들
	public List<ScheduleUnitDTO> unitList(ScheduleUnitDTO scheduleUnitDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"unitList", scheduleUnitDTO);
	}
	
	
	public int unitInsert(ScheduleUnitDTO scheduleUnitDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"unitInsert", scheduleUnitDTO); 
	}
	
	
	
	public int unitUpdate(ScheduleUnitDTO scheduleUnitDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"unitUpdate",scheduleUnitDTO);
	}
	
	
	//권한이 맞으면 삭제 허용하되 // 확인작업은 거쳐야한다 //서비스나 컨트롤러에서 해야지
	public int unitDelete(ScheduleUnitDTO scheduleUnitDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"unitDelete",scheduleUnitDTO);
	}
	

	
	///////////////////////////////////////////////////
	
	//해당 스케줄에(프로젝트에) 참여중이 applicant 의 state가 'ing' 인 프리랜서들의 이메일, 이름, 닉네임을 가져옴
	public List<MemberDTO> userList(int scheduleNum) throws Exception{
		return sqlSession.selectList(NAMESPACE+"userList", scheduleNum);
	}
	
	
	
	

	
	//프리랜서 용 // 할일에 지정되있는 user가 email 계정과 동일해야한다  
	public int stateChange(ScheduleUnitDTO scheduleUnitDTO) throws Exception{
		//clientSchedule 부분에 state를 변경해준다 
		return sqlSession.update(NAMESPACE+"stateChange", scheduleUnitDTO);
	}	
	
	
	//프리랜서 용 // 할일에 지정되있는 user가 email 계정과 동일해야한다  
	public void uploadResult(String file,String contents) throws Exception { //파일이 여러개일 수 있음 //멀티파트파일리스트를 받아야할수도 있음
		
	}  
	
	



}
