<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

<title>Home</title>
<style>
/*
 * Globals
 */
body {
	font-family: Georgia, "Times New Roman", Times, serif;
	color: #555;
}

h1, .h1, h2, .h2, h3, .h3, h4, .h4, h5, .h5, h6, .h6 {
	margin-top: 0;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-weight: normal;
	color: #333;
}

/*
 * Override Bootstrap's default container.
 */
@media ( min-width : 1200px) {
	.container {
		width: 970px;
	}
}

/*
 * Masthead for nav
 */
.blog-masthead {
	background-color: #428bca;
	-webkit-box-shadow: inset 0 -2px 5px rgba(0, 0, 0, .1);
	box-shadow: inset 0 -2px 5px rgba(0, 0, 0, .1);
}

/* Nav links */
.blog-nav-item {
	position: relative;
	display: inline-block;
	padding: 10px;
	font-weight: 500;
	color: #cdddeb;
}

.blog-nav-item:hover, .blog-nav-item:focus {
	color: #fff;
	text-decoration: none;
}

/* Active state gets a caret at the bottom */
.blog-nav .active {
	color: #fff;
}

.blog-nav .active:after {
	position: absolute;
	bottom: 0;
	left: 50%;
	width: 0;
	height: 0;
	margin-left: -5px;
	vertical-align: middle;
	content: " ";
	border-right: 5px solid transparent;
	border-bottom: 5px solid;
	border-left: 5px solid transparent;
}

/*
 * Blog name and description
 */
.blog-header {
	padding-top: 20px;
	padding-bottom: 20px;
}

.blog-title {
	margin-top: 30px;
	margin-bottom: 0;
	font-size: 60px;
	font-weight: normal;
}

.blog-description {
	font-size: 20px;
	color: #999;
}

/*
 * Main column and sidebar layout
 */
.blog-main {
	font-size: 18px;
	line-height: 1.5;
}

/* Sidebar modules for boxing content */
.sidebar-module {
	padding: 15px;
	margin: 0 -15px 15px;
}

.sidebar-module-inset {
	padding: 15px;
	background-color: #f5f5f5;
	border-radius: 4px;
}

.sidebar-module-inset p:last-child, .sidebar-module-inset ul:last-child,
	.sidebar-module-inset ol:last-child {
	margin-bottom: 0;
}

/* Pagination */
.pager {
	margin-bottom: 60px;
	text-align: left;
}

.pager>li>a {
	width: 140px;
	padding: 10px 20px;
	text-align: center;
	border-radius: 30px;
}

/*
 * Blog posts
 */
.blog-post {
	margin-bottom: 60px;
}

.blog-post-title {
	margin-bottom: 5px;
	font-size: 40px;
}

.blog-post-meta {
	margin-bottom: 20px;
	color: #999;
}

/*
 * Footer
 */
.blog-footer {
	padding: 40px 0;
	color: #999;
	text-align: center;
	background-color: #f9f9f9;
	border-top: 1px solid #e5e5e5;
}

.blog-footer p:last-child {
	margin-bottom: 0;
}
</style>
</head>
<body>
	<div class="blog-masthead">
		<div class="container">
			<nav class="blog-nav">
				<a class="blog-nav-item active" href="#">Home</a> <a
					class="blog-nav-item" href="blog/add">New Post</a> 
					<a class="blog-nav-item" href="<c:url value='blog/list' />" >Edit My Blogs</a> 
					<%-- <a href="<c:url value='/edit/${person.id}' />" >Edit</a> --%>
					<a class="blog-nav-item" href="/SpringMVCHibernate/login">SignIn</a>
					<a class="blog-nav-item" href="/SpringMVCHibernate/j_spring_security_logout">Logout</a>
			</nav>
		</div>
		<div class="container">
			<P>${serverTime}</P>
		</div>
	</div>


	<div class="container">

		<div class="blog-header">
			<h1 class="blog-title"> Blogs </h1>
 		</div>
 
 		<%-- 
 		<h3>Blogs List</h3>
		<c:if test="${!empty listBlog}">
			<table class="table table-striped">
				<tr>
					<th width="80">Blog ID</th>
					<th width="120">Blog Title</th>
					<th width="120">Blog Descripition</th>
				</tr>
				<c:forEach items="${listBlog}" var="blog">
					<tr>
						<td>${blog.id}</td>
						<td>${blog.title}</td>
						<td>${blog.descrption}</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
 --%>

		<div class="row">

			<div class="col-sm-8 blog-main">

				<div class="blog-post">
					<c:if test="${!empty listBlog}">
						<c:forEach items="${listBlog}" var="blog">
												<hr>
						
							<h2 class="blog-post-title">${blog.title}</h2>
					<p class="blog-post-meta">
						January 1, 2014 by <a href="#">${blog.username}</a>
					</p>

					<p>${blog.descrption}</p>
					</c:forEach>
					</c:if>
					<hr>
				</div>
				<!-- /.blog-post -->

				<div class="blog-post">
								</div>
				<!-- /.blog-post -->

				<div class="blog-post">
					</div>
				<!-- /.blog-post -->

				<nav>
					<ul class="pager">
						<li><a href="#">Previous</a></li>
						<li><a href="#">Next</a></li>
					</ul>
				</nav>

			</div>
			<!-- /.blog-main -->

			<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
				<div class="sidebar-module sidebar-module-inset">
				
					<h4>About</h4>
					<p>
						Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras
						mattis consectetur purus sit amet fermentum. Aenean lacinia
						bibendum nulla sed consectetur.
					</p>
				</div>
				<div class="sidebar-module">
					<h4>Archives</h4>
					<ol class="list-unstyled">
						<li><a href="#">March 2014</a></li>
						<li><a href="#">February 2014</a></li>
						<li><a href="#">January 2014</a></li>
						<li><a href="#">December 2013</a></li>
						<li><a href="#">November 2013</a></li>
						<li><a href="#">October 2013</a></li>
						<li><a href="#">September 2013</a></li>
						<li><a href="#">August 2013</a></li>
						<li><a href="#">July 2013</a></li>
						<li><a href="#">June 2013</a></li>
						<li><a href="#">May 2013</a></li>
						<li><a href="#">April 2013</a></li>
					</ol>
				</div>
				<div class="sidebar-module">
					<h4>Elsewhere</h4>
					<ol class="list-unstyled">
						<li><a href="#">GitHub</a></li>
						<li><a href="#">Twitter</a></li>
						<li><a href="#">Facebook</a></li>
					</ol>
				</div>
			</div>
			<!-- /.blog-sidebar -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<footer class="blog-footer">
		<p>
			Blog template built for <a href="http://getbootstrap.com">Bootstrap</a>
			by <a href="https://twitter.com/mdo">@mdo</a>.
		</p>
		<p>
			<a href="#">Back to top</a>
		</p>
	</footer>


</body>
</html>
