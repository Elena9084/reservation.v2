const modifyMenu = () => {
  console.log("modifyMenu.js 동작");
  // 메뉴
  const menuCode = document.getElementsByClassName("menu-code")[0].value;
  const menuName = document.getElementsByClassName("menu-name")[0].value;
  const location = document.getElementById("location-select");

  // 상세항목 -> list
  const resourceCode = document.getElementsByClassName("resource-code");
  const resourceName = document.getElementsByClassName("resource-name");
  const resourceSort = document.getElementsByClassName("resource-sort");
  const resourceUseYn = document.getElementsByClassName("resource-use-yn");

  // 사용자입력항목 -> lsit
  const formItemSeq = document.getElementsByClassName("form-item-seq");
  const formItemTitle = document.getElementsByClassName("form-item-title");
  const formItemType = document.getElementsByClassName("form-item-type");

  // for문 사용해서 값들을 객체에 저장해야 됨
  const resourceList = [];
  const formItemList = [];

  for(let i = 0; i < resourceCode.length; i++){
    resourceList.push({
      resourceCode: resourceCode[i].value,
      resourceName : resourceName[i].value,
      resourceSort : resourceSort[i].value,
      useYn : resourceUseYn[i].value
    });
  }
  console.log("formItem.js 동작 resourceList", resourceList);

  for(let i = 0; i < formItemSeq.length; i++){
    console.log("modifyMenu.js 동작");
    formItemList.push({
      formItemSeq: formItemSeq[i].value,
      formItemTitle : formItemTitle[i].value,
      formItemType : formItemType[i].value
    });
  }
  console.log("formItem.js 동작 formItemList", formItemList);
  console.log("location", location.value);

  // menu객체 생성
  const menu = {
    menuCode : menuCode,
    menuName : menuName,
    location : location.value,
    resourceList : resourceList,
    formItemList : formItemList
  }
  console.log("menu", menu);


  $.ajax({
    method : "PATCH",
    url : "/menu",
    data : JSON.stringify(menu),
    contentType : "application/json; charset=utf-8",
    dataType : "text",
    success : function (data) {
        alert("메뉴가 수정되었습니다.");
        location.href= "/menu?menuCode=" + menuCode;
    },
    error : function (e) {
      alert("메뉴 수정에 실패하였습니다.");
      console.log(e);
    }
  });


}
