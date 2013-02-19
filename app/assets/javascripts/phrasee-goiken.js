$(function(){

  // submitボタン
  $(document).on("click",  ".post_goiken_button", function(e){
    //prevent(e);
    $(this).addClass("disabled"); //ダブルクリック防止
    var body = jQuery.trim( $(".goiken_text").val() );
    if(!body){
      alert("何か書いてからボタンを押してください。");
      $(this).removeClass("disabled"); //解除
      return false;
    }
  });
});

