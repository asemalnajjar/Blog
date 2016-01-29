package edu.mum.cs544.spring.blog.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.cs544.spring.blog.model.Blog;
	
@Repository
@Transactional
public class BlogDAOImpl implements BlogDao {

	private static final Logger logger = LoggerFactory.getLogger(PersonDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addBlog(Blog p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Blog saved successfully, Blog Details=" + p);
	}

	@Override
	public void updateBlog(Blog p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(p);
		logger.info("Blog updated successfully, Blog Details=" + p);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Blog> listBlogs() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Blog> blogList = session.createQuery("from Blog ").list();
		for (Blog p : blogList) {
			logger.info("Blog List::" + p);
		}
		return blogList;
	}

	@Override
	public Blog getBlogById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Blog p = (Blog) session.load(Blog.class, new Integer(id));
		logger.info("Blog loaded successfully, Blog details=" + p);
		return p;
	}

	@Override
	public void removeBlog(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Blog p = (Blog) session.load(Blog.class, new Integer(id));
		if (null != p) {
			session.delete(p);
		}
		logger.info("Blog deleted successfully, Blog details=" + p);

	}

	
	@Override
	@SuppressWarnings("unchecked")
	public List<Blog> listBlogsByname(String username) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Blog where username = :username");
		query.setParameter("username",username);
		List<Blog> blogList = query.list();
		for (Blog p : blogList) {
			logger.info("Blog List::" + p);
		}
		return blogList;
	}
	
}
