<%--
  Created by IntelliJ IDEA.
  User: elena
  Date: 2023-04-22
  Time: 오후 6:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<%--  bootstrap --%>
	<link href="/css/user/login.css" rel="stylesheet" type="text/css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

	<title>로그인</title>
</head>
<body>
<form class="form-signin" action="/login" method="post" style="max-width: 400px;">
	<div class="mb-4 d-flex justify-content-center">
		<h3 style="font-weight: bold; margin : 10px 0 10px 0">LOGIN</h3>
	</div>

	<div class="form-floating mb-1">
		<input type="text" class="form-control" id="userId" name="userId" placeholder="아이디">
		<label for="userId">ID</label>
	</div>
	<div class="form-floating">
		<input type="password" class="form-control" id="password" name="password" placeholder="패스워드">
		<label for="password">Password</label>
		<p class="error-msg" type="text">${msg}</p>
	</div>
	<div class="checkbox mb-3">
		<label>
			<input type="checkbox" value="remember-y"> 아이디 기억하기
		</label>
	</div>
	<button class="w-100 btn btn-lg btn-outline-orange" type="submit" style="border-color: #4e73df; background-color: #4e73df; color: white; ">로그인</button>
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

</body>
</html>
