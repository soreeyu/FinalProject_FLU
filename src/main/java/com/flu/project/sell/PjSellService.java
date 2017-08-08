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
		
		
		//pjsell에 등록이 되어있는지 체크
		public int checkSellProject(PjSellDTO pjSellDTO){
			return pjSellDAO.checkSellProject(pjSellDTO);
		}
		

		public int pjsellUpdate(PjSellDTO pjSellDTO){
			return 0;
		}
		
		//pjsell에서 삭제하기
		public int deleteSellProject(int num){
			return pjSellDAO.deleteSellProject(num);
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
