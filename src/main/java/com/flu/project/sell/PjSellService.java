package com.flu.project.sell;

import java.util.List;

import com.flu.util.ListInfo;

public class PjSellService {

	private PjSellDAO pjSellDAO;
	
	
	
	//판매할 프로젝트 작성
		public int pjsellWrite(PjSellDTO pjSellDTO){
			return 0;
		}
		
		//판매할 프로젝트 수정
		public int pjsellUpdate(PjSellDTO pjSellDTO){
			return 0;
		}
		
		//판매할 프로젝트 삭제
		public int pjsellDelete(int num){
			return 0;
		}
		
		//판매할 프로젝트 한개보기
		public PjSellDTO pjsellView(int num){
			return null;
		}
		
		//판매할 프로젝트 리스트보기
		public List<PjSellDTO> pjsellList(){
			return null;
		}
		
		//
		public int pjsellCount(ListInfo listInfo){
			return 0;
		}
}
