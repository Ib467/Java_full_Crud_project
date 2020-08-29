package com.indika.logreg.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Entity
@Table(name="inventory")
public class Inventory {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	@Size(min=2, message="name must be greater than 2 characters")
	//@NotEmpty
	private String name;  //title 
    
	@Min(1)
	private float price;
	
	@Min(1)
    private Integer iten_inhand;
    
    
   public Inventory() {
    	
    }
    
    @Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public Integer getIten_inhand() {
		return iten_inhand;
	}
	public void setIten_inhand(Integer iten_inhand) {
		this.iten_inhand = iten_inhand;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public Inventory(Long id, @Size(min = 2, message = "name must be greater than 2 characters") String name,
			@Size(min = 1, message = "network name must be greater than 1 characters") Integer price,
			@NotEmpty Integer iten_inhand, Date createdAt, Date updatedAt, List<User> users) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.iten_inhand = iten_inhand;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.users = users;
	}
    
    //many to one - many courses can be created by same user
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "users_cart", 
        joinColumns = @JoinColumn(name = "item_id"), 
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private List<User> users;

	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
}
