<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <script src='/fullcalendar/dist/index.global.js'></script>
  <script src='/fullcalendar/packages/core/locales/ko.js'></script>


  <title>메인</title>

  <!-- Custom fonts for this template-->
  <link href="/bootstrap/css/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link
          href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- 캘린더 템플릿 script -->
  <script>

    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');

      var calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridDay'
        },
        initialDate: '2023-01-12',
        navLinks: true, // can click day/week names to navigate views
        selectable: true,
        selectMirror: true,
        // events : ,
        select: function(arg) {
          var title = prompt('용도');
          if (title) {
            calendar.addEvent({
              title: title,
              start: arg.start,
              end: arg.end,
              allDay: arg.allDay
            })
          }
          calendar.unselect()
        },
        eventClick: function(arg) {
          // 클릭하면 상세 페이지로 이동
          // move to detail page
          // jsp
          location.href = "detail.jsp?no=" + arg.event.id;
          if (confirm('Are you sure you want to delete this event?')) {
            arg.event.remove()
          }
        },
        editable: true,
        dayMaxEvents: true, // allow "more" link when too many events
        locale: "ko",
        events: [
          {
            title: 'All Day Event',
            start: '2023-01-01'
          },
          {
            title: 'Long Event',
            start: '2023-01-07',
            end: '2023-01-10'
          },
          {
            groupId: 999,
            title: 'Repeating Event',
            start: '2023-01-09T16:00:00'
          },
          {
            groupId: 999,
            title: 'Repeating Event',
            start: '2023-01-16T16:00:00'
          },
          {
            title: 'Conference',
            start: '2023-01-11',
            end: '2023-01-13'
          },
          {
            title: 'Meeting',
            start: '2023-01-12T10:30:00',
            end: '2023-01-12T12:30:00'
          },
          {
            title: 'Lunch',
            start: '2023-01-12T12:00:00'
          },
          {
            title: 'Meeting',
            start: '2023-01-12T14:30:00'
          },
          {
            title: 'Happy Hour',
            start: '2023-01-12T17:30:00'
          },
          {
            title: 'Dinner',
            start: '2023-01-12T20:00:00'
          },
          {
            title: 'Birthday Party',
            start: '2023-01-13T07:00:00'
          },
          {
            title: 'Click for Google',
            url: 'http://google.com/',
            start: '2023-01-28'
          }
        ]
      });

      calendar.render();
    });

  </script>
  <!-- 캘린더 style -->
  <style>

    body {
      padding: 0;
      font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
      font-size: 14px;
    }

    #calendar {
      max-width: 1100px;
      margin: 0 auto;
    }

    a{
      color: #06060b;
    }

  </style>

</head>
<!-- startbootstrap -->
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
  <%@ include file="common/sidebar.jsp" %>
  <div id="content-wrapper" class="d-flex flex-column">
    <!-- topbar -->
    <%@ include file="common/topbar.jsp" %>

    <!-- 내용 -->
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

</body>

</html>
