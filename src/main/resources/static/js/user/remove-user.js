const removeUser = () => {
  const userId = document.getElementById("userId").value;
  console.log("btn value: " + userId);

  $.ajax({
    type: "delete",
    url: "/adm/user?userId="+userId,
    dataType: "text",
    success: function (data) {
      alert("사용자가 삭제되었습니다.");
      location.href = "/adm/user?userName=";
      console.log("사용자 삭제 성공");
    },
    error: function (error) {
      console.log("사용자 삭제 실패");
    }
  });
}
