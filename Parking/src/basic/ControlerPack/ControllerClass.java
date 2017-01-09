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
	public ModelAndView print() {
		modelAndView=new ModelAndView("select");
		modelAndView.addObject("latitude", request.getParameter("latitude"));
		modelAndView.addObject("longitude", request.getParameter("longitude"));		
		modelAndView.addObject("location", request.getParameter("loc"));
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
		ModelAndView m= new ModelAndView("Register");
		return  m;
	}
	
}
