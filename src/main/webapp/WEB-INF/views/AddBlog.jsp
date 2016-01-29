<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

<title>Create New Blog</title>
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
				<a class="blog-nav-item active" href="../" >Home</a> 
					<a class="blog-nav-item" href="../blog/add">New Post</a>
					<a class="blog-nav-item" href="/SpringMVCHibernate/j_spring_security_logout">Logout</a>
			
			</nav>
		</div>
		<div class="container">
			<P>${serverTime}</P>
		</div>
	</div>

	<div class="container">

		<div class="blog-header">

	<h1>My Blogs </h1>
	<hr>
	<c:if test="${!empty listBlog}">
		<table class="table table-striped">
			<tr>
				<th width="80">Blog ID</th>
				<th width="120">Blog Title</th>
				<th width="60">Edit</th>
				<th width="60">Delete</th>
			</tr>
			<c:forEach items="${listBlog}" var="blog">
				<tr>
					<td>${blog.id}</td>
					<td>${blog.title}</td>
					<td><a href="<c:url value='/blog/${blog.id}' />"><%-- "list/${blog.id}"> --%>Edit</a></td>
					<td><a href="<c:url value='/remove/${blog.id}' />">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>

	<%-- 
	<c:url var="addAction" value="/blog/add"></c:url>

	<form:form action="${addAction}" commandName="blog">
		<table class="tg">
			<c:if test="${!empty blog.title}">
				<tr>
					<td><form:label path="id">
							<spring:message text="ID" />
						</form:label></td>
					<td><form:input path="id" readonly="true" size="8"
							disabled="true" /> <form:hidden path="id" /></td>
				</tr>
			</c:if>
			<tr>
				<td><form:label path="title">
						<spring:message text="Title" />
					</form:label></td>
				<td><form:input path="title" /></td>
			</tr>
			<tr>
				<td><form:label path="descrption">
						<spring:message text="Descrption" />
					</form:label></td>
				<td><form:input path="descrption" /></td>
			</tr>
			<tr>
				<td colspan="2"><c:if test="${!empty blog.title}">
						<input type="submit" value="<spring:message text="Edit Blog"/>" />
					</c:if> <c:if test="${empty blog.title}">
						<input type="submit" value="<spring:message text="Add Person"/>" />
					</c:if></td>
			</tr>
		</table>
	</form:form>

 --%>
</div>
</div>
</body>
</html>