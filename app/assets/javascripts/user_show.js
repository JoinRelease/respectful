$( document ).on('ready page:load page:change page:partial-load', function(event) {
  // $("#user-tabs").steps({
  //   headerTag: "h4",
  //   bodyTag: ".tab",
  //   transitionEffect: "slideLeft",
  //   enableFinishButton: false,
  //   enablePagination: false,
  //   enableAllSteps: true,
  //   titleTemplate: "#title#",
  //   cssClass: "tabcontrol",
  //   onInit: function () {
  //     $.get( "/users/registration" );
  //   }
  // });
  //$( "#user-tabs" ).tabs();
  var $tabs = $('#user-tabs').tabs();
  // if($("#user-tabs") && document.location.hash){
  //   $.scrollTo("#user-tabs");
  // }
  $.get( "/user/registration" );




});
