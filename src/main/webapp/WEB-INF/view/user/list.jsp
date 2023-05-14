<%--
  Created by IntelliJ IDEA.
  User: elena
  Date: 2023-05-10
  Time: 오전 10:15
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
	<title>사용자 조회</title> <!-- 부트스트랩 아이콘 -->

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

	<!-- start부트스트랩 Custom 템플릿 -->
	<link href="/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

	<!-- startbootstrap  Custom styles for this template-->
	<link href="/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

	<!-- 부트스트랩 css-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">


	<style>
	 /* 작은 창에서부터 최대 900까지는 아래와 같이 보여진다.*/
      @media (max-width: 900px) {
        .filter-btn {
          margin: 10px;
		  width: 100%;
        }
        .search-btn-container{
          margin: 2% 0 0 0;
          width: 100%;
        }
      }
	  /*큰 창에서부터 최소한 992까지는 아래와 같이 보여진다.*/
      @media (min-width: 992px) {
        .search-btn-container{
          flex: 0 0 auto;
          width: 75%;
          margin: 2% 0 0 16.5%;
        }
      }

	</style>
</head>
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
	<%@ include file="../common/sidebar.jsp" %>
	<div id="content-wrapper" class="d-flex flex-column">
		<!-- topbar -->
		<%@ include file="../common/topbar.jsp" %>

		<!-- 내용시작 -->
		<div class="container"  style="max-width: none; height: 100%;">
			<form method="get" action="/adm/user">
				<div class="filter-container"  style="height: 200px;">
					<div class="date-search-container" style="clear: both;">
						<div class="row">
							<div class="col-lg-2 d-none d-lg-block">
								<p style="font-weight: bold; text-align: center;">사용자명</p>
							</div>
							<div class="col-lg-9 col-sm-12">
								<input class="search-content form-control" type="text" name="userName" value="${param.userName}">
							</div>
							<div class="col-lg-1 d-none d-lg-block">
							</div>
						</div>
					</div>
					<!-- 부서 -->
					<div class="date-search-container" style="clear: both;">
						<div class="row">
							<div class="col-lg-2 d-none d-lg-block">
								<p style="font-weight: bold; text-align: center;">부서</p>
							</div>
							<div class="col-lg-9 col-sm-12">
								<select class="form-select location-dropdown" id="department_select" name="departmentCode" aria-label="Default select example">
									<option value="">전체</option>
									<c:forEach items="${departmentList}" var="department">
										<option value="${department.departmentCode}" <c:if test="${department.departmentCode eq param.departmentCode}">selected</c:if> >${department.departmentName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-lg-1 d-none d-lg-block">
							</div>
						</div>
					</div>
					<div class="search-btn-one-container">
						<button class="btn btn-outline-dark filter-btn search-btn-one search-btn-container" type="submit">조회</button>
					</div>
				</div>
			</form>

			<!-- 사용자 조회 목록 -->
			<div class="list-container">
				<table class="table table-hove">
					<colgroup>
						<col style="width: 5%;"/>
						<col style="width: 10%;"/>
						<col style="width: 10%;"/>
						<col style="width: 30%;"/>
						<col style="width: 20%;"/>
						<col style="width: 10%;"/>
						<col style="width: 10%;"/>
					</colgroup>
					<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">이름</th>
						<th scope="col">부서</th>
						<th scope="col">이메일</th>
						<th scope="col">휴대전화</th>
						<th scope="col">관리자</th>
						<th scope="col">등록</th>
					</tr>
					</thead>
					<tbody id="noticeList">
					<c:if test="${userList != null}">
						<c:forEach var="user" items="${userList}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${user.userName}</td>
								<td>${user.departmentName}</td>
								<td>${user.email}</td>
								<td>${user.phoneNum}</td>
								<td><input class="user-id" type="checkbox" value="${user.userId}" ${user.managerYn eq 'Y' ? 'checked' : ''} onchange="saveManager(event)"></td>
								<td><input class="user-id" type="checkbox" value="${user.userId}" ${user.registrationYn eq 'Y' ? 'checked' : ''} onchange="saveRegistration(event)"></td>
							</tr>
						</c:forEach>
					</c:if>
					</tbody>
				</table>
			</div>
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

<script src="/js/user/save-manager.js"></script>


</body>
</html>
