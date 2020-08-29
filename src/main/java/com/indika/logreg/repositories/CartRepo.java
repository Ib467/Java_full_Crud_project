package com.indika.logreg.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.indika.logreg.models.User;
import com.indika.logreg.models.UsersCart;


@Repository
public interface CartRepo extends CrudRepository<UsersCart, Long>{
	
	List<UsersCart> findAll();
	List<UsersCart> findByUser(User user);

}

