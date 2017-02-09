package basic.ControlerPack;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;
import basic.Pojo.Demo;
import basic.Pojo.Parking;
import basic.Pojo.Users;
import services.Services;

@Controller
@SessionAttributes({"Users","Parking"})
public class ControllerClass {

	private static final Logger logger = LoggerFactory.getLogger(ControllerClass.class);

	@Autowired
	Services service = new Services();

	@Autowired
	ModelAndView modelAndView;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpServletResponse response;
	
	//sagar...

	@RequestMapping("/checkpin")
	public ModelAndView pincode(@RequestParam Map<String,String> requestParams) {
		modelAndView=new ModelAndView("find");
//		System.out.println("loc= "+requestParams.get("loc")+", lat= "+requestParams.get("lat")+", lng= "+requestParams.get("lng"));
		modelAndView.addObject("latitude", requestParams.get("lat"));
		modelAndView.addObject("longitude", requestParams.get("lng"));		
		modelAndView.addObject("loc", requestParams.get("loc"));
		return modelAndView;
	}

	
	@RequestMapping(value="/logValid")
	public ModelAndView logValid(Model model, @RequestParam Map<String,String> requestParams) {
		Users u1 = service.getUser(requestParams.get("username"), requestParams.get("password"));
		if (u1!=null) {
			System.out.println("id= "+u1.getId());
			model.addAttribute("Users", u1);
			return new ModelAndView("PReg");			
		} else {
			return new ModelAndView("Login");			
		}
	}	
	
	@RequestMapping(value="/psReg")
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

	@RequestMapping(value="/reg")
	public ModelAndView regcod(@RequestParam Map<String,String> requestParams) {
		Users u1 = new Users();
		u1.setFname(requestParams.get("fname"));
		u1.setMname(requestParams.get("mname"));
		u1.setLname(requestParams.get("lname"));
		u1.setGender(requestParams.get("gender"));
		u1.setUsername(requestParams.get("username"));
		u1.setPassword(requestParams.get("password"));
		u1.setDob(requestParams.get("dob"));
		u1.setLatitude(requestParams.get("latitude"));
		u1.setLongitude(requestParams.get("longitude"));
		u1.setArea(requestParams.get("area"));
		u1.setCity(requestParams.get("city"));
		u1.setState(requestParams.get("state"));
		u1.setCountry(requestParams.get("country"));
		u1.setPincode(requestParams.get("pincode"));
		u1.setUsertype("user");
		if ((!(u1.getLatitude().equals("")) && u1.getLatitude()!=null) || (!(u1.getLongitude().equals("")) && u1.getLongitude()!=null)) {
			System.out.println(u1);
			if (service.insertUser(u1)==1) {
				return new ModelAndView("Login");				
			}
		} 
		return new ModelAndView("UReg"); 		
	}	
	
	
	@RequestMapping("/imageUp")
	public ModelAndView imageUp(@ModelAttribute("Parking") Parking p1, @RequestParam("file") MultipartFile file) {
		if (!file.isEmpty()) {
			String content = file.getContentType();
			try {
				System.out.println(p1.getId());
				if (content.equals("image/jpeg") || content.equals("image/gif") || content.equals("image/png")) {
					byte[] bytes = file.getBytes();
					// Create the file on server
					File serverFile = new File("C:\\Users\\Sagar Pawar\\git\\Parking\\Parking\\WebContent\\images\\parkinks" + File.separator + file.getOriginalFilename());
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
	
	
	@RequestMapping("/Check")
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
		return new ModelAndView("UReg");
	}
	
	@RequestMapping(value="/regDone")
	public ModelAndView regDone()
	{		
		return new ModelAndView("RegDone");
	}

		
}
