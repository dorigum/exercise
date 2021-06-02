package com.sbs.starter.dao;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


import com.sbs.starter.dto.FoodVO;
import com.sbs.starter.dto.PagingVO;


@Mapper // 이렇게 해주면 FoodDAO의 구현체를 마이바티스가 대신 구현해준다
public interface FoodDAO {
	
	// 전제 내용 조회
	public List<FoodVO> getList();
	
	// 상세 조회
	public FoodVO getDetail(String fCode);
	
	// 식품 총 갯수
	public int countFood();

	// 페이징 처리 식품 조회
	public List<FoodVO> selectFood(PagingVO vo);

	//검색
	//식품 리스트를 출력하는 메소드 (검색옵션, 키워드, 시작번호와 끝번호 포함)
    public List<FoodVO> listAll(String search_option, String keyword,int start, int end) throws Exception;  
    
}

