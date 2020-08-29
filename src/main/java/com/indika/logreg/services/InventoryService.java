package com.indika.logreg.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.indika.logreg.models.Inventory;
import com.indika.logreg.repositories.InventoryRepo;


@Service
public class InventoryService {

	// change to
	@Autowired
	private InventoryRepo inventoryRepo;



	public List<Inventory> getFullInventory() {
		return this.inventoryRepo.findAll();
	}

	// create a Show

	public Inventory createItem(Inventory i) {
		return this.inventoryRepo.save(i);
	}

	// delete a show

	public void deleteItem(Long id) {
		this.inventoryRepo.deleteById(id);
	}

	// get Show for view page
	public Inventory findById(Long id) {
		return inventoryRepo.findById(id).get();
	}

	public List<Inventory> getByName(String name) {
		return inventoryRepo.findByName(name);
	}



}
