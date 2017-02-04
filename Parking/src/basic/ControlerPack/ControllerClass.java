package basic.ControlerPack;

import java.io.File;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;
import basic.Pojo.Demo;
import basic.Pojo.Parking;
import basic.Pojo.Users;
import services.Services;

@Controller
public class ControllerClass {

	@Autowired
	Services service = new Services();

	@Autowired
	ModelAndView modelAndView;
	
	@Autowired
	HttpServletRequest request;	
	
	//sagar...

	@RequestMapping("/checkpin")
	public ModelAndView pincode(@RequestParam Map<String,String> requestParams) {
		modelAndView=new ModelAndView("find");
		System.out.println("loc= "+requestParams.get("loc")+", lat= "+requestParams.get("lat")+", lng= "+requestParams.get("lng"));
		modelAndView.addObject("latitude", requestParams.get("lat"));
		modelAndView.addObject("longitude", requestParams.get("lng"));		
		modelAndView.addObject("loc", requestParams.get("loc"));
		modelAndView.addObject("id", "activate-step-3");
		return modelAndView;
	}

	
	
	@RequestMapping(value="/reg")
	public ModelAndView regcod(@RequestParam Map<String,String> requestParams) {
		System.out.println("reg");
		Users u1 = new Users();
		u1.setFname(requestParams.get("first"));;
		u1.setMname(requestParams.get("middle_name"));
		u1.setLname(requestParams.get("last_name"));
		u1.setGender(requestParams.get("gender"));
		u1.setUsername(requestParams.get("dob"));
		u1.setPassword(requestParams.get("email"));
		u1.setDob(requestParams.get("password"));
		u1.setLatitude(requestParams.get("lat"));
		u1.setLongitude(requestParams.get("lng"));
		u1.setArea(requestParams.get("area"));
		u1.setCity(requestParams.get("city"));
		u1.setState(requestParams.get("state"));
		u1.setUsertype("user");		
		System.out.println(u1);
		return new ModelAndView("PReg");
	}	

	@RequestMapping(value="/psReg")
	public ModelAndView psReg(@RequestParam Map<String,String> requestParams) {
		System.out.println("reg");
		System.out.println(requestParams.get("middle_name"));
//		System.out.println(requestParams.get("file"));
		System.out.println("regi "+ request.getParameter("middle_name"));
		modelAndView.addObject("id", "activate-step-2");
		return new ModelAndView("IUpload");
	}	

	
	@RequestMapping("/imageUp")
	public ModelAndView imageUp() {
		modelAndView=new ModelAndView("RegDone");
		return modelAndView;
	}	
	
	
	@RequestMapping("/Check")
	public ModelAndView print(@RequestParam Map<String,String> requestParams) {
		modelAndView=new ModelAndView("find");
		System.out.println("loc= "+requestParams.get("loc")+", lat= "+requestParams.get("lat")+", lng= "+requestParams.get("lng"));
		modelAndView.addObject("latitude", requestParams.get("lat"));
		modelAndView.addObject("longitude", requestParams.get("lng"));		
		modelAndView.addObject("loc", requestParams.get("loc"));
		List<Parking> l1 = service.getParkings();		
		for (Parking parking : l1) {
			System.out.println(parking.getArea());			
			modelAndView.addObject("parking", parking);			
		}
		return modelAndView;
	}
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public ModelAndView homePage() {
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
	@RequestMapping(value="/search",method=RequestMethod.POST)
	public ModelAndView search(@ModelAttribute("demo")Demo demo){
		System.out.println(demo.getLat()+" "+demo.getLng());
		String json = new Gson().toJson(demo);
		modelAndView.addObject("result",json);
		modelAndView.setViewName("result");
		return modelAndView;
	}
	
	@RequestMapping(value="/LoginPage")
	public ModelAndView login()
	{
		ModelAndView m= new ModelAndView("Login");
		return  m;
	}
	
	@RequestMapping(value="/register")
	public ModelAndView register()
	{
		
		ModelAndView m= new ModelAndView("UReg");
		return  m;
	}
	
}
