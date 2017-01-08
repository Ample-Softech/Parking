package basic.ControlerPack;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import basic.Pojo.Demo;

@Controller
public class ControllerClass {
	
	@Autowired
	ModelAndView modelAndView;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/Check")
	public ModelAndView print(@ModelAttribute("Demo") Demo Demo, @RequestParam("searchPlace") String loc, @RequestParam("lat") String lat) {
		System.out.println("get");
		System.out.println(loc);
		System.out.println(Demo.getLat());
		System.out.println(Demo.getLng());
		System.out.println(lat);
		ModelAndView model=new ModelAndView("search");
		model.addObject("Demo", Demo);
		model.addObject("location", loc);
		return model;
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
		ModelAndView m= new ModelAndView("Register");
		return  m;
	}
	
}
