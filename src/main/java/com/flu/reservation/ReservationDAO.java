package com.flu.reservation;

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

	public int delete(ReservationDTO reserve) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int count(ListInfo listInfo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}