$(function() {
  $('#zip').zip2addr('#addr');
  
  $('#addr').change(function(e){
    var v = $('#addr').val();
    $(".search_result_address").text(v);
  });

/*
  var addr_handler = function(){
    AjaxZip3.zip2addr('zip01', '', 'pref01', 'addr01');
  };
  $("#zip01").change(addr_handler).keyup(addr_handler);
*/
});