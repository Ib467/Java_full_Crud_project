package com.indika.logreg.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.indika.logreg.models.Inventory;


@Repository
public interface InventoryRepo extends CrudRepository<Inventory, Long>{
	
	List<Inventory> findAll();


	
    // get all the names of the dojos
	@Query("SELECT d FROM Inventory d WHERE name = ?1")
    List<Inventory> findByName(String name);
	
}

