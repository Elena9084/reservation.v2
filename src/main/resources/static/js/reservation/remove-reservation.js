const removeReservation = () => {
  const reservationSeq = document.getElementById("reservationSeq").value;
  console.log("reservationSeq", reservationSeq);

  $.ajax({
    method : "DELETE",
    url : "/reservation?reservationSeq=" + reservationSeq,
    success : function (data) {

      alert("예약이 취소되었습니다.");
      location.href = "/myReservation";
    }
  });

}
