var UsersController = Paloma.controller('Admin/Users');

UsersController.prototype.new = function(){

  $('.datepicker').datepicker({format: 'YYYY-MM-DD'});

  $( "#passing_name").keyup(function() {
    var value = $( this ).val();
    $( ".loved-one-name" ).text( value );
  }).keyup();

  $(".btn-maus").click(function(){
    $("#mausoleum-collapse").collapse('toggle');
    $("#maus-toggle").toggleClass('fa-plus-square').toggleClass('fa-minus-square');
  });

  $(".btn-cem").click(function(){
    $("#cem-collapse").collapse('toggle');
    $("#cem-toggle").toggleClass('fa-plus-square').toggleClass('fa-minus-square');
  });
  $(".btn-burial").click(function(){
    $("#burial-collapse").collapse('toggle');
    $("#burial-toggle").toggleClass('fa-plus-square').toggleClass('fa-minus-square');
  });
  $(".btn-cremation").click(function(){
    $("#cremation-collapse").collapse('toggle');
    $("#cremation-toggle").toggleClass('fa-plus-square').toggleClass('fa-minus-square');
  });
};

