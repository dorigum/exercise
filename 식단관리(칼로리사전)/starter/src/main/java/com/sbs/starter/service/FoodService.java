package com.sbs.starter.service;

import java.util.List;
import java.util.Map;

import com.sbs.starter.dto.FoodVO;
import com.sbs.starter.dto.PagingVO;

public interface FoodService {
	//전체 내용 조회
	public List<FoodVO> getList();
	
	// 상세 조회
	public FoodVO getDetail(String fCode);
	
	// 식품 총 갯수
	public int countFood();

	// 페이징 처리 식품 조회
	public List<FoodVO> selectFood(PagingVO vo);

	//검색
	//목록 (페이지 나누기, 검색 기능을 포함)
    //매개변수는 시작 레코드 번호, 끝번호, 옵션과 키워드가 들어간다.
    public List<FoodVO> listAll(String search_option, String keyword, int start, int end)throws Exception;
    

	
}
