const reservationSave = () =>{

  const resourceCode = document.getElementsByName("resourceCode")[0].value;
  const reservationStartDate = document.getElementsByName("reservationStartDate");
  const reservationEndDate = document.getElementsByName("reservationEndDate");
  const note = document.getElementsByName("note");

  const fullStartStr = reservationStartDate[0].value +  " " + reservationStartDate[1].value + ":00";
  const fullEndStr = reservationEndDate[0].value + " " + reservationEndDate[1].value + ":00";
  const fullStartDate = new Date(fullStartStr);
  const fullEndDate = new Date(fullEndStr);

  console.log("reservation js - resourceCode, fullStartDate, fullEndDate, note", resourceCode, fullStartDate, fullEndDate, note[0].value);

  const reservationModel = {
    "resourceCode" : resourceCode,
    "reservationStartDate" :fullStartDate,
    "reservationEndDate" : fullEndDate,
    "note" : note[0].value,
  };

  $.ajax({
    method : "POST",
    url : "/reservation",
    data : JSON.stringify(reservationModel),
    contentType : "application/json; charset=utf-8",
    dataType : "text",
    success : function (data) {
      alert("예약되었습니다.");
      location.href = "/reservation";
    },
    error : function (e) {
      alert("예약 실패하였습니다.");
      console.log(e);
    }
  });
}
