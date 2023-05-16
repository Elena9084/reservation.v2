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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
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

<style>
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

        <!-- 내용 시작 -->
        <div class="container" style="max-width: none; height: 100%;">
            <c:if test="${success eq null and success eq ''}">
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                <strong>Holy guacamole!</strong> You should check in on some of those fields below.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            </c:if>

            <form method="get" action="/resource">
                <div class="filter-container"  style="height: 200px;">
                    <div class="date-search-container" style="clear: both;">
                        <div class="row">
                            <div class="col-lg-2 d-none d-lg-block">
                                <p style="font-weight: bold; text-align: center;">타입</p>
                            </div>
                            <div class="col-lg-9 col-sm-12">
                                <select class="form-select location-dropdown" id="menuCode_select" name="menuCode" aria-label="Default select example">
                                    <c:forEach items="${menuMap}" var="menu">
                                        <option value="${menu.key}" <c:if test="${param.menuCode eq menu.key}">selected</c:if> >${menu.value}</option>
                                    </c:forEach>
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
                                        <option value="한남" <c:if test="${param.resourceLocation eq '한남'}">selected</c:if>>한남</option>
                                        <option value="신사" <c:if test="${param.resourceLocation eq '신사'}">selected</c:if>>신사</option>
                                        <option value="공용" <c:if test="${param.resourceLocation eq '공용'}">selected</c:if>>공용</option>
                                    </select>
                                </div>
                                <div class="col-lg-1 d-none d-lg-block">
                                </div>
                            </div>
                        </div>
                        <div class="search-btn-container">
                            <button class="btn btn-outline-dark filter-btn" style="width: 49.5%;" type="submit">조회</button>
                            <input class="btn btn-outline-dark filter-btn" type="button" style="width: 49.5%" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap" value="자원등록"> <!-- 모달 버튼 -->
                        </div>
                    </div>
                </div>
            </form>


            <!-- 등록 모달 -->
            <form method="post" action="/resource" accept-charset="UTF-8">
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" style="max-width: 50rem;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">자원등록</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
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
                                <div class="row">
                                    <div class="col-lg-2 d-none d-lg-block">
                                        <p class="modal-p">사옥</p>
                                    </div>
                                    <div class="col-lg-10 col-sm-12">
                                        <select class="form-select location-dropdown" name="resourceLocation" aria-label="Default select example">
                                            <option selected>사옥선택</option>
                                            <option value="한남">한남</option>
                                            <option value="신사">신사</option>
                                            <option value="공용">공용</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-lg-2 d-none d-lg-block">
                                        <p class="modal-p">타입</p>
                                    </div>
                                    <div class="col-lg-10 col-sm-12">
                                        <select class="form-select location-dropdown" name="menuCode" aria-label="Default select example">
                                            <option selected>타입선택</option>
                                            <option value="R001">회의실</option>
                                            <option value="H001">헬스키퍼</option>
                                            <option value="C001">차량</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-lg-2 d-none d-lg-block">
                                        <p class="modal-p">자원명</p>
                                    </div>
                                    <div class="col-lg-10 col-sm-12">
                                        <input type="text" class="resource-name" name="resourceName" placeholder="자원명 입력" style="height: 37px; width: 100%; border-radius: 5px; border: solid 1px #b5b5b5;">
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


            <div class="list-container h-75">
                <table class="table table-hover">
                    <colgroup>
                        <col style="width: 5%;"/>
                        <col style="width: 85%;"/>
                        <col style="width: 10%;"/>
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">자원명</th>
                        <th scope="col">수정</th>
                    </tr>
                    </thead>
                    <tbody id="noticeList">
                    <c:if test="${resourceList != null}">
                        <c:forEach var="resource" items="${resourceList}" varStatus="status" >
                            <tr>
                                <input value="${resource.resourceCode}" type="hidden">
                                <td>${status.count}</td>
                                <td>${resource.resourceName}</td>
                                <td><button type="button" class="btn modify-btn" style="border: solid 1px #dee2e6;  border-radius: 5px;"  data-bs-toggle="modal" data-bs-target="#exampleModal1" data-bs-whatever="@getbootstrap" onclick="loadModifyModal(event)">수정</button></td>
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

        <!-- 수정 버튼 -> ajax -->
        <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="max-width: 50rem;">
                <div class="modal-content" id="modify-modal">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel1">자원수정</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <p class="modal-p">사용여부</p>
                            <div class="modal-div">
                                <div class="form-check">
                                    <input type="hidden" id="modify-resource-code">
                                    <input class="form-check-input modify-use-yn" name="modifyUseYn" type="radio" name="flexRadioDefault" id="modify-resource-use-y" value="Y">
                                    <label class="form-check-label" for="modify-resource-use-y">
                                        사용
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input modify-use-yn" name="modifyUseYn" type="radio" name="flexRadioDefault" id="modify-resource-use-n" value="N">
                                    <label class="form-check-label" for="modify-resource-use-n">
                                        사용안함
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2 d-none d-lg-block">
                                <p class="modal-p">사옥</p>
                            </div>
                            <div class="col-lg-10 col-sm-12">
                                <select class="form-select location-dropdown modify-location" id="location-select" name="resourceLocation" aria-label="Default select example">
                                    <option value="한남" id="modify-location-h">한남</option>
                                    <option value="신사" id="modify-location-s">신사</option>
                                    <option value="공용" id="modify-location-c">공용</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-lg-2 d-none d-lg-block">
                                <p class="modal-p">타입</p>
                            </div>
                            <div class="col-lg-10 col-sm-12">
                                <select class="form-select location-dropdown modify-type" id="modify-type" aria-label="Default select example">
                                    <option value="R001" id="modify-resource-location-r">회의실</option>
                                    <option value="H001" id="modify-resource-location-h">헬스키퍼</option>
                                    <option value="C001" id="modify-resource-location-c">차량</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-lg-2 d-none d-lg-block">
                                <p class="modal-p">자원명</p>
                            </div>
                            <div class="col-lg-10 col-sm-12">
                                <input type="text" class="resource-name" name="resourceName" id="modify-resource-name" placeholder="자원명 입력" style="height: 37px; width: 100%; border-radius: 5px; border: solid 1px #b5b5b5;">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn" onclick="modifyResource()" style="border-color: #b5b5b5">수정완료</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- 모달 끝 -->
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
<script src="/js/menu/save-resource.js"></script>
<script src="/js/menu/modify-resource.js"></script>

</body>
</html>
