<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 2023-05-07
  Time: 오후 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>자원관리</title>
    <!-- 부트스트랩 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

    <!-- start부트스트랩 Custom 템플릿 -->
    <link href="/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- startbootstrap  Custom styles for this template-->
    <link href="/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- 내만 css -->
<%--    <link href="/css/menu/menu-list.css" rel="stylesheet" type="text/css">--%>

    <!-- 부트스트랩 css-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

</head>
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
    <%@ include file="../common/sidebar.jsp" %>
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- topbar -->
        <%@ include file="../common/topbar.jsp" %>

        <!-- 내용 시작 -->
        <div class="container" style="max-width: none; height: 100%;">

            <form method="get" action="/resource">
                <div class="h-25 filter-container">
                    <div class="date-search-container" style="clear: both;">
                        <div class="row">
                            <div class="col-lg-2 d-none d-lg-block">
                                <p style="font-weight: bold; text-align: center;">타입</p>
                            </div>
                            <div class="col-lg-9 col-sm-12">
                                <select class="form-select location-dropdown" id="menuCode" name="menuCode" aria-label="Default select example">
                                    <option value="R001" selected="<c:if test="${param.menuCode} eq 'R001' ">selected</c:if>">회의실</option>
                                    <option value="H001" selected="<c:if test="${param.menuCode} eq 'H001' ">selected</c:if>">헬스키퍼</option>
                                    <option value="C001" selected="<c:if test="${param.menuCode} eq 'C001' ">selected</c:if>">차량</option>
                                </select>
                            </div>
                            <div class="col-lg-1 d-none d-lg-block">
                            </div>
                        </div>
                        <div class="date-search-container" style="clear: both;">
                            <div class="row">
                                <div class="col-lg-2 d-none d-lg-block">
                                    <p style="font-weight: bold; text-align: center;">사옥</p>
                                </div>
                                <div class="col-lg-9 col-sm-12">
                                    <select class="form-select location-dropdown" id="resourceLocation" name="resourceLocation" aria-label="Default select example">
                                        <option value="한남" selected="<c:if test="${param.resourceLocation} eq '한남' ">selected</c:if>">한남</option>
                                        <option value="신사" selected="<c:if test="${param.resourceLocation} eq '신사' ">selected</c:if>">신사</option>
                                    </select>
                                </div>
                                <div class="col-lg-1 d-none d-lg-block">
                                </div>
                            </div>
                        </div>
                        <div class="search-btn" style="margin: 10px 0 0 6rem; width: 85%;">
                            <button class="btn btn-outline-secondary" style="width: 49.5%;" type="submit">조회</button>
                            <input class="btn btn-outline-secondary" type="button" style="width: 49.5%" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap" value="자원등록">
                        </div>
                    </div>
                </div>
            </form>


            <!-- 모달 버튼 -->
<%--            <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap" style="float: right; border: solid 1px #b5b5b5">등록</button>--%>
<%--            <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap" style="float: right; border: solid 1px #b5b5b5" onclick="loadNotice()">수정</button>--%>
            <form method="post" action="/resource" accept-charset="UTF-8">
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" style="max-width: 50rem;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">자원등록</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" name="noticeSeq" id="noticeSeq" class="notice-seq">
                                <div class="mb-3">
                                    <p class="modal-p">사용여부</p>
                                    <div class="modal-div">
                                        <div class="form-check">
                                            <input class="form-check-input" name="useYn" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="Y" checked>
                                            <label class="form-check-label" for="flexRadioDefault1">
                                                사용
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" name="useYn" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="N">
                                            <label class="form-check-label" for="flexRadioDefault2">
                                                사용안함
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3"  style="display: flex;">
                                    <p class="modal-p">사옥</p>
                                    <select class="form-select location-dropdown" name="resourceLocation" aria-label="Default select example" style="width: 85%">
                                        <option value="한남" selected="<c:if test="${param.resourceLocation} eq '한남' ">selected</c:if>">한남</option>
                                        <option value="신사" selected="<c:if test="${param.resourceLocation} eq '신사' ">selected</c:if>">신사</option>
                                    </select>
                                </div>
                                <div class="mb-3" style="display: flex;">
                                    <p class="modal-p">타입</p>
                                    <select class="form-select location-dropdown" name="menuCode" aria-label="Default select example" style="width: 85%">
                                        <option value="R001" selected="<c:if test="${param.menuCode} eq 'R001' ">selected</c:if>">회의실</option>
                                        <option value="H001" selected="<c:if test="${param.menuCode} eq 'H001' ">selected</c:if>">헬스키퍼</option>
                                        <option value="C001" selected="<c:if test="${param.menuCode} eq 'C001' ">selected</c:if>">차량</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <p class="modal-p">자원명</p>
                                    <input type="text" class="resource-name" name="resourceName" id="resourceName" style="display: inline-block; width: 38.5rem; height: 37px; border-radius: 5px; border: solid 1px #b5b5b5;">
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


            <div class="list-container h-75">
                <table class="table table-hover">
                    <colgroup>
                        <col style="width: 60%;"/>
                        <col style="width: 20%;"/>
                        <col style="width: 20%;"/>
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">자원명</th>
                        <th scope="col">수정</th>
                        <th scope="col">사용여부</th>
                    </tr>
                    </thead>
                    <tbody id="noticeList">
                    <c:if test="${resourceList != null}">
                        <c:forEach var="resource" items="${resourceList}" varStatus="status" >
                            <tr onClick="location.href='/resource?resCode=${resource.resourceCode}'">
                                <input value="${resource.resourceCode}" type="hidden">
                                <td>${resource.resourceName}</td>
                                <td><button type="button" class="btn modify-btn" style="border: solid 1px #dee2e6;  border-radius: 5px;" onclick="location.href='/menu/modify?menuCode=${resource.resourceCode}'">수정</button></td>
                                <td><input type="text" style="width : 3rem; height: 37px; border: solid 1px #dee2e6; border-radius: 5px; text-align: center;" value="${resource.useYn}" onclick="event.stopPropagation();" onchange="saveUseYn(event, '${resource.resourceCode}')"></td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    <c:if test="${resourceList == null || resourceList == ''}">
                        <tr>
                            <td colspan="3" style="text-align: center;">자원이 존재하지 않습니다.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- 내용 끝 -->

    </div>
</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

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
<script src="/js/resource/save-resource.js"></script>

</body>
</html>
