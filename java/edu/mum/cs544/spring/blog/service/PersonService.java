package edu.mum.cs544.spring.blog.service;

import java.util.List;

import edu.mum.cs544.spring.blog.model.Person;

public interface PersonService {

	public void addPerson(Person p);
	public void updatePerson(Person p);
	public List<Person> listPersons();
	public Person getPersonById(int id);
	public void removePerson(int id);
	
}
