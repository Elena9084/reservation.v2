<%--
  Created by IntelliJ IDEA.
  User: elena
  Date: 2023-05-11
  Time: 오후 5:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>예약/대여 현황</title>
  <!-- 부트스트랩 아이콘 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

  <!-- start부트스트랩 Custom 템플릿 -->
  <link href="/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- startbootstrap  Custom styles for this template-->
  <link href="/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- 부트스트랩 css-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

  <style>
    @media (max-width: 900px) {
      .filter-btn {
        margin: 10px;
      }
      .search-btn-container{
        margin: 2% 0 0 0;
        width: 100%;
      }
    }
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

    <div class="container" style="max-width: none; height: 100%;">

      <!-- 내용시작 -->
      <div class="list-container h-75">
        <h5 style="margin-bottom: 20px; font-weight: bold;">예약/대여 현황 조회</h5>
        <table class="table table-hover">
          <colgroup>
            <col style="width: 20%;"/>
            <col style="width: 20%;"/>
            <col style="width: 30%;"/>
            <col style="width: 15%;"/>
            <col style="width: 15%;"/>
          </colgroup>
          <thead>
          <tr>
            <th scope="col">메뉴</th>
            <th scope="col">자원명</th>
            <th scope="col">예약시간</th>
            <th scope="col">수정</th>
            <th scope="col">취소/반납</th>
          </tr>
          </thead>
          <tbody id="noticeList">
          <c:if test="${reservationList != null}">
            <c:forEach var="reservation" items="${reservationList}" varStatus="status" >
              <tr onclick="location.href='/reservation/detail?reservationSeq=${reservation.reservationSeq}'">
                <input value="${reservation.reservationSeq}" type="hidden" id="reservationSeq">
                <td>${reservation.resourceLocation} ${reservation.menuName}</td>
                <td>${reservation.resourceName}</td>
                <td><fmt:formatDate value="${reservation.reservationStartDate}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate> ~ <fmt:formatDate value="${reservation.reservationEndDate}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
                <td><button type="button" class="btn modify-btn" style="border: solid 1px #dee2e6;  border-radius: 5px;"  data-bs-toggle="modal" data-bs-target="#exampleModal1" data-bs-whatever="@getbootstrap" onclick="event.stopPropagation(); location.href='/reservation/modify?reservationSeq=${reservation.reservationSeq}'">수정</button></td>
                <td><button type="button" class="btn modify-btn" style="border: solid 1px #dee2e6;  border-radius: 5px;"  data-bs-toggle="modal" data-bs-target="#validationModal" data-bs-whatever="@getbootstrap" onclick="event.stopPropagation();">취소</button></td>
              </tr>
            </c:forEach>
          </c:if>
          <c:if test="${reservationList.size() == 0 || reservationList eq null || reservationList eq ''}">
            <tr>
              <td colspan="5" style="text-align: center;">예약/대여 중인 항목이 없습니다.</td>
            </tr>
          </c:if>
          </tbody>
        </table>


        <!-- 취소 확인 모달 -->
        <div class="modal fade" id="validationModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" style="max-width: 50rem;">
            <div class="modal-content" id="modify-modal">
              <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel1">삭제 확인</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                예약을 취소하시겠습니까?
              </div>
              <div class="modal-footer">
                <button type="button" class="btn" onclick="removeReservation()" style="border-color: #b5b5b5">확인</button>
              </div>
          </div>
        </div>
        <!-- 모달끝 -->


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

<!-- 내만 js -->
<script src="/js/menu/save-resource.js"></script>
<script src="/js/menu/modify-resource.js"></script>
<script src="/js/reservation/remove-reservation.js"></script>



</body>
</html>
