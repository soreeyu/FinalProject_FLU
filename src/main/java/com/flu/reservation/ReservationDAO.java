package com.flu.reservation;

import com.flu.eachRoom.EachRoomDTO;
import com.flu.meetRoom.MeetRoomDTO;
import com.flu.project.ProjectDTO;
import com.flu.util.ListInfo;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class ReservationDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "ReservationMapper.";

	

	public int insert(ReservationDTO reserve) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"ReservePay", reserve);
	}

	//예약 취소하기 삭제
	public int delete(Integer num) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"ReserveDelete", num);
	}
	
	//방정보 불러오기
	public EachRoomDTO eachView(int num) throws Exception{
		return sqlSession.selectOne("EachRoomMapper.EachView", num);
	}
	//예약 가능 시간 불러오기
	public MeetRoomDTO accessTime(int snum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"Reserve_accessTime", snum);
	}
	//예약되어있는 시간 불러오기
	public List<ReservationDTO> reservedTime(ReservationDTO reservationDTO) throws Exception{
		System.out.println("방 이름"+reservationDTO.getName());
		return sqlSession.selectList(NAMESPACE+"Reserved_time", reservationDTO);
	}
	//날짜와 방 이름가지고 시간 가져오기
	public List<ReservationDTO> reservedTime2(ReservationDTO reservationDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"Reserved_time2", reservationDTO);
	}
	//예약취소신청
	public int reservationDel(Integer num) throws Exception{
		return sqlSession.update(NAMESPACE+"ReserveDel", num);
	}
	//클라이언트(할인) 모집완료된 프로젝트 카운트 ( 사전미팅 하기위한 미팅룸 예약시에 카운트가 있으면 할인 가능 )
	public int reserveDiscount_REC(String email) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"ReserveDiscount_REC", email);
	}
	//프리랜서(할인)
	public int reserveDiscount_ING(String email) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"ReserveDiscount_ING", email);
	}
}
