$(document).ready(function () {
  formEventListener($("#login-btn"), $("#login-div"));
  formEventListener($("#register-btn"), $("#register-div"));
});

var formEventListener = function (button, div) {
  button.on ( "click", function (event) {
    event.preventDefault();
    if (div.hasClass("hidden")) {
      div.removeClass("hidden");
      $("#search").addClass("hidden");
    } else {
      $("#search").removeClass("hidden");
      $("#login-div").addClass("hidden");
      $("#register-div").addClass("hidden");
    }
  })
};

var loginSubmitEventListener = function () {
  $('#submit-btn').on ("click", function (event) {
    event.preventDefault();

    $.ajax({
      url: "/sessions/login",
      type: "POST",
      data: $(this).parent().serialize()
    })
    .done( function( response ) {
      setupHeaderForm( response );
      logoutEventListener();
    })
    $("#login_user_form").find("input[type=text], input[type=password]").val("");
    $("#reg-float-div").addClass("hidden");
  });
};

var logoutEventListener = function () {
  $("#logout-btn").on ("click", function (event) {
    event.preventDefault();

    $.ajax({
      url: "/sessions/logout",
      type: "GET"
    })
    .done( function( response ) {
      setupHeaderForm( response );
      regFormEventListener();
    })

  });
};


var setupHeaderForm = function( response ) {
   var targetParentListener = $ ( "#header_login_register_div" );
   targetParentListener.empty();
   targetParentListener.append(response);
};
