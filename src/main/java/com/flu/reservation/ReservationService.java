package com.flu.reservation;

import com.flu.util.ListInfo;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.flu.eachRoom.EachRoomDTO;
import com.flu.meetRoom.MeetRoomDTO;
import com.flu.room.RoomDTO;

@Service
public class ReservationService {

	@Inject
	private ReservationDAO reservationDAO;
	

	public List<ReservationDTO> list(ListInfo listInfo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	public int insert(ReservationDTO reserve) throws Exception {
		// TODO Auto-generated method stub
		return reservationDAO.insert(reserve);
	}


	public int update(ReservationDTO reserve) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	public ReservationDTO view(int num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	public int delete(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int count(ListInfo listInfo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	//방정보 불러오기
	public EachRoomDTO eachView (int num) throws Exception{
		return reservationDAO.eachView(num);
	}
	//예약 가능 시간 불러오기
	public MeetRoomDTO accessTime(int snum) throws Exception{
		return reservationDAO.accessTime(snum);
	}
	//예약 되어있는 시간 불러오기
	public List<ReservationDTO> reservedTime(ReservationDTO reservationDTO) throws Exception{
		return reservationDAO.reservedTime(reservationDTO);
	}
	//날짜랑 방 정보로 시간 가져오기
	public List<ReservationDTO> reservedTime2(ReservationDTO reservationDTO) throws Exception{
		return reservationDAO.reservedTime2(reservationDTO);
	}
	
}
