// 날짜와 시간을 쪼개서 value 값으로 넣어줘야 한다.
window.onload = function () {
  const startDateTime = document.getElementsByClassName('start-date')[0].value;
  const endDateTime = document.getElementsByClassName('end-date')[0].value;

  const startDate = new Date(startDateTime); // 문자열 값을 Date 객체로 변환
  const endDate = new Date(endDateTime); // 문자열 값을 Date 객체로 변환


  const year = startDate.getFullYear();
  const month = startDate.getMonth() + 1;
  const day = startDate.getDate();
  const hour = startDate.getHours();
  const minute = startDate.getMinutes();


  const endYear = endDate.getFullYear();
  const endMonth = endDate.getMonth() + 1;
  const endDay = endDate.getDate();
  const endHour = endDate.getHours();
  const endMinute = endDate.getMinutes();

  console.log(year, month, day, hour, minute);

  const startDateFormat =`${year}-${(month < 10 ? "0" : "") + month}-${(day < 10 ? "0" : "") + day} ${(hour < 10 ? "0" : "") + hour}:${(minute < 10 ? "0" : "") + minute}`;
  const endDateFormat =`${endYear}-${(month < 10 ? "0" : "") + endMonth}-${(day < 10 ? "0" : "") + endDay} ${(hour < 10 ? "0" : "") + endHour}:${(minute < 10 ? "0" : "") + endMinute}`;



// 날짜와 시간을 각각 저장
  console.log(startDateFormat);
  console.log(endDateFormat);
  // console.log(startTimeString);

// 예약일 input 요소에 날짜를 설정
  const startDateTimeInput = document.querySelector('.start-date');
  startDateTimeInput.value = startDateFormat;

// 예약일 input 요소에 시간을 설정
  const endDateTimeInput = document.querySelector('.end-date');
  endDateTimeInput.value = endDateFormat;

}
