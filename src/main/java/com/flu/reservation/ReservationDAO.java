package com.flu.reservation;

import com.flu.eachRoom.EachRoomDTO;
import com.flu.meetRoom.MeetRoomDTO;
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

	
	public List<ReservationDTO> list(ListInfo listInfo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	public int insert(ReservationDTO reserve) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"ReservePay", reserve);
	}

	public int update(ReservationDTO reserve) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public ReservationDTO view(ReservationDTO reserve) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public int delete(ReservationDTO reserve) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int count(ListInfo listInfo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
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
	public ReservationDTO reservedTime(ReservationDTO reservationDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"Reserved_time", reservationDTO);
	}
}
