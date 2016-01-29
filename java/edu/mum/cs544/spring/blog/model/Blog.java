package edu.mum.cs544.spring.blog.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name="BLOG")
public class Blog {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
//    @Size(min=2, max=30) 
	@NotNull
	private String title;
	
	private String descrption;
	
	private String username ;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Blog() {
	}

	public Blog(String title, String descrption ) {
		this.title = title;
		this.descrption = descrption;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescrption() {
		return descrption;
	}

	public void setDescrption(String descrption) {
		this.descrption = descrption;
	}
	
}
