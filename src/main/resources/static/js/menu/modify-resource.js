const modifyResource = () => {
  console.log("modifyMenu.js 동작");
  // 메뉴
  const resourceCode = document.getElementById("modify-resource-code").value;
  const resourceName = document.getElementById("modify-resource-name").value;
  const location = document.getElementById("location-select").value;
  const type = document.getElementById("modify-type").value;
  const useYn = document.getElementsByClassName("modify-use-yn")[0].value;
  console.log("useYn", useYn);



  // menu객체 생성
  const resource = {
    resourceCode : resourceCode,
    resourceName : resourceName,
    resourceLocation : location,
    changeMenuCode : type,
    useYn : useYn
  }
  console.log("modify-resource : resource", resource);


  $.ajax({
    method : "PATCH",
    url : "/resource",
    data : JSON.stringify(resource),
    contentType : "application/json; charset=utf-8",
    dataType : "text",
    success : function (data) {
        alert("메뉴가 수정되었습니다.");
      document.location.reload();

    },
    error : function (e) {
      alert("메뉴 수정에 실패하였습니다.");
      console.log(e);
    }
  });


}


// 자원 수정모달 데이터 뿌리기
const loadModifyModal = (event) => {
  const resourceCode = event.target.parentElement.previousElementSibling.previousElementSibling.previousElementSibling.value
  console.log("loadModifyModal.js 동작 event.target : " + event.target);
  console.log("loadModifyModal.js 동작 resourceCode : " + resourceCode);

  $.ajax({
    method : "get",
    url : "/api/resource?resourceCode=" + resourceCode,
    success : function (data) {
      console.log("data", data);

      const resource = data;
      const resourceCode = resource.resourceCode;
      const resourceName = resource.resourceName;
      const resourceType = resource.menuCode;
      const resourceLocation = resource.resourceLocation;
      const useYn = resource.useYn;


      // const modal = document.getElementById("modify-resource-modal");
      const resourceCodeInput = document.getElementById("modify-resource-code");
      // resourceName
      const resourceNameInput = document.getElementById("modify-resource-name");
      // type
      const resourceTypeRoom = document.getElementById("modify-resource-location-r");
      const resourceTypeHealth = document.getElementById("modify-resource-location-h");
      const resourceTypeCar = document.getElementById("modify-resource-location-c");
      // location
      const resourceLocationHan = document.getElementById("modify-location-h");
      const resourceLocationSin = document.getElementById("modify-location-s");
      // useYn
      const useY = document.getElementById("modify-resource-use-y");
      const useN = document.getElementById("modify-resource-use-n");

      // useYn 라디오 버튼 활성화
      if(useYn === "Y"){
        useY.checked = true;
      }else if(useYn === "N"){
        useN.checked = true;
      }

      // location select 활성화
      if(resourceLocation === "한남"){
        resourceLocationHan.selected = true;
      } else if (resourceLocation === "신사"){
        resourceLocationSin.selected = true;
      }

      // type select 활성화
      if(resourceType === "R001"){
        resourceTypeRoom.selected = true;
      }else if (resourceType === "H001"){
        resourceTypeHealth.selected = true;
      }else if (resourceType === "C001"){
        resourceTypeCar.selected = true;
      }


      resourceCodeInput.value = resourceCode;
      resourceNameInput.value = resourceName;

    },
    error : function (e) {
      console.log(e);
    }
  });

}
