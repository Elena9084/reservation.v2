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
					<div class="search-btn-container">
						<button class="btn btn-outline-dark filter-btn" style="width: 49.5%;" type="submit">조회</button>
						<input class="btn btn-outline-dark filter-btn" type="button" style="width: 49.5%" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap" value="사용자등록"> <!-- 모달 버튼 -->
					</div>
				</div>
			</form>

			<!-- 등록 모달 -->
			<form method="post" action="/adm/user" accept-charset="UTF-8">
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" style="max-width: 50rem;">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">사용자 등록</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="row mt-2">
									<div class="col-lg-2 d-none d-lg-block">
										<p class="modal-p">사용자명</p>
									</div>
									<div class="col-lg-10 col-sm-12">
										<input type="text" class="user-name" name="userName" placeholder="사용자명" style="height: 37px; width: 100%; border-radius: 5px; border: solid 1px #b5b5b5;">
									</div>
								</div>
								<div class="row mt-2">
									<div class="col-lg-2 d-none d-lg-block">
										<p class="modal-p">아이디</p>
									</div>
									<div class="col-lg-10 col-sm-12">
										<input type="text" class="user-id" name="userId" placeholder="아이디" style="height: 37px; width: 100%; border-radius: 5px; border: solid 1px #b5b5b5;">
									</div>
								</div>
								<div class="row mt-2">
									<div class="col-lg-2 d-none d-lg-block">
										<p class="modal-p">휴대전화</p>
									</div>
									<div class="col-lg-10 col-sm-12">
										<input type="text" class="phone-num" name="phoneNum" placeholder="휴대전화" style="height: 37px; width: 100%; border-radius: 5px; border: solid 1px #b5b5b5;">
									</div>
								</div>
								<div class="row mt-2">
									<div class="col-lg-2 d-none d-lg-block">
										<p class="modal-p">부서</p>
									</div>
									<div class="col-lg-10 col-sm-12">
										<select class="form-select location-dropdown" name="departmentCode" aria-label="Default select example">
											<option selected>부서선택</option>
											<c:forEach items="${departmentList}" var="department">
											<option value="${department.departmentCode}">${department.departmentName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="row mt-2">
									<div class="col-lg-2 d-none d-lg-block">
										<p class="modal-p">직급</p>
									</div>
									<div class="col-lg-10 col-sm-12">
										<select class="form-select location-dropdown" name="positionCode" aria-label="Default select example">
											<option selected>직급선택</option>
											<c:forEach items="${positionList}" var="position">
											<option value="${position.positionCode}">${position.positionName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="row mb-3">
									<p class="col-lg-2 col-sm-2 modal-p">관리자 여부</p>
									<div class="col-lg-10 col-sm-10 modal-div">
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
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn" style="border-color: #b5b5b5">등록</button>
							</div>
						</div>
					</div>
				</div>
			</form>

			<!-- 모달 끝 -->

			<!-- 사용자 조회 목록 -->
			<div class="list-container">
				<table class="table table-hove">
					<colgroup>
						<col style="width: 5%;"/>
						<col style="width: 10%;"/>
						<col style="width: 15%;"/>
						<col style="width: 15%;"/>
						<col style="width: 30%;"/>
						<col style="width: 10%;"/>
						<col style="width: 15%;"/>
					</colgroup>
					<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">이름</th>
						<th scope="col">부서</th>
						<th scope="col">직급</th>
						<th scope="col">휴대전화</th>
						<th scope="col">관리자</th>
						<th scope="col">삭제</th>
					</tr>
					</thead>
					<tbody id="noticeList">
					<c:if test="${userList != null}">
						<c:forEach var="user" items="${userList}" varStatus="status">
							<tr>
								<input id="userId" type="hidden" value="${user.userId}">
								<td>${status.count}</td>
								<td>${user.userName}</td>
								<td>${user.departmentName}</td>
								<td>${user.positionName}</td>
								<td>${user.phoneNum}</td>
								<td><input class="user-id" type="checkbox" value="${user.userId}" ${user.managerYn eq 'Y' ? 'checked' : ''} onchange="saveManager(event)"></td>
								<td><input class="btn btn-outline-dark" type="button" value="삭제" data-bs-toggle="modal" data-bs-target="#validationModal" data-bs-whatever="@getbootstrap"></td>
							</tr>
						</c:forEach>
					</c:if>
					</tbody>
				</table>
			</div>

			<!-- 삭제 확인 모달 -->
			<div class="modal fade" id="validationModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content" id="modify-modal">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel1">삭제 확인</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							사용자를 삭제하시겠습니까?
						</div>
						<div class="modal-footer">
							<button type="button" class="btn" onclick="removeUser()" style="border-color: #b5b5b5">확인</button>
						</div>
					</div>
				</div>
				<!-- 모달끝 -->
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
<script src="/js/user/remove-user.js"></script>


</body>
</html>
