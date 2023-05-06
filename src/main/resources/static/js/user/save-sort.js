const saveSort = (e, menuCode) => {
  console.log(e);
  const inp = e.target;
  console.log("input: " + inp);
  const sort = e.target.value;
  console.log("정렬: " + sort);
  console.log("menuCode: " + menuCode);

  const menu = {
    menuCode : menuCode,
    menuSort : sort
  };

  console.log("menu: " + menu);

  $.ajax({
    method: "PATCH",
    url: "/menu",
    contentType : "application/json; charset=utf-8",
    dataType : "text",
    data : JSON.stringify(menu),
    success: function (data) {
      console.log("정렬 변경 성공");
    },
    error: function (error) {
      console.log(error);
      console.log("정렬 변경 실패");
    }
  });
}
