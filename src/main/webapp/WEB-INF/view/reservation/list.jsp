<%@ page import="com.reservation.v2.csm.model.ReservationModel" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- 부트스트랩 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">


    <!-- 캘린더 템플릿 -->
    <script src='/fullcalendar/dist/index.global.js'></script>
    <script src='/fullcalendar/packages/core/locales/ko.js'></script>


    <title>예약 현황</title>

    <!-- startbootstrap Custom fonts for this template-->
    <link href="/bootstrap/css/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- startbootstrap  Custom styles for this template-->
    <link href="/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/style.css">

    <!-- 캘린더 템플릿 script -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {

            const calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                initialDate: new Date(), // 초기 로딩 날짜.
                navLinks: true, // can click day/week names to navigate views
                selectable: true,
                selectMirror: true,
                //한국어 설정
                locale: 'ko',
                // 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용..
                select: function(arg) {
                    console.log(arg);
                    console.log(<fmt:parseDate var="startDate" value="${arg.startStr}" pattern="yyyy-MM-ddTHH:mm:ss"/>);
                    console.log(<fmt:parseDate var="endDate" value="${arg.endStr}" pattern="yyyy-MM-ddTHH:mm:ss"/>);

                    location.href="/reservation/add?reservationStartDate="+ arg.startStr +"&reservationEndDate="+ arg.endStr + "&reservationLocation=${param.resourceLocation}&resourceCode=${resourceCode}";

                    calendar.unselect();
                },
                eventClick: function(arg) {
                    // 있는 일정 클릭시,
                    console.log("#등록된 일정 클릭#");
                    console.log(arg.event);

                    location.href="/reservation/detail?reservationCode=${arg.id}"
                },
                editable: true,
                dayMaxEvents: true, // allow "more" link when too many events
                events:function(info, successCallback, failureCallback){
                    // const resourceCode = document.getElementById('resourceCode').value;

                    // ajax 처리로 데이터를 로딩 시킨다.
                    $.ajax({
                        type:"get",
                        url:"/reservation/list?resourceLocation=${param.resourceLocation}&menuCode=${param.menuCode}&resourceCode=${param.resourceCode}",
                        dataType:"json",
                        success: function(data) {
                            console.log(data);
                            successCallback(data);
                        }
                    });
                }
            });
            calendar.render();
        });

    </script>
</head>
<!-- startbootstrap -->
<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">
    <%@ include file="../common/sidebar.jsp" %>
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- topbar -->
        <%@ include file="../common/topbar.jsp" %>
        <!-- 내용 -->

        <input type="hidden" value="${param.resourceLocation}" id="resource-location" name="resourceLocation">
        <input type="hidden" value="${param.menuCode}" id="menu-code" name="menuCode">
        <h5 class="title-wrapper" style="padding-top: 10px; font-weight: bold;" >${param.resourceLocation} ${menuName}</h5>
        <div class="select-wrapper">
            <select class="form-select location-dropdown modify-type" id="resource-code" aria-label="Default select example" style="width: auto; height: 30px; border: solid 1px darkgray; border-radius: 4px;" onchange="calendarLoad()">
                <c:forEach items="${resourceList}" var="resource">
                    <option value="${resource.resourceCode}" id="modify-resource-location-r"  <c:if test="${param.resourceCode eq resource.resourceCode}">selected</c:if> >${resource.resourceName}</option>
                </c:forEach>
            </select>
        </div>
        <div id="calendar-container">
            <div id='calendar'></div>
        </div>


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

<!-- Core plugin JavaScript-->
<script src="/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/bootstrap/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/bootstrap/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="/bootstrap/js/demo/chart-area-demo.js"></script>
<script src="/bootstrap/js/demo/chart-pie-demo.js"></script>

<script src="/js/reservation/calendar-load.js"></script>

</body>

</html>
