package Calendar;

import java.awt.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduleDAO { 
	@Inject 
	private SqlSession sqlSession; 
	
	private static final String namespace = "com.management.dao.ScheduleDAO"; 
	public List showSchedule() throws Exception { 
		return (List) sqlSession.selectList(namespace + ".showSchedule");
		} 
	public void addSchedule(ScheduleDTO dto) throws Exception {
		sqlSession.insert(namespace + ".addSchedule", dto);
		} 
	}