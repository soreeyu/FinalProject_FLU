package com.flu.project.sell;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.flu.util.ListInfo;

@Service
public class PjSellService {

	@Inject
	private PjSellDAO pjSellDAO;
	
	

		public int pjsellInsert(PjSellDTO pjSellDTO){
			return pjSellDAO.pjsellInsert(pjSellDTO);
		}
		

		public int pjsellUpdate(PjSellDTO pjSellDTO){
			return 0;
		}

		public int pjsellDelete(int num){
			return 0;
		}
		

		public PjSellDTO pjsellView(int num){
			return null;
		}
		

		public List<PjSellDTO> pjsellList(){
			return null;
		}
		

		public int pjsellCount(ListInfo listInfo){
			return 0;
		}
}
