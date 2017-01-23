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
	
	@RequestMapping(value="/regCode")
	public ModelAndView regcod(@RequestParam Map<String,String> requestParams) {
		System.out.println("reg");
		System.out.println(requestParams.get("middle_name"));
		System.out.println(requestParams.get("file"));
		System.out.println("regi "+ request.getParameter("middle_name"));
		return new ModelAndView("Registration");
	}	
	
	
	@RequestMapping("/imageUp")
	public ModelAndView imageUp() {
		modelAndView=new ModelAndView("image");
		return modelAndView;
	}	
	
	
	@RequestMapping("/Check")
	public ModelAndView print(@RequestParam Map<String,String> requestParams) {
		modelAndView=new ModelAndView("find");
//		System.out.println("loc= "+requestParams.get("loc")+", lat= "+requestParams.get("lat")+", lng= "+requestParams.get("lng"));
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
		
		ModelAndView m= new ModelAndView("Registration");
		return  m;
	}
	
}
