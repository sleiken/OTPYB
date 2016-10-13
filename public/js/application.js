$(document).ready(function () {
  regFormEventListener();
  loginSubmitEventListener();
  logoutEventListener();
});

var regFormEventListener = function () {
  $("#login-btn").on ( "click", function (event) {
    event.preventDefault();
    if ($("#reg-float-div").hasClass("hidden")) {
      $("#reg-float-div").removeClass("hidden");
    } else {
      $("#reg-float-div").addClass("hidden");
    }
  });
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
    })
    $("#reg-float-div").addClass("hidden");
    logoutEventListener();
  });
};

var logoutEventListener = function () {
  $("#logout-btn").on ("click", function (event) {
    event.preventDefault();

    $.ajax({
      url: "/sessions/logout",
      type: "DELETE"
    })
    .done( function( response ) {
      setupHeaderForm( response );
    })

    regFormEventListener();
  });
};


var setupHeaderForm = function( response ) {
   var targetParentListener = $ ( "#header_login_register_div" );
   targetParentListener.empty();
   targetParentListener.append(response);
};


// var headerLinkListener = function(link_class_name) {
//    $( "#header_container" ).on( "click", link_class_name, function( event ) {
//       event.preventDefault();
//
//       var link = $(this);
//
//       $.ajax({
//          method:  "GET",
//          url:     link.attr( 'href' )
//       })
//       .done( function( response ) {
//          setupHeaderForm( response );
//       })
//       .fail( function( response ){
//          alert("Failed to access " + link.attr( 'href' ));
//       });
//    });
// };
//
// var headerFormSubmitListener = function( form_id_name ) {
//    $( "#header_container" ).on( "submit", form_id_name, function( event ) {
//
//       event.preventDefault();
//
//       var form_id_name = $( this );
//
//       $.ajax({
//          method:  form_id_name.attr( 'method' ),
//          url:     form_id_name.attr( 'action' ),
//          data:    form_id_name.serialize()
//       })
//       .done( function( response ) {
//          setupHeaderForm( response );
//       })
//       .fail( function( response ){
//          alert( "Failed to " + form_id_name.attr( 'method' )
//                 + " to " + form_id_name.attr( 'action' ));
//       });
//    });
// };
