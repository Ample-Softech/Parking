
package basic.ControlerPack;

import java.io.*;
import java.util.*;
import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.PropertyConfigurator;
import org.junit.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;
import basic.Pojo.*;
import services.Services;

@Controller
@SessionAttributes({"Users","Parking"})
@PropertySource(value = { "classpath:Parking.properties" })
public class ControllerClass {

	private static final Logger logger = LoggerFactory.getLogger(ControllerClass.class);

	@Autowired
	@Qualifier("service")
	Services service;

	@Autowired
	@Qualifier("modelAndView")
	ModelAndView modelAndView;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpServletResponse response;
	
	@Autowired
	private Environment environment;
	
	//sagar...
	@ResponseBody
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public ModelAndView homePage() {

		modelAndView.setViewName("index");
		return modelAndView;
	}

	@RequestMapping(value = "/SignOut", method = RequestMethod.GET)
    public String loadApp() {
        HttpSession session= request.getSession(false);
        SecurityContextHolder.clearContext();
        if(session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }
	
//	@RequestMapping(value="/SignOut", method=RequestMethod.GET)
//	public String logout(HttpSession session) {		
//		session.invalidate();
//		return "redirect:/";
//	}
	@ResponseBody
	@RequestMapping(value="/checkpin", method=RequestMethod.GET)
	public ModelAndView pincode(@RequestParam Map<String,String> requestParams) {
		modelAndView=new ModelAndView("find");
//		System.out.println("loc= "+requestParams.get("loc")+", lat= "+requestParams.get("lat")+", lng= "+requestParams.get("lng"));
		modelAndView.addObject("latitude", requestParams.get("lat"));
		modelAndView.addObject("longitude", requestParams.get("lng"));		
		modelAndView.addObject("loc", requestParams.get("loc"));
		return modelAndView;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/logValid", method=RequestMethod.POST)
	public ModelAndView logValid(Model model, @RequestParam Map<String,String> requestParams) {
		Users u1 = service.getUser(requestParams.get("username"), requestParams.get("password"));
		if (u1!=null) {		
			System.out.println("id= " + u1.getId());
			model.addAttribute("Users", u1);
			return new ModelAndView("PReg");			
		} else {
			return new ModelAndView("Login");			
		}
	}	
	
	@ResponseBody
	@RequestMapping(value="/psReg", method=RequestMethod.GET)
	public ModelAndView psReg(Model model, @ModelAttribute("Users") Users u1, @RequestParam Map<String,String> requestParams) {
		System.out.println("id= "+u1.getId());
		Parking p1 = new Parking();
		Parking p2 = null;
		p1.setArea(requestParams.get("area"));
		p1.setCity(requestParams.get("city"));
		p1.setState("Maharashtra");
		p1.setCountry("India");
		p1.setPincode(requestParams.get("pincode"));
		p1.setLatitude(requestParams.get("latitude"));
		p1.setLongitude(requestParams.get("longitude"));
		p1.setUserId(u1.getId());
		
		p2 = service.inserPark(p1);
		if (p2!=null) {
			model.addAttribute("Parking", p2);
			return new ModelAndView("IUpload");			
		} else {
			return new ModelAndView("PReg");			
		}
				
	}	
	
	@ResponseBody
	@RequestMapping(value="/reg", method=RequestMethod.GET)
	public ModelAndView regcod(@RequestParam Map<String,String> requestParams) {
		Users u1 = new Users(0, requestParams.get("fname"),
				requestParams.get("mname"), requestParams.get("lname"), 
				requestParams.get("gender"), requestParams.get("username"),
				requestParams.get("password"), requestParams.get("dob"),
				requestParams.get("latitude"), requestParams.get("longitude"),
				requestParams.get("area"), requestParams.get("state"),
				requestParams.get("city"), requestParams.get("country"), 
				requestParams.get("pincode"), "user");
		if ((!(u1.getLatitude().equals("")) && u1.getLatitude()!=null) || (!(u1.getLongitude().equals("")) && u1.getLongitude()!=null)) {
			System.out.println(u1);
			if (service.insertUser(u1)==1) {
				return new ModelAndView("Login");				
			}
		} 
		return new ModelAndView("UReg"); 		
	}	
	
	@ResponseBody
	@RequestMapping(value="/imageUp", method=RequestMethod.GET)
	public ModelAndView imageUp(@ModelAttribute("Parking") Parking p1, @RequestParam("file") MultipartFile file) {
		if (!file.isEmpty()) {
			String content = file.getContentType();
			try {
				System.out.println(p1.getId());
				if (content.equals("image/jpeg") || content.equals("image/gif") || content.equals("image/png")) {
					byte[] bytes = file.getBytes();
					// Create the file on server
					File serverFile = new File(environment.getRequiredProperty("imagePath") + File.separator + file.getOriginalFilename());
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					stream.write(bytes);
					stream.close();
					logger.info("Server File Location=" + serverFile.getAbsolutePath());
					String path = "images/parkinks/"+ file.getOriginalFilename();
					System.out.println("(for db) images/parkinks/"+ file.getOriginalFilename());
					if (service.insertImage(p1.getId(), path)==1) {
						modelAndView=new ModelAndView("RegDone");
						System.out.println("You successfully uploaded file");
					} else {
						modelAndView=new ModelAndView("IUpload");
						System.out.println("You failed to upload(in SQL insertion)  => " + path +"for park id= "+p1.getId());
					}
				} else {
					modelAndView=new ModelAndView("IUpload");
					System.out.println("You failed to upload(content mismatch)  => " + content);
				}
			} catch (Exception e) {
				modelAndView=new ModelAndView("IUpload");
				System.out.println("You failed to upload  => " + e.getMessage());
			}
		} else {
			modelAndView=new ModelAndView("IUpload");
			System.out.println("You failed to upload because the file was empty.");
		}
		return modelAndView;
	}	
	
	@ResponseBody
	@RequestMapping(value="/Check", method=RequestMethod.GET)
	public ModelAndView print(@RequestParam Map<String,String> requestParams) {
		modelAndView=new ModelAndView("find");
//		System.out.println("loc= "+requestParams.get("loc")+", lat= "+requestParams.get("lat")+", lng= "+requestParams.get("lng"));
		modelAndView.addObject("latitude", requestParams.get("lat"));
		modelAndView.addObject("longitude", requestParams.get("lng"));		
		modelAndView.addObject("loc", requestParams.get("loc"));
		List<Parking> l1 = service.getParkings();		
		for (Parking parking : l1) {
//			System.out.println(parking.getArea());			
			modelAndView.addObject("parking", parking);			
		}
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public ModelAndView search(@ModelAttribute("demo")Demo demo){
		System.out.println(demo.getLat()+" "+demo.getLng());
		String json = new Gson().toJson(demo);
		modelAndView.addObject("result",json);
		modelAndView.setViewName("result");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value="/LoginPage", method=RequestMethod.GET)
	public ModelAndView login()
	{
		ModelAndView m= new ModelAndView("Login");
		return  m;
	}
	
	@ResponseBody
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public ModelAndView register(){		
		return new ModelAndView("UReg");
	}
	
	@ResponseBody
	@RequestMapping(value="/regDone", method=RequestMethod.GET)
	public ModelAndView regDone(){
		return new ModelAndView("RegDone");
	}		

	@Test
	@PostConstruct
	public void init() throws Exception {
		PropertyConfigurator.configure(environment.getRequiredProperty("log4j.properties.file"));
		
		System.out.println("\n**   Spring F/M Initialization(Started) invoking by init method..   **\n");
	
		logger.trace("TRACE");
		logger.debug("DEBUG");
		logger.info("INFO");
		logger.warn("WARN");
		logger.error("ERROR");		
	}

	@Test
	@PreDestroy
	public void destroy() throws Exception {
		System.out.println("\n**   Spring F/M Destroying(Closed) invoking by destroy method..   **\n");
	}

}
