
package basic.ControlerPack;

import java.io.*;
import java.util.*;
import java.util.stream.Collectors;

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
import org.springframework.web.bind.annotation.PathVariable;
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
		p1.setPincode(Integer.parseInt(requestParams.get("pincode")));
		p1.setLatitude(Float.parseFloat(requestParams.get("latitude")));
		p1.setLongitude(Float.parseFloat(requestParams.get("longitude")));
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
	@RequestMapping("/reg")
	public ModelAndView regcod(@ModelAttribute("user") Users u) {
		System.out.println("User= "+u);	
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
	@RequestMapping(value="/SpaceOwners", method=RequestMethod.GET)
	public ModelAndView spaceOwners(@RequestParam Map<String,String> requestParams) {
		return new ModelAndView("SpaceOwners", "users", service.spaceOwners());
	}

	@ResponseBody
	@RequestMapping("/ShowParkings/{id}")
	public ModelAndView showParkings(@PathVariable("id") int id) {
		modelAndView=new ModelAndView("find");
		List<Parking> l1 = service.showParkings(id);
		modelAndView.addObject("parking", l1);
		modelAndView.addObject("json", new Gson().toJson(l1));
		if(l1.size()>0) { 
			int s = l1.size()-1;
			modelAndView.addObject("latitude", l1.get(s).getLatitude());
			modelAndView.addObject("longitude", l1.get(s).getLongitude());
			modelAndView.addObject("loc", l1.get(s).getArea());
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
		float lat = Float.parseFloat(requestParams.get("lat"));
		float lng = Float.parseFloat(requestParams.get("lng"));
//		List<Parking> l1 = service.getParkings();

		List<Parking> l1 = service.getParkings().stream().filter(p->p.getLatitude()>(lat-0.01) && p.getLatitude()<(lat+0.1)).collect(Collectors.toList());
		modelAndView.addObject("parking", l1);
		modelAndView.addObject("json", new Gson().toJson(l1));

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
