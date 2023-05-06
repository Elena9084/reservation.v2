const saveUseYn = (e, menuCode) => {
  console.log(e);
  const checkbox = e.target;
  console.log("checkbox: " + checkbox);
  const useYn = e.target.value;
  console.log("checkbox useYn: " + useYn);

  const menu = {
    menuCode : menuCode,
    useYn : useYn
  };

  $.ajax({
    type: "PATCH",
    url: "/menu",
    contentType : "application/json; charset=utf-8",
    dataType : "text",
    data : JSON.stringify(menu),
    success: function (data) {
      console.log("메뉴사용여부 변경 성공");
    },
    error: function (error) {
      console.log("메뉴사용여부 변경 실패");
    }
  });
}
