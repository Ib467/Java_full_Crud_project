package com.indika.logreg.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.indika.logreg.models.Inventory;
import com.indika.logreg.models.User;
import com.indika.logreg.models.UsersCart;
import com.indika.logreg.services.CartService;
import com.indika.logreg.services.InventoryService;
import com.indika.logreg.services.UserService;

@Controller
public class DashboardController {

	@Autowired
	private UserService userServ;

	@Autowired
	private InventoryService InventServ;

	@Autowired
	private CartService CartServ;

	@GetMapping("/dashboard")
	public String index(@RequestParam(value = "q", required = false) String searchQuery,
			@ModelAttribute("inventory") Inventory inventory, HttpSession session, Model model) {
		Long id = (Long) session.getAttribute("user_id");
		if (id == null) {
			return "redirect:/";
		}

		List<Inventory> inventoryByName = InventServ.getByName(searchQuery);
		model.addAttribute("byName", inventoryByName);

		User _user = userServ.findUserById(id);
		List<Inventory> fullInventory = InventServ.getFullInventory();

		List<UsersCart> fullOrder = CartServ.findByUser(_user);

		model.addAttribute("fullOrder", fullOrder);

		model.addAttribute("fullInventory", fullInventory);
		model.addAttribute("user", _user);

		///searchQuery
		
		if (inventoryByName.isEmpty() && searchQuery!=null ) {
			String erros = "Intem not found...!";
			model.addAttribute("errors", erros);
		} 

		return "/store/dashboard.jsp";

	}

	@GetMapping("/store/cart")
	public String myCart(@ModelAttribute("inventory") Inventory inventory, HttpSession session, Model model) {
		Long id = (Long) session.getAttribute("user_id");
		if (id == null) {
			return "redirect:/";
		}

		User _user = userServ.findUserById(id);
		List<UsersCart> fullOrder = CartServ.findByUser(_user);

		model.addAttribute("fullOrder", fullOrder);
		model.addAttribute("user", _user);
		return "/store/cart.jsp";
	}

	// route to add new Item

	@GetMapping("/store/new/{id}")
	public String index(@PathVariable("id") Long id, @ModelAttribute("inventory") Inventory inventory, Model model) {
		model.addAttribute("inventory", inventory);
		return "/store/newItem.jsp";
	}

//	//----------creating a Item---------------   

	@RequestMapping(value = "/store/new", method = RequestMethod.POST)
	public String createItems(@ModelAttribute("inventory") Inventory inventory, BindingResult result, Model model) {
//		if (result.hasErrors()) {
//			return "/store/newItem.jsp";
//		} else {
		InventServ.createItem(inventory);
		return "redirect:/dashboard";
		// }
	}

//	//----------Add to cart---------------   

	@RequestMapping(value = "/cart/addItem", method = RequestMethod.POST)
	public String addItems(@Valid @ModelAttribute("usersCart") UsersCart usersCart, BindingResult result, Model model) {
		if (result.hasErrors()) {

			return "/store/viewItem.jsp";
		} else {
			System.out.println("entering cart");
			CartServ.createItem(usersCart);
			return "redirect:/dashboard";
		}
	}

	// view a show
	@RequestMapping("/store/{id}/view")
	public String view(@PathVariable("id") Long id, Model model, @ModelAttribute("usersCart") UsersCart usersCart,
			HttpSession session, BindingResult result) {
		Long id2 = (Long) session.getAttribute("user_id");
		User _user = userServ.findUserById(id2);
		model.addAttribute("user", _user);

		Inventory _inventory = InventServ.findById(id);
		model.addAttribute("inventory", _inventory);

		return "/store/viewItem.jsp";
	}

	// delete
	@GetMapping(value = "/store/delete/{id}")
	public String destroy(@PathVariable("id") Long id) {
		InventServ.deleteItem(id);
		return "redirect:/dashboard";
	}

	// delete item from cart
	@GetMapping(value = "/cart/delete/{id}")
	public String destroyCart(@PathVariable("id") Long id) {
		CartServ.deleteItem(id);
		return "redirect:/store/cart";
	}
}
