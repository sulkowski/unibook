//= require jquery
//= require bootstrap
//= require angular
//= require_self
//= require_tree .

function go(url) {
  document.location.href = url;
}

function switchLang(elem) {
  $("#pl").removeClass("active");
  $("#en").removeClass("active");
  $(elem).addClass("active");
}



$(function () {
    $('#myModal3').on('hidden.bs.modal', function () {
    go("./index.html");
  })
  $('#myModal2').on('hidden.bs.modal', function () {
    go("../index.html");
  })
});

