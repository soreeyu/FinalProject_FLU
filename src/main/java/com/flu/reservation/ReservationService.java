package com.flu.reservation;

import com.flu.util.ListInfo;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
		return 0;
	}


	public int update(ReservationDTO reserve) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	public ReservationDTO view(ReservationDTO reserve) throws Exception {
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
}
