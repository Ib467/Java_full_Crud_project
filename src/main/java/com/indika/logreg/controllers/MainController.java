 package com.indika.logreg.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.indika.logreg.models.User;
import com.indika.logreg.services.UserService;
import com.indika.logreg.validators.UserValidator;

@Controller
public class MainController {
	@Autowired
	private UserService userServ;
		
	@Autowired
	private UserValidator userValid;

	
	@RequestMapping("/")
    public String index(@ModelAttribute("user") User user) {
        return "user/index.jsp";
    }
	

    //registration and creating a user 
    
    @RequestMapping(value="/registration", method=RequestMethod.POST)
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
    	userValid.validate(user, result);  //validation user 
    	if(result.hasErrors()) {
    		return "user/index.jsp";
    	}
        // save the user in the database
    	else {
    		User newUser = userServ.registerUser(user);
    		session.setAttribute("user_id", newUser.getId());
    		return "redirect:/dashboard";  //route to user new after registering
    	}
    }
    
    
    //-------------login in user -------------------------
    //@RequestMapping(value="/login", method=RequestMethod.POST)
    @PostMapping("/login")
    public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session, RedirectAttributes redirs) {
        // if the user is authenticated, save their user id in session
    	if(userServ.authenticateUser(email, password)) {
    		User user = userServ.findByEmail(email);
    		session.setAttribute("user_id", user.getId());
    		return "redirect:/dashboard";
    	}
        // add error messages and kick back to index
    	//redirect attribute to flash the message
    	else {
    		redirs.addFlashAttribute("error", "Invalid Email and password");
    		return "redirect:/";
    	}
    }
      
    
    
    
    @RequestMapping("/home")
    public String home(HttpSession session, Model model) {
        // get user from session, save them in the model and return the home page
    	Long id = (Long) session.getAttribute("user_id");
    	User user = userServ.findUserById(id);
    	model.addAttribute("user", user);
    	return "homepage.jsp";
    }
    
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        // invalidate session
        // redirect to login page
    	session.invalidate();
    	return "redirect:/";
    }
	
    
}
