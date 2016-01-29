package edu.mum.cs544.spring.blog.dao;

import java.util.List;

import edu.mum.cs544.spring.blog.model.Person;

public interface PersonDAO {

	public void addPerson(Person p);
	public void updatePerson(Person p);
	public List<Person> listPersons();
	public Person getPersonById(int id);
	public void removePerson(int id);
}
