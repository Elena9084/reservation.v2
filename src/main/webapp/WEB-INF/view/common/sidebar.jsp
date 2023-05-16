<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

  <!-- Sidebar - Brand -->
  <a class="sidebar-brand d-flex align-items-center justify-content-center" onclick="location.href='/reservation'">
    <div class="sidebar-brand-icon rotate-n-15">
      <i class="fas fa-laugh-wink"></i>
    </div>
    <div class="sidebar-brand-text mx-3">자원예약 시스템 </div>
  </a>


  <!-- Divider -->
  <hr class="sidebar-divider">

  <!-- Heading -->
  <div class="sidebar-heading">
    사용자
  </div>

  <!-- Nav Item - Pages Collapse Menu -->
  <li class="nav-item">
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
       aria-expanded="true" aria-controls="collapseTwo">
      <span>자원예약</span>
    </a>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
      <div class="bg-white py-2 collapse-inner rounded">
        <a class="collapse-item" onclick="location.href='/reservation?menuCode=R001&resourceLocation=한남'">한남사옥 회의실</a>
        <a class="collapse-item" onclick="location.href='/reservation?menuCode=R001&resourceLocation=신사'">신사사옥 회의실</a>
        <a class="collapse-item" onclick="location.href='/reservation?menuCode=H001&resourceLocation=한남'">한남사옥 헬스키퍼</a>
        <a class="collapse-item" onclick="location.href='/reservation?menuCode=H001&resourceLocation=신사'">신사사옥 헬스키퍼</a>
        <a class="collapse-item" onclick="location.href='/reservation?menuCode=C001&resourceLocation=공용'">차량</a>
      </div>
    </div>
  </li>

  <li class="nav-item">
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo1"
       aria-expanded="true" aria-controls="collapseTwo1">
      <span>예약/대여 현황</span>
    </a>
    <div id="collapseTwo1" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
      <div class="bg-white py-2 collapse-inner rounded">
        <a class="collapse-item" onclick="location.href='/myReservation'">예약/대여 현황 조회</a>
      </div>
    </div>
  </li>

  <c:if test="${sessionScope.loginUser != null}">
    <c:if test="${sessionScope.loginUser.managerYn == 'Y'}">
    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
      관리자
    </div>

    <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
           aria-expanded="true" aria-controls="collapseUtilities">
          <span>자원관리</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
             data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" onclick="location.href='/resource?menuCode=R001&resourceLocation=한남'">자원조회</a>
            <a class="collapse-item" onclick="location.href='/resource/add'">자원등록</a>
          </div>
        </div>
      </li>



      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
           aria-expanded="true" aria-controls="collapsePages">
          <span>사용자관리</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" onclick="location.href='/adm/user?userName=&department='">사용자 조회</a>
            <a class="collapse-item" onclick="location.href='/adm/user/add'">사용자 등록</a>
          </div>
        </div>
      </li>
    </c:if>
  </c:if>
</ul>
<!-- End of Sidebar -->
