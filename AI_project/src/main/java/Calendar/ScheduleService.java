package Calendar;

import java.awt.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service 
public class ScheduleService {
	@Inject 
	private ScheduleDAO dao; 
	public List showSchedule() throws Exception { 
		return dao.showSchedule();
		} 
	public void addSchedule(ScheduleDTO dto) throws Exception{
		dao.addSchedule(dto);
		} 
	
}