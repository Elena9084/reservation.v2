const saveManager = (e) => {
  console.log(e);
  const checkbox = e.target;
  console.log("checkbox: " + checkbox);
  const userId = e.target.value;
  console.log("checkbox value: " + userId);
  const managerYn = checkbox.checked ? 'Y' : 'N';

  $.ajax({
    type: "PATCH",
    url: "/adm/user/manager",
    dataType: "text",
    data: {
      userId: userId,
      managerYn: managerYn
    },
    success: function (data) {
      console.log("관리자 변경 성공");
    },
    error: function (error) {
      console.log("관리자 변경 실패");
    }
  });
}

const saveRegistration = (e) => {
  console.log(e);
  const checkbox = e.target;
  console.log("checkbox: " + checkbox);
  const userId = e.target.value;
  console.log("checkbox value: " + userId);
  const managerYn = checkbox.checked ? 'Y' : 'N';

  $.ajax({
    type: "PATCH",
    url: "/adm/user/manager",
    dataType: "text",
    data: {
      userId: userId,
      managerYn: managerYn
    },
    success: function (data) {
      console.log("관리자 변경 성공");
    },
    error: function (error) {
      console.log("관리자 변경 실패");
    }
  });
}
