package edu.mum.cs544.spring.blog;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.mum.cs544.spring.blog.model.Blog;
import edu.mum.cs544.spring.blog.service.BlogService;

@Controller
public class BlogController {

	@Autowired(required = true)
	private BlogService blogService;
	@Autowired
	private Blog blog;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("listBlog", this.blogService.listBlogs());
		return "home";
	}

	@RequestMapping(value = "blog/list", method = RequestMethod.GET)
	public String editBlog(Model model) {
		User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String u = authUser.getUsername();
		System.out.println("user " + u);
		model.addAttribute("listBlog", this.blogService.listBlogsByUsername(u));
		return "AddBlog";
	}

	@RequestMapping("remove/{id}")
	public String removeBlog(@PathVariable("id") int id) {
		this.blogService.removeBlog(id);
		return "redirect:/blog/list";
	}

	@RequestMapping(value = "blog/{id}", method = RequestMethod.GET)
	public String editBlog(@PathVariable("id") int id, Model model) {
		model.addAttribute("blog", this.blogService.getBlogById(id));
		return "EditBlog";
	}

	@RequestMapping("blog/add")
	public String newBlog(Model model) {
		model.addAttribute("blog", this.blog);
		return "newBlog";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String editBlog(Blog p, BindingResult result, Model model) {
		User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String u = authUser.getUsername();
		p.setUsername(u);
		if (p.getId() == 0)
			this.blogService.addBlog(p);
		else
			this.blogService.updateBlog(p);
		return "redirect:/blog/list";
	}

	/// login
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String goToLogin(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model) {
		if (error != null) {
			model.addAttribute("error", "Invalid username and password!");
		}
		if (logout != null) {
			model.addAttribute("msg", "You've been logged out successfully.");
		}
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login() {

		System.out.println("SUCCESS");

		return "home";
	}

}
