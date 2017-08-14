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
import com.flu.schedule.freelancer.ScheduleResultFileDTO;
import com.flu.schedule.freelancer.SheduleFreeTodoResultDTO;

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
    *       부재 : 0 
    *       존재 : 1
    * */
   public int checkProject(Integer projectNum) throws Exception{
      System.out.println("프로젝트 존재여부확인용");
      return scheduleDAO.checkProject(projectNum);
   }
   

   /*
    * projectNum으로 scheduleMain DB 에 존재하는 지 체크 
    * return 
    *       부재 : null 
    *       존재 : ScheduleMainDTO 객체 (scheduleNum, startDate, finishDate, projectNum)
    * */
   //@Transactional
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
    *     - 성공 : 생성된 scheduleNum 
    *     - 실패 : 0
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
   //@Transactional
   public int insertMainPartSchedule(ScheduleMainDTO scheduleMainDTO, SchedulePartArrayDTO schedulePartArrayDTO ,HttpSession session) throws Exception{ 
      
      System.out.println("받아온 main scheduleNum"+scheduleMainDTO.getScheduleNum());
      System.out.println("받아온 part array 0번째"+schedulePartArrayDTO.getPartName()[0]);
      /*
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
      */
      //this.partFileSave(schedulePartArrayDTO,session);

      //여기부터 DB 관련 transaction 적용되어야한다 
      int result = scheduleDAO.updateMainSchedule(scheduleMainDTO);
      System.out.println("mainschedule 업데이트는 완료하였을까 ? "+result);
      

      System.out.println("partArrayDTO의 스케줄넘에는 들어가잇을지.. "+schedulePartArrayDTO.getScheduleNum());
      //schedulePartArrayDTO.setScheduleNum(scheduleMainDTO.getScheduleNum()); //이렇게 굳이 세팅안해도 들어가잇음 //이름이 같아서..
      //schedulePartArrayDTO.setScheduleNum(1000); //아무값이나 들어가면 안되는데....흠 ....//해결못한거..
      result = this.insertPart(schedulePartArrayDTO,session); // part 추가


      return result; //mainSheduleUpdate와 part들 추가
   }
   
   public void partFileSave(SchedulePartArrayDTO schedulePartArrayDTO,HttpSession session) throws Exception{
      //받아온 파일들 저장해주는것 
            FileService fileService = new FileService();
            int partCount = schedulePartArrayDTO.getPartDescFile().length; //파일들
            
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
   }
   
   //make Schedule2 //같은 view에서 받아온 것들 //스케줄 생성이 성공하면 실행된다
   //@Transactional
   public int insertPart(SchedulePartArrayDTO schedulePartArrayDTO,HttpSession session) throws Exception{
      
      this.partFileSave(schedulePartArrayDTO,session);
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
         System.out.println("값왓니2?"+scheduleUnitDTO.getUnitDescribe());
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
         String state = scheduleUnitDTO.getUnitState();
         String unitState = "할일";
         
         if(state.equals("0")){
            unitState = "할일";
         }else if(state.equals("1")){
            unitState = "진행중";
         }else if(state.equals("2")){
            unitState = "완료";
         }
         
         scheduleUnitDTO.setUnitState(unitState); 
         System.out.println("적용된 상태 보기   "+scheduleUnitDTO.getUnitState());
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
         System.out.println("전체유닛수카운트="+count);
         totalCount[3] = count;
         
         //일단 전체적인 것 구하고
         
         
         
         //part를 구하고
         List<SchedulePartDTO> parts = scheduleDAO.partList(scheduleNum);
         for(int i=0;i<parts.size();i++){ //6번이 돌기는 하는데 값은 없다..?
            stateCountPerPart = new int [4];//이걸 해줘야할까..?dd
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
            System.out.println("파트별유닛수테스트 ......."+countParts.get(i)[0]+countParts.get(i)[1]+countParts.get(i)[2]+countParts.get(i)[3]);
            partNames.add(parts.get(i).getPartName());
            
            Thread.sleep(200);
         }
         //여기서 리셋됨
         //System.out.println("0번.........파트별유닛수테스트 ......."+countParts.get(0)[0]+countParts.get(0)[1]+countParts.get(0)[2]+countParts.get(0)[3]);
         
         ////////////////////////////user를 구하고
         List<MemberDTO> users = scheduleDAO.userList(scheduleNum);
         for(int i=0;i<users.size();i++){
            stateCountPerUser = new int [4];//이걸 해줘야할까..?
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
      
      public void makeExcel(Integer scheduleNum, HttpSession session) throws Exception{
         System.out.println("엑셀파일 만들러 서비스들어옴 ");
         
         String realPath = session.getServletContext().getRealPath("resources/excel");
         File f = new File(realPath);
         if(!f.exists()){
            f.mkdirs();
         }
         System.out.println("엑셀리얼패스"+realPath);
         String fileName = "ExcelWriteSchedule.xls";
         File target = new File(f, fileName);
         
         try {
            this.excelWrite(target, this.getData(scheduleNum));
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
         WritableSheet sh = wb.createSheet("스케줄", 0);
         // 열넓이 설정 (열 위치, 넓이)
         sh.setColumnView(0, 10);
         sh.setColumnView(1, 20);
         sh.setColumnView(2, 20);
         sh.setColumnView(3, 20);
         sh.setColumnView(4, 20);
         sh.setColumnView(5, 20);
         sh.setColumnView(6, 20);

         
         // 셀형식
         WritableCellFormat textFormat = new WritableCellFormat();

         // 생성
         textFormat.setAlignment(Alignment.CENTRE);
         // 테두리
         textFormat.setBorder(Border.ALL, BorderLineStyle.THIN);

         int row = 0;

         // 헤더
         Label label = new jxl.write.Label(0, row, "파트", textFormat);
         sh.addCell(label);

         label = new jxl.write.Label(1, row, "업무", textFormat);
         sh.addCell(label);

         label = new jxl.write.Label(2, row, "상태", textFormat);
         sh.addCell(label);

         label = new jxl.write.Label(3, row, "담당자", textFormat);
         sh.addCell(label);
         
         label = new jxl.write.Label(4, row, "시작일", textFormat);
         sh.addCell(label);

         label = new jxl.write.Label(5, row, "마감일", textFormat);
         sh.addCell(label);

         label = new jxl.write.Label(6, row, "상세설명", textFormat);
         sh.addCell(label);

         row++;

         for (Map<String, Object> tem : data) {

            // 파트
            label = new jxl.write.Label(0, row, (String) tem.get("part"),
                  textFormat);
            sh.addCell(label);
            // 업무
            label = new jxl.write.Label(1, row, (String) tem.get("unit"),
                  textFormat);
            sh.addCell(label);
            //상태
            label = new jxl.write.Label(2, row, (String) tem.get("state"),
                  textFormat);
            sh.addCell(label);
            //담당자
            label = new jxl.write.Label(3, row, (String) tem.get("email"),
                  textFormat);
            sh.addCell(label);
            
            //시작일
            label = new jxl.write.Label(4, row, (String) tem.get("startDate"),
                  textFormat);
            sh.addCell(label);
            
            //마감일
            label = new jxl.write.Label(5, row, (String) tem.get("finishDate"),
                  textFormat);
            sh.addCell(label);
            
            //상세설명
            label = new jxl.write.Label(6, row, (String) tem.get("desc"),
                  textFormat);
            sh.addCell(label);

            row++;
         }

         // WorkSheet 쓰기
         wb.write();

         // WorkSheet 닫기
         wb.close();

      }

      /** * 출력할 데이터 * * @return 
       * @throws Exception */
      public List<Map<String, Object>> getData(Integer scheduleNum) throws Exception {

         

         List<SchedulePartDTO> partList = this.partList(scheduleNum);
         
         for(int i=0;i<partList.size();i++){
            ScheduleUnitDTO scheduleUnitDTO = new ScheduleUnitDTO();
            scheduleUnitDTO.setScheduleNum(scheduleNum);
            scheduleUnitDTO.setEmail("");
            scheduleUnitDTO.setUnitState("");
            scheduleUnitDTO.setPartNum(partList.get(i).getPartNum());
            List<ScheduleUnitDTO> unitList = this.unitList(scheduleUnitDTO);
            partList.get(i).setUnitList(unitList);
         }
         //데이터 다가져옴 
         
         
         List<Map<String, Object>> data = new ArrayList<Map<String, Object>>();
         
         //list가지고 포문돌리면서 데이터 넣어주기
         for(int i=0;i<partList.size();i++){
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("part", partList.get(i).getPartName());
            map.put("unit", "");
            map.put("state", "");
            map.put("email", "");
            map.put("startDate",  partList.get(i).getPartStartDate());
            map.put("finishDate",  partList.get(i).getPartFinishDate());
            map.put("desc", "");   
            data.add(map);
            
            for(int j=0;j<partList.get(i).getUnitList().size();j++){
               Map<String, Object> map2 = new HashMap<String, Object>();
               map2.put("part", "");
               map2.put("unit", partList.get(i).getUnitList().get(j).getUnitName());
               map2.put("state", partList.get(i).getUnitList().get(j).getUnitState());
               map2.put("email", partList.get(i).getUnitList().get(j).getEmail());
               map2.put("startDate",  partList.get(i).getUnitList().get(j).getUnitStartDate());
               map2.put("finishDate",  partList.get(i).getUnitList().get(j).getUnitFinishDate());
               map2.put("desc", partList.get(i).getUnitList().get(j).getUnitDescribe());   
               data.add(map2);
               
            }
         }
         
         
         
         
         

         return data;

      }
      
      public HashMap<String, Object> forExcelData(Integer scheduleNum) throws Exception{
         HashMap<String, Object> map = new HashMap<String, Object>();
         
         List<SchedulePartDTO> partList = this.partList(scheduleNum);
         map.put("partList",partList);
         
         for(int i=0;i<partList.size();i++){
            ScheduleUnitDTO scheduleUnitDTO = new ScheduleUnitDTO();
            scheduleUnitDTO.setScheduleNum(scheduleNum);
            scheduleUnitDTO.setEmail("");
            scheduleUnitDTO.setUnitState("");
            scheduleUnitDTO.setPartNum(partList.get(i).getPartNum());
            List<ScheduleUnitDTO> unitList = this.unitList(scheduleUnitDTO);
            partList.get(i).setUnitList(unitList);
         }
         
         //System.out.println("0번째 유닛꺼내기"+((List<SchedulePartDTO>)map.get("partList")).get(0).getUnitList().get(0).getUnitName());
         return map;
      }


      @Transactional
      public int uploadUnitResult(SheduleFreeTodoResultDTO freeTodoResultDTO,ScheduleResultFileDTO resultFileDTO, HttpSession session) throws Exception{
         FileService fileService = new FileService();
         int resultCount = resultFileDTO.getUnitResultFiles().length; //들어온 파일 갯수저장
         
         String [] resultOName = new String[resultCount];
         String [] resultFName = new String[resultCount];

         for(int i=0;i<resultCount;i++){
            System.out.println(i+1+"번째 파일 이름 = "+ (resultFileDTO.getUnitResultFiles()[i].getOriginalFilename()));
            String fileNameF = fileService.fileSave((resultFileDTO.getUnitResultFiles()[i]), session); //upload파일에 저장하기 
            System.out.println("생성된 이름 = " + fileNameF);
            resultOName[i] = resultFileDTO.getUnitResultFiles()[i].getOriginalFilename();
            resultFName[i] = fileNameF;
            
            //upload 폴더에 저장완료 후 dto 객체에 이름 설정
            resultFileDTO.setResultOName(resultOName[i]);
            resultFileDTO.setResultFName(resultFName[i]);
            //나머지 값은 이미 세팅되있음 
         }
         
         
         int result =scheduleDAO.uploadResult(freeTodoResultDTO);
         result = scheduleDAO.setResultFile(resultFileDTO);
         
         return result;
         
         
         
         
         
      }//함수 끝

      
      public int mainInsert(ScheduleMainDTO scheduleMainDTO) throws Exception{
         int result = scheduleDAO.updateMainSchedule(scheduleMainDTO);
         return result;
      }
   
      public ScheduleMainDTO getScheduleMainDTO(Integer scheduleNum) throws Exception{
         return scheduleDAO.getSchedule2(scheduleNum);
      }




}