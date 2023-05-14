const reservationModify = () => {

  const reservationSeq = document.getElementsByName("reservationSeq")[0].value;
  const reservationStartDate = document.getElementsByName("reservationStartDate");
  const reservationEndDate = document.getElementsByName("reservationEndDate");
  const note = document.getElementsByName("note");

  const fullStartStr = reservationStartDate[0].value +  " " + reservationStartDate[1].value + ":00";
  const fullEndStr = reservationEndDate[0].value + " " + reservationEndDate[1].value + ":00";
  const fullStartDate = new Date(fullStartStr);
  const fullEndDate = new Date(fullEndStr);

  console.log("reservation js - reservationSeq, fullStartDate, fullEndDate, note", reservationSeq, fullStartDate, fullEndDate, note[0].value);

  const reservationModel = {
    "reservationSeq" : reservationSeq,
    "reservationStartDate" :fullStartDate,
    "reservationEndDate" : fullEndDate,
    "note" : note[0].value,
  };

  $.ajax({
    method : "PATCH",
    url : "/reservation",
    data : JSON.stringify(reservationModel),
    contentType : "application/json; charset=utf-8",
    dataType : "text",
    success : function (data) {
      alert("수정되었습니다.");
      location.href = "/myReservation";
    },
    error : function (e) {
      alert("수정 실패하였습니다.");
      console.log(e);
    }
  });


}
