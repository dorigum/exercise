package Calendar;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class APIController {
	@RequestMapping("/")
	public String index() {
		return "index";
		
	}
	
	@RequestMapping("/calendar")
	public String calendar() {
		return "calendar";
	}
	
	@RequestMapping("/test")
	public String test() {
		return "test";
	}
	@RequestMapping("/test2")
	public String test2() {
		return "test2";
	}
	@RequestMapping("/calendarPopup")
	public String calendarPopup() {
		return "calendarPopup";
	}
	
	
	

}
