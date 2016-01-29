package edu.mum.cs544.spring.blog.service;

import java.util.List;

import edu.mum.cs544.spring.blog.model.Blog;

public interface BlogService {
	public void addBlog(Blog p);
	public void updateBlog(Blog p);
	public List<Blog> listBlogs();
	public List<Blog> listBlogsByUsername(String username);
	public Blog getBlogById(int id);
	public void removeBlog(int id);
	
}