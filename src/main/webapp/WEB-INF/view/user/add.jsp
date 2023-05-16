<%--
  Created by IntelliJ IDEA.
  User: elena
  Date: 2023-05-15
  Time: 오전 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<!-- 모바일 반응형 적용 할 때 무조건 넣어줘야 함! -->
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>사용자 등록</title> <!-- 부트스트랩 아이콘 -->

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

	<!-- start부트스트랩 Custom 템플릿 -->
	<link href="/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

	<!-- startbootstrap  Custom styles for this template-->
	<link href="/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

	<!-- 부트스트랩 css-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<!-- 커스텀 -->
	<link rel="stylesheet" href="/css/user/user-add.css">
</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
	<%@ include file="../common/sidebar.jsp" %>
	<div id="content-wrapper" class="d-flex flex-column">
		<!-- topbar -->
		<%@ include file="../common/topbar.jsp" %>
		<!-- 내용시작 -->
		<div class="container"  style="height: 100%;">
			<h5 style="margin-bottom: 10px; font-weight: bold;">사용자 등록</h5>
			<hr>
			<form class="user-form" method="post" action="/adm/user" accept-charset="UTF-8">
				<div class="row mb-3">
					<label for="userName" class="col-sm-2 col-form-label">사용자명</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="userName" name="userName">
					</div>
				</div>
				<div class="row mb-3">
					<label for="userId" class="col-sm-2 col-form-label">아이디</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="userId" name="userId">
					</div>
				</div>
				<div class="row mb-3">
					<label for="phoneNum" class="col-sm-2 col-form-label">휴대전화</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="phoneNum" name="phoneNum">
					</div>
				</div>
				<div class="row mb-3">
					<label for="departmentCode" class="col-sm-2 col-form-label">부서</label>
					<div class="col-sm-10">
						<select class="form-select location-dropdown" name="departmentCode" id="departmentCode" aria-label="Default select example">
							<option selected>부서선택</option>
							<c:forEach items="${departmentList}" var="department">
								<option value="${department.departmentCode}">${department.departmentName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="row mb-3">
					<label for="positionCode" class="col-sm-2 col-form-label">직급</label>
					<div class="col-sm-10">
						<select class="form-select location-dropdown" name="positionCode" id="positionCode" aria-label="Default select example">
							<option selected>직급선택</option>
							<c:forEach items="${positionList}" var="position">
								<option value="${position.positionCode}">${position.positionName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<fieldset class="row mb-3">
					<legend class="col-form-label col-sm-2 pt-0">관리자 여부</legend>
					<div class="col-sm-10  col-sm-10">
						<div class="form-check">
							<input class="form-check-input" name="managerYn" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="N" checked>
							<label class="form-check-label" for="flexRadioDefault1">
								일반
							</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" name="managerYn" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="Y">
							<label class="form-check-label" for="flexRadioDefault2">
								관리자
							</label>
						</div>
					</div>
				</fieldset>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<button type="submit" class="btn btn-outline-dark">사용자 등록</button>
				</div>
			</form>
		</div>
	</div>
</div>


<!-- Bootstrap core JavaScript-->
<script src="/bootstrap/vendor/jquery/jquery.min.js"></script>
<script src="/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- 부트스트랩 js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

<!-- Core plugin JavaScript-->
<script src="/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/bootstrap/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/bootstrap/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="/bootstrap/js/demo/chart-area-demo.js"></script>
<script src="/bootstrap/js/demo/chart-pie-demo.js"></script>




</body>
</html>
