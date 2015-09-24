var LeadsController = Paloma.controller('Admin/Leads');

LeadsController.prototype.index = function(){

  //doesn't work!
  $('#lead-upgrade-submit').click(function(){
    $('#action-submit').html('<i class="fa fa-circle-o-notch fa-spin"></i>');
  })
};
