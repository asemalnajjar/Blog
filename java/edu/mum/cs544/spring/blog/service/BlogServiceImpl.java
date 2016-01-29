package edu.mum.cs544.spring.blog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.cs544.spring.blog.dao.BlogDao;
import edu.mum.cs544.spring.blog.model.Blog;

@Service
public class BlogServiceImpl implements BlogService {
	
	@Autowired
	private BlogDao blogDAO;

	@Override
	@Transactional
	public void addBlog(Blog p) {
		this.blogDAO.addBlog(p);
	}

	@Override
	@Transactional
	public void updateBlog(Blog p) {
		this.blogDAO.updateBlog(p);
	}

	@Override
	@Transactional
	public List<Blog> listBlogs() {
		
		return this.blogDAO.listBlogs();
	}

	@Override
	@Transactional
	public Blog getBlogById(int id) {
		return this.blogDAO.getBlogById(id);
	}

	@Override
	@Transactional
	public void removeBlog(int id) {
		this.blogDAO.removeBlog(id);
	}

	@Override
	public List<Blog> listBlogsByUsername(String username) {
		return this.blogDAO.listBlogsByname(username);
		
	}

}
