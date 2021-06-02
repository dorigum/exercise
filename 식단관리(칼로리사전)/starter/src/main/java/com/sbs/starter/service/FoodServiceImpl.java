package com.sbs.starter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sbs.starter.dao.FoodDAO;
import com.sbs.starter.dto.FoodVO;
import com.sbs.starter.dto.PagingVO;

@Service
public class FoodServiceImpl implements FoodService {
		//데이터 관련해서는 모두 DAO에 위임
	 	@Autowired
	 	FoodDAO foodDAO;
	 
	 	//전체 내용 조회
		@Override 
		public List<FoodVO> getList() {
		  return foodDAO.getList(); 
		}
		 

	 	//상세 조회
	 	@Override
	 	public FoodVO getDetail(String fCode) {
	 	  return foodDAO.getDetail(fCode);
	 	}

	 	
	 	//식품 총 갯수
	 	@Override
	 	public int countFood() {
	 		return foodDAO.countFood();
	 	}
	 	
	 	//페이징 처리 식품 조회
	 	@Override
	 	public List<FoodVO> selectFood(PagingVO vo) {
	 		return foodDAO.selectFood(vo);
	 	}

	 	// 검색
	 	 @Override
	     public List<FoodVO> listAll(String search_option, String keyword,int start, int end) throws Exception {
	  
	         return foodDAO.listAll(search_option, keyword, start, end);
	     }

	
}
