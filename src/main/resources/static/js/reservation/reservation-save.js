const reservationSave = () =>{

  const resourceCode = document.getElementsByName("resourceCode")[0].value;
  const reservationStartDate = document.getElementsByName("reservationStartDate");
  const reservationEndDate = document.getElementsByName("reservationEndDate");
  const inputContent = document.getElementsByName("inputContent");
  const formItemSeq = document.getElementsByName("formItemSeq");

  const fullStartDate = reservationStartDate[0].value +  " " + reservationStartDate[1].value + ":00";
  const fullEndDate = reservationEndDate[0].value + " " + reservationEndDate[1].value + ":00";
  console.log("reservation js - resourceCode, fullStartDate, fullEndDate, inputContent, formItemSeq", resourceCode, fullStartDate, fullEndDate, inputContent[0], formItemSeq[0]);

  const userInputList = [];

  for(let i = 0; i < inputContent.length; i++){
    // console.log("inputContent : " + i/*nputContent[i].value);
    // console.log("formItemSeq : " + fo*/rmItemSeq[i].value);
    userInputList.push({
      inputContent : inputContent[i].value,
      inputSort : i+1,
      formItemSeq : formItemSeq[i].value
    });
  }
  console.log("userInputList : " + userInputList);

  const reservation = {
    "resourceCode" : resourceCode,
    "reservationStartDate" : fullStartDate,
    "reservationEndDate" : fullEndDate,
    "userInputList" : userInputList
  };

  $.ajax({
    method : "POST",
    url : "/reservation",
    data : JSON.stringify(reservation),
    contentType : "application/json; charset=utf-8",
    dataType : "text",
    success : function (data) {
      alert("예약되었습니다.");
      location.href = "/reservation/list";
    },
    error : function (e) {
      alert("예약 실패하였습니다.");
      console.log(e);
    }
  });
}
