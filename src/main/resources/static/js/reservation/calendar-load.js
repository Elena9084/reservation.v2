const calendarLoad = () => {
  const resourceLocation = document.getElementById("resource-location").value;
  const menuCode = document.getElementById("menu-code").value;
  const resourceCode = document.getElementById("resource-code").value;
  console.log("resourceLocation, menuCode, resourceCode", resourceLocation, menuCode, resourceCode);

  $.ajax({
    method : "GET",
    url : "/reservation?resourceLocation="+resourceLocation+"&menuCode=" + menuCode + "&resourceCode=" + resourceCode,
    success : function (data) {
      location.href="/reservation?resourceLocation="+resourceLocation+"&menuCode=" + menuCode + "&resourceCode=" + resourceCode;
    }
  });

}
