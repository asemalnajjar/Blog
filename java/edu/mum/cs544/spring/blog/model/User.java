package edu.mum.cs544.spring.blog.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class User {
	@Id
	@GeneratedValue
	private int id;
	

	

	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(String d) {
		// TODO Auto-generated constructor stub
	}
}
