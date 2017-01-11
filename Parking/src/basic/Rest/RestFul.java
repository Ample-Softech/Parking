package basic.Rest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import basic.Pojo.Demo;


@RestController
public class RestFul {

	@RequestMapping(value="/search",method=RequestMethod.POST)
	public ResponseEntity<Demo> search(@ModelAttribute("demo")Demo demo){
		System.out.println(demo.getLat()+" "+demo.getLng());
		return new ResponseEntity<Demo>(demo,HttpStatus.OK);
		
	}
}
