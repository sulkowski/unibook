//= require jquery
//= require bootstrap
//= require angular
//= require select2
//= require_self
//= require_tree .


$(function() {
  $('[name=recipients]').select2({
    placeholder: 'One or more'
  });
});


function go(url) {
  document.location.href = url;
}

function switchLang(elem) {
  $("#pl").removeClass("active");
  $("#en").removeClass("active");
  $(elem).addClass("active");
}



$(function () {

  $('#login').click(function () {
    // alert($("#username").val());
    // && $('#password').val() == "1234"
    if($('#username').val() == "teacher") {
      $("#login-form").attr("action", "teacher");
    } else if ($('#username').val() == "student"){
      $("#login-form").attr("action", "student");
    }
  })
  $('#myModal3').on('hidden.bs.modal', function () {
    go("./index.html");
  });
  $('#myModal2').on('hidden.bs.modal', function () {
    go("../index.html");
  });
});
