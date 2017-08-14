package com.flu.applicant;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.flu.project.ProjectDTO;

@Service
public class ApplicantService {
   
   @Inject
   private ApplicantDAO applicantDAO;
   
   //applicant List
   public List<ApplicantDTO> list(int projectNum){
      return applicantDAO.list(projectNum);
   }
   
   //applicant + member
   public List<ApplicantMemberDTO> applicantList(int projectNum){
      return applicantDAO.applicantList(projectNum);
   }
   
   //chat List
   public List<ApplicantDTO> chatList(int projectNum){
      return applicantDAO.chatList(projectNum);
   }
   

   // state update
   public int appUpdate(String email){
      return applicantDAO.appUpdate(email);
   }
   

   public Integer checkApp(ApplicantDTO applicantDTO){
      return applicantDAO.checkApp(applicantDTO);
   }
   

   
   //지원하기 누르면 지원자 추가
   public int insertApplicant(ApplicantDTO applicantDTO){
      System.out.println("applicant-service");
      return applicantDAO.insertApplicant(applicantDTO);
   }
   
   //지원했는지 체크해보기
   public int checkApplicant(ApplicantDTO applicantDTO){
      System.out.println("checkApplicant-service");
      return applicantDAO.checkApplicant(applicantDTO);
   }
   
   //지원자 수 카운트하기
   public int countApplicant(int projectNum){         
      return applicantDAO.countApplicant(projectNum);
   }
   
   public int deleteApplicant(ApplicantDTO applicantDTO){
      System.out.println("applicant-service-delete");
      return applicantDAO.deleteApplicant(applicantDTO);
   }


   //프로젝트 완료를 프리랜서가 눌렀을 때, applicant의 state-ing인 상태의 finishCheck를 0->1로 업데이트
   public int updateFinish(ApplicantDTO applicantDTO){
      System.out.println("updateFinish-service");
      return applicantDAO.updateFinish(applicantDTO);         
   }
   
   //프로젝트 view 진입시, 프로젝트 완료를 한 applicant인지 확인
   public ApplicantDTO checkFinish(ApplicantDTO applicantDTO){
      System.out.println("checkFinish-service");
      return applicantDAO.checkFinish(applicantDTO);
   }
   
   //해당프로젝트를 진행하는 applicant의 수
   public int countFinish(ApplicantDTO applicantDTO){
      return applicantDAO.countFinish(applicantDTO);
   }
   
   //해당프로젝트를 진행하면서 finishCheck를 한 applicant의 수
   public int countCheck(ApplicantDTO applicantDTO){
      return applicantDAO.countCheck(applicantDTO);
   }
   
   //클라이언트가 완료눌렀을 때, applicant상태를 finish로 바꿔주기
   public int updateState(ProjectDTO projectDTO){
      return applicantDAO.updateState(projectDTO);
   }

}