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
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

	<title>로그인</title>

		<style>
          .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
          }

          @media (min-width: 768px) {
            .bd-placeholder-img-lg {
              font-size: 3.5rem;
            }
          }

          .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
          }

          .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
          }

          .bi {
            vertical-align: -.125em;
            fill: currentColor;
          }

          .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
          }

          .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
          }
		</style>

	<%--  bootstrap custom --%>
	<link href="/css/user/login.css" rel="stylesheet" type="text/css">


</head>
<body class="text-center">


<main class="form-signin w-100 m-auto">
	<form class="form-signin" action="/login" method="post">
		<div class="mb-4 d-flex justify-content-center">
			<h3 style="font-weight: bold; margin : 10px 0 10px 0">LOGIN</h3>
		</div>

		<div class="form-floating">
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
</main>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

</body>
</html>
