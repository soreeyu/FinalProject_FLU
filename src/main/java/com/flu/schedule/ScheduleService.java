package com.flu.schedule;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flu.file.FileService;
import com.flu.member.MemberDTO;
import com.flu.schedule.client.ScheduleMainDTO;
import com.flu.schedule.client.SchedulePartArrayDTO;
import com.flu.schedule.client.SchedulePartDTO;
import com.flu.schedule.client.ScheduleUnitDTO;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

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
	
	
	public ScheduleMainDTO mainScheduleOne(Integer scheduleNum) throws Exception{
		return scheduleDAO.getSchedule2(scheduleNum);
	}
	
	
	/*
	 *  projectNum으로 scheduleMain DB 에 scheduleNum생성
	 *  return 
	 *  	- 성공 : 생성된 scheduleNum 
	 *  	- 실패 : 0
	 **/
	public int createSchedule(Integer projectNum) throws Exception{
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
	public int insertPart(SchedulePartArrayDTO schedulePartArrayDTO) throws Exception{
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
				//schedulePartDTO.setPartNum(i); //DB에서 가장 큰 숫자 다음 숫자로 세팅함 
				schedulePartDTO.setPartDescFileF(schedulePartArrayDTO.getPartDescFileF()[i]);
				schedulePartDTO.setPartDescFileO(schedulePartArrayDTO.getPartDescFileO()[i]);
				result = scheduleDAO.insertPart(schedulePartDTO); //파트 여러개
				System.out.println("잘들어갔나요 서비스 에서 반복문"+i+" 결과 "+result);
			}
		}

		return result;
	}
	
	////////////////////////////////////////////////////////////////////////
	
	//해당 스케줄에 존재하는 part 갯수
		public int partCount(SchedulePartDTO schedulePartDTO) throws Exception{
			return scheduleDAO.partCount(schedulePartDTO);
		}

		//파트 하나 정보 
		public SchedulePartDTO partOne(SchedulePartDTO schedulePartDTO) throws Exception{
			return scheduleDAO.partOne(schedulePartDTO);
		}


		//저장된 part들 가져오기 //세부사항 등록시 필요
		public List<SchedulePartDTO> partList(int scheduleNum) throws Exception{
			return scheduleDAO.partList(scheduleNum);
		} 
		
			
		//파트 세부정보저장
		public int insertPart(SchedulePartDTO schedulePartDTO) throws Exception{
			return scheduleDAO.insertPart(schedulePartDTO);
		}
		
		

		
		//part수정하기 
		//진행중에 part 수정하는 경우에는 DB에서 part와 clientSchedule 의 part도 같이 수정되어야한다 ..?
		public int updatePart(SchedulePartDTO schedulePartDTO) throws Exception{
			return scheduleDAO.updatePart(schedulePartDTO);
		}
		
		//수정이 아니라 삭제인 경우 이 part 에 해당하는 상세항목을 처리해줄 수 있어야한다 
		public int deletePart(SchedulePartDTO schedulePartDTO) throws Exception{
			return scheduleDAO.deletePart(schedulePartDTO);
		}
		
		
		
		
		//세부항목
		//원하는 조건에 해당하는 unit들의 갯수//아무조건도 없을경우는 전체갯수지요
		public int unitCount(ScheduleUnitDTO scheduleUnitDTO) throws Exception{
			return scheduleDAO.unitCount(scheduleUnitDTO);
		}
		
		//unit 하나에 대한 상세정보
		public ScheduleUnitDTO unitOne(ScheduleUnitDTO scheduleUnitDTO) throws Exception{
			return scheduleDAO.unitOne(scheduleUnitDTO);
		}

		//원하는 조건에 해당하는 unit들
		public List<ScheduleUnitDTO> unitList(ScheduleUnitDTO scheduleUnitDTO) throws Exception{
			return scheduleDAO.unitList(scheduleUnitDTO);
		}
		
		public int unitListInsert(ArrayList<ScheduleUnitDTO> list) throws Exception{
			int result = 0;
			
			for(int i=0;i<list.size();i++){
				result = this.unitInsert(list.get(i));
			}
			
			return result;
		}
		
		
		
		
		
		
		
		
		//insert
		public int setUnits(String jsonData) throws Exception{


			JSONObject object = (JSONObject)JSONValue.parse(jsonData);
			JSONArray data = (JSONArray) object.get("data");

			ArrayList<ScheduleUnitDTO> unitlist = new ArrayList<ScheduleUnitDTO>();
			ArrayList<SchedulePartDTO> partlist = new ArrayList<SchedulePartDTO>();
			ScheduleUnitDTO scheduleUnitDTO = null;
			SchedulePartDTO schedulePartDTO = null;

			for(int i=0; i<data.size();i++){
				JSONObject oneUnit = (JSONObject)data.get(i);

				System.out.println(oneUnit.get("id").toString()); // scheduleNum_partNum_unitNum
				String[] nums = oneUnit.get("id").toString().split("_");
				
				for(String num:nums){
					System.out.println("num들 = "+num);
				}
				
				System.out.println("할일제목 = " + oneUnit.get("text").toString());
				//System.out.println("홀더  (상세설명 폼이어야할듯하오 ) " + oneUnit.get("holder"));//없는것도 있음...
				System.out.println("시작일 = " + oneUnit.get("start_date").toString());
				System.out.println("마감일= " + oneUnit.get("end_date").toString());
				System.out.println("타입 = " + oneUnit.get("type")); //part 는 0 unit 1 
				//System.out.println(oneUnit.get("color").toString()); //없을수도있음 
				System.out.println("브모 = " + oneUnit.get("parent").toString());

				if( (Integer.parseInt((oneUnit.get("type").toString()))) == 1){
					System.out.println("unit임 ");
					//unit들 
					scheduleUnitDTO = new ScheduleUnitDTO();
					int scheduleNum = Integer.parseInt(nums[0]);
					int partNum = Integer.parseInt(nums[1]);
					int unitNum = Integer.parseInt(nums[2]);
					String unitName = oneUnit.get("text").toString();

					String unitStartDate = oneUnit.get("start_date").toString();
					String unitFinishDate = oneUnit.get("end_date").toString();

					// ((MemberDTO)session.getAttribute("member")).getEmail()
					//scheduleUnitDTO.setEmail(); //담당자 정해서 넘겨야된다 

					scheduleUnitDTO.setScheduleNum(scheduleNum);
					scheduleUnitDTO.setPartNum(partNum);
					scheduleUnitDTO.setUnitNum(unitNum);
					//scheduleUnitDTO.setUnitDescribe(unitDescribe);
					scheduleUnitDTO.setUnitName(unitName);
					scheduleUnitDTO.setUnitFinishDate(unitFinishDate);
					scheduleUnitDTO.setUnitStartDate(unitStartDate);
					scheduleUnitDTO.setUnitState("할일");
					
					scheduleUnitDTO.setUnitDescFileO("");
					scheduleUnitDTO.setUnitDescFileF("");
					scheduleUnitDTO.setEmail("myeon01@flu.com");


					unitlist.add(scheduleUnitDTO);
					
				}else if(Integer.parseInt((oneUnit.get("type").toString())) == 0){ 
					System.out.println("part임 ");
					
					//unit들 
					schedulePartDTO = new SchedulePartDTO();
					int scheduleNum = Integer.parseInt(nums[0]);
					int partNum = Integer.parseInt(nums[1]);
					
					String partName = oneUnit.get("text").toString();

					String partStartDate = oneUnit.get("start_date").toString();
					String partFinishDate = oneUnit.get("end_date").toString();

					// ((MemberDTO)session.getAttribute("member")).getEmail()
					schedulePartDTO.setScheduleNum(scheduleNum);
					schedulePartDTO.setPartNum(partNum);
					schedulePartDTO.setPartName(partName);
					schedulePartDTO.setPartFinishDate(partFinishDate);
					schedulePartDTO.setPartStartDate(partStartDate);
					
					schedulePartDTO.setPartDescFileF("");
					schedulePartDTO.setPartDescFileO("");
					


					
					partlist.add(schedulePartDTO);
					
					
				}
				
			}//for문 끝


			System.out.println(" 만들어진 unit 리스트 "+unitlist.toString());
			System.out.println(" 만들어진 part 리스트 "+partlist.toString());
			//int result = (partlist); //파트 먼저 insert
			//int result = this.unitListInsert(unitlist);
			return 0;
		}
		
		
		public int unitInsert(ScheduleUnitDTO scheduleUnitDTO) throws Exception{
			return scheduleDAO.unitInsert(scheduleUnitDTO);
		}
		
		
		
		public int unitUpdate(ScheduleUnitDTO scheduleUnitDTO) throws Exception{
			return scheduleDAO.unitUpdate(scheduleUnitDTO);
		}
		
		
		//권한이 맞으면 삭제 허용하되 // 확인작업은 거쳐야한다 //서비스나 컨트롤러에서 해야지
		public int unitDelete(ScheduleUnitDTO scheduleUnitDTO) throws Exception{
			return scheduleDAO.unitDelete(scheduleUnitDTO);
		}
		

		
		///////////////////////////////////////////////////
		
		//해당 스케줄에(프로젝트에) 참여중이 applicant 의 state가 'ing' 인 프리랜서들의 이메일, 이름, 닉네임을 가져옴
		public List<MemberDTO> userList(int scheduleNum) throws Exception{
			return scheduleDAO.userList(scheduleNum);
		}
		
		
		
		

		
		//프리랜서 용 // 할일에 지정되있는 user가 email 계정과 동일해야한다  
		public int stateChange(ScheduleUnitDTO scheduleUnitDTO) throws Exception{
			//clientSchedule 부분에 state를 변경해준다 
			return scheduleDAO.stateChange(scheduleUnitDTO);
		}	
	
		
		
		
		public ScheduleSummaryDTO getfirstViewData(int scheduleNum) throws Exception{
			System.out.println("첫번째뷰를 위한 서비스  스케줄넘 " + scheduleNum);

			
			//배열 4개
			
			
			//1 part별 상태갯수 
			//part 1 > 할일 3개 , 진행중 2개 , 완료 1개  , total몇개  
			//part 2 > 할일 ~ 
			
			
			//2 멤버별 상태 갯수 
			// member 1 > 할일 5개 , 진행중 3개, 완료 1 개 , total 몇개 
			
			
			//part의 갯수와 member의 수가 동적임 //list로 뿌려주는것이 좋겠다 
			
			
			
			//3 상태별 
			//할일 몇개 진행중 몇개 완료 몇개  total몇개
			//단순히 하나만 있으면 됨 
			
			//여기서 scheduleSummary 채우기
			
			ScheduleSummaryDTO scheduleSummaryDTO = new ScheduleSummaryDTO();
			int [] totalCount = new int[4];
			int [] stateCountPerPart = new int [4];
			int [] stateCountPerUser = new int [4];
			ArrayList<int []> countParts = new ArrayList<int[]>();
			ArrayList<int []> countUsers = new ArrayList<int[]>();
			ArrayList<String> partNames = new ArrayList<String>();
			ArrayList<String> userNames = new ArrayList<String>();
			
			
			
			ScheduleUnitDTO dto = new ScheduleUnitDTO();
			dto.setPartNum(-1);
			dto.setScheduleNum(scheduleNum);
			dto.setEmail("");
			
			dto.setUnitState("할일");
			int count = scheduleDAO.unitCount(dto); 
			System.out.println("전체할일파할일 수="+count);
			totalCount[0] = count;
			
			dto.setUnitState("진행중");
			count = scheduleDAO.unitCount(dto); 
			System.out.println("전체진행중 수="+count);
			totalCount[1] = count;
			
			dto.setUnitState("완료");
			count = scheduleDAO.unitCount(dto); 
			System.out.println("전체완료 수="+count);
			totalCount[2] = count;
			
			dto.setUnitState("");
			count = scheduleDAO.unitCount(dto); 
			System.out.println("할일파트할일 수="+count);
			totalCount[3] = count;
			
			//일단 전체적인 것 구하고
			
			
			
			//part를 구하고
			List<SchedulePartDTO> parts = scheduleDAO.partList(scheduleNum);
			for(int i=0;i<parts.size();i++){ //6번이 돌기는 하는데 값은 없다..?
				System.out.println("parts.get(i).getPartNum() = " + parts.get(i).getPartNum());
				ScheduleUnitDTO scheduleUnitDTO = new ScheduleUnitDTO();
				scheduleUnitDTO.setPartNum(parts.get(i).getPartNum());
				scheduleUnitDTO.setScheduleNum(scheduleNum);
				scheduleUnitDTO.setEmail("");
				
				scheduleUnitDTO.setUnitState("할일");
				int num = scheduleDAO.unitCount(scheduleUnitDTO); 
				System.out.println("할일파트할일 수"+i+"="+num);
				stateCountPerPart[0] = num;
				
				scheduleUnitDTO.setUnitState("진행중");
				int num2 = scheduleDAO.unitCount(scheduleUnitDTO); 
				System.out.println("진행중파트할일 수"+i+"="+num2);
				stateCountPerPart[1] = num2;
				
				scheduleUnitDTO.setUnitState("완료");
				int num3 = scheduleDAO.unitCount(scheduleUnitDTO); 
				System.out.println("완료파트할일 수"+i+"="+num3);
				stateCountPerPart[2] = num3;
				
				scheduleUnitDTO.setUnitState("");
				int num4 = scheduleDAO.unitCount(scheduleUnitDTO); 
				System.out.println("전체파트할일 수"+i+"="+num4);
				stateCountPerPart[3] = num4;
				
				countParts.add(stateCountPerPart);
				partNames.add(parts.get(i).getPartName());
			}
			
			
			////////////////////////////user를 구하고
			List<MemberDTO> users = scheduleDAO.userList(scheduleNum);
			for(int i=0;i<users.size();i++){
				ScheduleUnitDTO scheduleUnitDTO = new ScheduleUnitDTO();
				scheduleUnitDTO.setPartNum(-1);
				scheduleUnitDTO.setScheduleNum(scheduleNum);
				scheduleUnitDTO.setEmail(users.get(i).getEmail());
				
				
				scheduleUnitDTO.setUnitState("할일");
				int num = scheduleDAO.unitCount(scheduleUnitDTO);
				System.out.println("할일유저할일 수"+i+"="+num);
				stateCountPerUser[0] = num;
				
				scheduleUnitDTO.setUnitState("진행중");
				int num2 = scheduleDAO.unitCount(scheduleUnitDTO);
				System.out.println("진행중유저할일 수"+i+"="+num2);
				stateCountPerUser[1] = num2;
				
				scheduleUnitDTO.setUnitState("완료");
				int num3 = scheduleDAO.unitCount(scheduleUnitDTO);
				System.out.println("완료유저할일 수"+i+"="+num3);
				stateCountPerUser[2] = num3;
				
				scheduleUnitDTO.setUnitState("");
				int num4 = scheduleDAO.unitCount(scheduleUnitDTO);
				System.out.println("전체유저할일 수"+i+"="+num4);
				stateCountPerUser[3] = num4;
		
				countUsers.add(stateCountPerUser);
				userNames.add(users.get(i).getEmail());
			}

			for(int i=0;i<countParts.size();i++){
				for(int j=0;j<4;j++){
					System.out.println("결론 파트"+i+"의 "+j+" = "+countParts.get(i)[j]);									
				}
			}
			
			for(int i=0;i<countUsers.size();i++){
				for(int j=0;j<4;j++){
					System.out.println("결론 사용자"+i+"의 "+j+" = "+countUsers.get(i)[j]);									
				}
			}

	
			scheduleSummaryDTO.setStateCountPerPart(countParts);
			scheduleSummaryDTO.setStateCountPerUser(countUsers);
			scheduleSummaryDTO.setStateCount(totalCount);
			scheduleSummaryDTO.setUserNames(userNames);
			scheduleSummaryDTO.setPartNames(partNames);
			
			return scheduleSummaryDTO;
			
		}
		
		public void makeExcel(){
			System.out.println("엑셀파일 만들러 서비스들어옴 ");
			
			/*// 엑셀파일 객체 생성
			WritableWorkbook workbook = null;
			
			// 시트 객체 생성
			WritableSheet sheet = null;
			
			// 셀 객체 생성
			Label label = null;
			
			
			// 저장할 파일 객체 생성
			File file = new File("C:\\test.xls");
			
			
			// 테스트 데이터
			HashMap<String, String> hm_0 = new HashMap() ;
			hm_0.put("name", "홍길동") ;
			hm_0.put("age", "21") ;
			
			HashMap hm_1 = new HashMap() ;
			hm_1.put("name", "김영희") ;
			hm_1.put("age", "20") ;
			
			List list = new ArrayList();
			list.add(hm_0) ;
			list.add(hm_1) ;
			
			
			try{
				
				// 파일 생성
				workbook = Workbook.createWorkbook(file);
				
				// 시트 생성
				workbook.createSheet("sheet1", 0);
				sheet = workbook.getSheet(0);
				
				// 셀에 쓰기
				label = new Label(0, 0, "name");
				sheet.addCell(label);
				
				label = new Label(1, 0, "age");
				sheet.addCell(label);
				
				
				
				// 데이터 삽입
				for(int i=0; i < list.size(); i++){
					HashMap rs = (HashMap)list.get(i) ;
					
					label = new Label(0, (i+1), (String)rs.get("name"));
					sheet.addCell(label);
					
					label = new Label(1, (i+1), (String)rs.get("age"));
					sheet.addCell(label);
					
				}
				
				
				workbook.write();
				workbook.close();

			}catch(Exception e){
				e.printStackTrace();
			}*/
			
			
			
			
			
			
			try {
			this.excelWrite(new File("M:\\ExcelWriteSample.xls"), this.getData());
			} catch (WriteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}



		}
	
	
		
		

		/** * * @param file * @param data * @throws IOException * @throws WriteException */
		public void excelWrite(File file, List<Map<String, Object>> data)
				throws IOException, WriteException {

			// WorkBook 생성
			WritableWorkbook wb = Workbook.createWorkbook(file);

			// WorkSheet 생성
			WritableSheet sh = wb.createSheet("테스트", 0);
			// 열넓이 설정 (열 위치, 넓이)
			sh.setColumnView(0, 10);
			sh.setColumnView(1, 20);
			sh.setColumnView(2, 20);
			sh.setColumnView(3, 20);

			// 셀형식
			WritableCellFormat textFormat = new WritableCellFormat();

			// 생성
			textFormat.setAlignment(Alignment.CENTRE);
			// 테두리
			textFormat.setBorder(Border.ALL, BorderLineStyle.THIN);

			int row = 0;

			// 헤더
			Label label = new jxl.write.Label(0, row, "이름", textFormat);
			sh.addCell(label);

			label = new jxl.write.Label(1, row, "주소", textFormat);
			sh.addCell(label);

			label = new jxl.write.Label(2, row, "전화번호", textFormat);
			sh.addCell(label);

			label = new jxl.write.Label(3, row, "비고", textFormat);
			sh.addCell(label);

			row++;

			for (Map<String, Object> tem : data) {

				// 이름
				label = new jxl.write.Label(0, row, (String) tem.get("name"),
						textFormat);
				sh.addCell(label);
				// 주소
				label = new jxl.write.Label(1, row, (String) tem.get("addr"),
						textFormat);
				sh.addCell(label);
				// 전화번호
				label = new jxl.write.Label(2, row, (String) tem.get("tel"),
						textFormat);
				sh.addCell(label);
				// 비고
				label = new jxl.write.Label(3, row, (String) tem.get("etc"),
						textFormat);
				sh.addCell(label);

				row++;
			}

			// WorkSheet 쓰기
			wb.write();

			// WorkSheet 닫기
			wb.close();

		}

		/** * 출력할 데이터 * * @return */
		public List<Map<String, Object>> getData() {

			List<Map<String, Object>> data = new ArrayList<Map<String, Object>>();

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("name", "이기자");
			map.put("addr", "서울시 강북");
			map.put("tel", "010-XXXX-XXXX");
			map.put("etc", "");

			data.add(map);

			map = new HashMap<String, Object>();
			map.put("name", "김철순");
			map.put("addr", "서울시 강남");
			map.put("tel", "010-XXXX-XXXX");
			map.put("etc", "");

			data.add(map);

			map = new HashMap<String, Object>();
			map.put("name", "박순심");
			map.put("addr", "서울시 서초");
			map.put("tel", "010-XXXX-XXXX");
			map.put("etc", "");

			data.add(map);

			map = new HashMap<String, Object>();
			map.put("name", "강기남");
			map.put("addr", "서울시 송파");
			map.put("tel", "010-XXXX-XXXX");
			map.put("etc", "");

			data.add(map);

			return data;

		}



	




}
