
package basic.ControlerPack;

import java.io.*;
import java.util.*;
import java.util.stream.Collectors;
import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.http.Cookie;
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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;
import basic.Pojo.*;
import services.Services;

@Controller
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
	HttpSession sess;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpServletResponse response;
	
	@Autowired
	private Environment environment;
	
	//Sagar..!
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
	public ModelAndView logValid(@ModelAttribute Users u, BindingResult br) {
		if(br.hasErrors()){
			System.out.println("errors= " + br.getErrorCount());
			System.out.println(br.getAllErrors());
			return new ModelAndView("Login");			
		}		
		Users u1 = service.validateUser(u.getUsername(), u.getPassword());
		if (u1!=null) {
			System.out.println("id= " + u1);
			sess.setAttribute("userLog", "login");
			sess.setAttribute("user", u1);
			return new ModelAndView("PReg");			
		} else {
			return new ModelAndView("Login");			
		}
	}	
	
	@ResponseBody
	@RequestMapping(value="/parkSpace", method=RequestMethod.POST)
	public ModelAndView psReg(@ModelAttribute Parking p, BindingResult br) {
		if(br.hasErrors()){
			System.out.println("errors= " + br.getErrorCount());
			System.out.println(br.getAllErrors());
			return new ModelAndView("PReg");
		}
		System.out.println("parking reg= " + p);
		int id = (int) service.saveParking(p);
		System.out.println("parking space id= " + id);
		if (id!=0) {
			sess.setAttribute("prImgId", id);
			return new ModelAndView("IUpload");						
		} else {
			return new ModelAndView("PReg");
		}
	}

	@ResponseBody
	@RequestMapping(value="/UserReg", method=RequestMethod.POST)
	public ModelAndView regcod(@ModelAttribute("user") Users u) {
		System.out.println("User= "+u);
		if (service.saveUser(u)) {
			return new ModelAndView("Login");
		} else {
			return new ModelAndView("UReg");
		}
	}	
	
	@ResponseBody
	@RequestMapping(value="/imageUp", method=RequestMethod.POST)
	public ModelAndView imageUp(@RequestParam("file") MultipartFile file) {
		if (!file.isEmpty()) {
			String content = file.getContentType();
			try {
				int id = (int) sess.getAttribute("prImgId");
				System.out.println(id+" "+content);
				if (content.equals("image/jpeg") || content.equals("image/png")) {
					byte[] bytes = file.getBytes();
					// Create the file on server
					File serverFile = new File(environment.getRequiredProperty("imagePath") + File.separator + "psImg_" + id + ".jpeg");
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					stream.write(bytes);
					stream.close();
					logger.info("Server File Location=" + serverFile.getAbsolutePath());
					String path = "images/parkinks/psImg_" + id + ".jpeg";
					System.out.println("(for db) images/parkinks/psImg_" + id + ".jpeg");
					if (service.uploadImg(id, path)) {
						modelAndView=new ModelAndView("RegDone");
						System.out.println("You successfully uploaded file");
					} else {
						modelAndView=new ModelAndView("IUpload");
						System.out.println("You failed to upload(in SQL insertion)  => " + path +"for park id= "+id);
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
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public ModelAndView search(@ModelAttribute("demo") Demo demo){
		System.out.println(demo.getLat()+" "+demo.getLng());
		String json = new Gson().toJson(demo);
		modelAndView.addObject("result",json);
		modelAndView.setViewName("result");
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
	@RequestMapping(value="/LoginPage", method=RequestMethod.GET)
	public ModelAndView login() {
		return new ModelAndView("Login");
	}
	
	@ResponseBody
	@RequestMapping(value="/regDone", method=RequestMethod.GET)
	public ModelAndView regDone(){
		return new ModelAndView("RegDone");
	}		

	@ResponseBody
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public ModelAndView homePage() {
		modelAndView.setViewName("index");
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping(value="/PReg", method=RequestMethod.GET)
	public ModelAndView link() {
		modelAndView.setViewName("PReg");
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public ModelAndView register(){		
		return new ModelAndView("UReg");
	}

	@ResponseBody
	@RequestMapping(value="/SpaceOwners", method=RequestMethod.GET)
	public ModelAndView spaceOwners() {
		return new ModelAndView("SpaceOwners", "users", service.spaceOwners());
	}

	@RequestMapping(value = "/SignOut", method = RequestMethod.GET)
    public String loadApp() {
		try {
			sess.setAttribute("userLog", "logout");
	        SecurityContextHolder.clearContext();
	        if(sess != null) {
	            sess.invalidate();
	        }
			Cookie c = new Cookie("name", "");
			c.setMaxAge(0);

			System.gc();
			System.out.println("logout");					
		} catch (NullPointerException e) { 
			Cookie c = new Cookie("name", "");
			c.setMaxAge(0);
			System.gc();
			System.out.println("logout");		
		} catch (Exception e) {
			Cookie c = new Cookie("name", "");
			c.setMaxAge(0);
			System.gc();
			System.out.println("logout");		
		}
        return "redirect:/";
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
