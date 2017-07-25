package com.flu.schedule;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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
	
	/*
	 * projectNum으로 project DB 에 존재하는 지 체크 
	 * return 
	 * 		부재 : 0 
	 * 		존재 : 1
	 * */
	public int checkProject(Integer projectNum) throws Exception{
		System.out.println("프로젝트 존재여부확인용");
		return scheduleDAO.checkProject(projectNum);
	}
	

	/*
	 * projectNum으로 scheduleMain DB 에 존재하는 지 체크 
	 * return 
	 * 		부재 : null 
	 * 		존재 : ScheduleMainDTO 객체 (scheduleNum, startDate, finishDate, projectNum)
	 * */
	@Transactional
	public ScheduleMainDTO checkSchedule(Integer projectNum) throws Exception{
		System.out.println("check하러 서비스옴");
		return scheduleDAO.checkSchedule(projectNum);
	}
	
	
	/*
	 *  projectNum으로 scheduleMain DB 에 scheduleNum생성
	 *  return 
	 *  	- 성공 : 생성된 scheduleNum 
	 *  	- 실패 : 0
	 **/
	public int createSchedule(Integer projectNum){
		ScheduleMainDTO scheduleMainDTO = null;
		int scheduleNum = 0;
		//시퀀스 사용하여 스케줄테이블에 하나가 생성된다
		int result = scheduleDAO.createSchedule(projectNum); //우선 하나 생성함
		if(result > 0){
			scheduleMainDTO = scheduleDAO.getSchedule(projectNum); //생성된 아이를 가져옴 
			if(scheduleMainDTO != null){
				System.out.println("만들고 가져온 scheduleNum(서비스) = "+scheduleMainDTO.getScheduleNum());
				scheduleNum = scheduleMainDTO.getScheduleNum();
				if( scheduleNum < 1){ //가져왔는데 이상한거지
					scheduleNum = 0; 
					//여기서 트랜잭션..롤백하면 좋은뒙 
				}
			}else{
				//null이면 문제지
			}
			
		}
		return scheduleNum; //실패하면 0 성공하면 스케줄 넘
	}
	
	
	// 객체 두개를 받게 되지요 // mainDTO , partDTO //한번에 처리를 어디서 하면 좋을까요 ..
	//DB transaction 처리 되는지 확인 못함
	@Transactional
	public int insertMainPartSchedule(ScheduleMainDTO scheduleMainDTO, SchedulePartArrayDTO schedulePartArrayDTO ,HttpSession session) throws Exception{ 
		
		System.out.println("받아온 main scheduleNum"+scheduleMainDTO.getScheduleNum());
		System.out.println("받아온 part array 0번째"+schedulePartArrayDTO.getPartName()[0]);
		
		//받아온 파일들 저장해주는것 
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

		//upload 폴더에 저장완료 후 dto 객체에 이름 설정
		schedulePartArrayDTO.setPartDescFileO(partDescFileO);
		schedulePartArrayDTO.setPartDescFileF(partDescFileF);
		System.out.println("파일 저장까지 완료햇음 ");

		//여기부터 DB 관련 transaction 적용되어야한다 
		int result = scheduleDAO.updateMainSchedule(scheduleMainDTO);
		System.out.println("mainschedule 업데이트는 완료하였을까 ? "+result);
		

		System.out.println("partArrayDTO의 스케줄넘에는 들어가잇을지.. "+schedulePartArrayDTO.getScheduleNum());
		//schedulePartArrayDTO.setScheduleNum(scheduleMainDTO.getScheduleNum()); //이렇게 굳이 세팅안해도 들어가잇음 //이름이 같아서..
		//schedulePartArrayDTO.setScheduleNum(1000); //아무값이나 들어가면 안되는데....흠 ....//해결못한거..
		result = this.insertPart(schedulePartArrayDTO); // part 추가


		return result; //mainSheduleUpdate와 part들 추가
	}
	
	
	
	//make Schedule2 //같은 view에서 받아온 것들 //스케줄 생성이 성공하면 실행된다
	@Transactional
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
	




}
