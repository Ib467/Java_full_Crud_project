package com.indika.logreg.services;

import java.util.List;

//import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.indika.logreg.models.User;
import com.indika.logreg.models.UsersCart;
import com.indika.logreg.repositories.CartRepo;

@Service
public class CartService {

	// change to
	@Autowired
	private CartRepo cartRepo;



	public List<UsersCart> findAll() {
		return (List<UsersCart>) this.cartRepo.findAll();
	}



	public UsersCart createItem(UsersCart usersCart) {
		return this.cartRepo.save(usersCart);
	}



	public void deleteItem(Long id) {
		this.cartRepo.deleteById(id);
		
	}


	public List<UsersCart> findByUser(User user) {
		return (List<UsersCart>) this.cartRepo.findByUser(user);
	}





}
