<%--
  Created by IntelliJ IDEA.
  User: elena
  Date: 2023-05-11
  Time: 오전 1:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>자원예약</title>

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
      @media (max-width: 576px) {
        .mo-display-flex {
		  width: 100%;
		  display: flex;
		  align-items: center;
		  justify-content: space-between;
        }
		.mo-display-flex .mo-display-flex-half{
		  width: 49.5%;
		}
        .row.mo-display-flex{
		  margin : 0;
		}
		.row.mo-display-flex > * {
		  padding-right: 0 !important;
		  padding-left: 0 !important;
		}

      }


      /* 작은 창에서부터 최대 900까지는 아래와 같이 보여진다.*/
      @media (max-width: 900px) {
        .filter-btn {
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
        .filter-btn {
          width: 49.5%;
        }
      }
	  .search-date{
		width: 100%;
        height: 35px;
        margin-top: 5px;
		border: solid 1px #b5b5b5;
		border-radius: 5px;
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
			<div>
				<div class="filter-title">
					<p style="padding-top: 10px; font-weight: bold;" >${resource.resourceName}<p>
				</div>
				<hr>

				<div class="date-search-container" style="clear: both;">
					<div class="row">
						<div class="col-lg-2 d-none d-lg-block">
							<p style="font-weight: bold; text-align: center;">사용자명</p>
						</div>
						<div class="col-lg-9 col-sm-12">
							<input class="form-control" type="text" name="userName" value="${sessionScope.loginUser.userName}" disabled style="background-color: #ffffff">
							<input type="hidden" name="userId" value="${sessionScope.loginUser.userId}">
						</div>
						<div class="col-lg-1 d-none d-lg-block">
						</div>
					</div>
				</div>


				<div class="notice-type-search-container">
					<div class="row">
						<div class="col-lg-2 d-none d-lg-block">
							<p style="font-weight: bold; text-align: center;">시작</p>
						</div>
						<div class="col-lg-9 col-sm-12">
							<div class="row mo-display-flex">
								<input class="resource-code " name="resourceCode" id="resourceCode" type="hidden" value="${resource.resourceCode}">
								<div class="col-lg-6 col-sm-6 mo-display-flex-half">
									<fmt:parseDate var="startDate" value="${startDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
									<input class="search-date" name="reservationStartDate" type="date"  value="<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd" />">
								</div>
								<div class="col-lg-6 col-sm-6 mo-display-flex-half">
									<input class="search-date" name="reservationStartDate" type="time" value="<fmt:formatDate value="${startDate}" pattern="HH:mm" />">
								</div>
							</div>
						</div>
						<div class="col-lg-1 d-none d-lg-block">
						</div>
					</div>
					<div class="notice-type-search-container">
						<div class="row">
							<div class="col-lg-2 d-none d-lg-block">
								<p style="font-weight: bold; text-align: center;">종료</p>
							</div>
							<div class="col-lg-9 col-sm-12">
								<div class="row mo-display-flex">
									<fmt:parseDate var="endDate" value="${endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
									<div class="col-lg-6 col-sm-6 mo-display-flex-half">
										<input class="search-date" name="reservationEndDate" type="date" value="<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd"/>">
									</div>
									<div class="col-lg-6 col-sm-6 mo-display-flex-half">
										<input class="search-date" name="reservationEndDate" type="time" value="<fmt:formatDate value="${endDate}" pattern="HH:mm"/>">
									</div>
								</div>
							</div>
							<div class="col-lg-1 d-none d-lg-block">
							</div>
						</div>
					</div>
				</div>

				<div class="date-search-container" style="clear: both; margin-top: 10px;">
					<div class="row">
						<div class="col-lg-2 d-none d-lg-block">
							<p style="font-weight: bold; text-align: center;">비고</p>
						</div>
						<div class="col-lg-9 col-sm-12">
							<input class="form-control" type="text" name="note" value="${param.note}" placeholder="비고입력">
						</div>
						<div class="col-lg-1 d-none d-lg-block">
						</div>
					</div>
				</div>
				<div class="search-btn-container">
					<button class="btn btn-outline-secondary filter-btn" onClick="location.href='/reservation'">목록으로</button>
					<button class="btn btn-outline-secondary filter-btn" onClick="reservationSave()">등록 완료</button>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
	<i class="fas fa-angle-up"></i>
</a>

<!-- Bootstrap core JavaScript-->
<script src="/bootstrap/vendor/jquery/jquery.min.js"></script>
<script src="/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/bootstrap/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/bootstrap/vendor/chart.js/Chart.min.js"></script>

<%--<!--순수 부트스트랩 js-->--%>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>--%>


<!-- Page level custom scripts -->
<script src="/bootstrap/js/demo/chart-area-demo.js"></script>
<script src="/bootstrap/js/demo/chart-pie-demo.js"></script>
<script src="/js/reservation/reservation-save.js"></script>

</body>
</html>
