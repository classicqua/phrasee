$(function() {

  //利用規約への同意エラー表示スタイル調整
  error_block = $(".agreement  .help-inline");
  if(error_block){
  	$(".agreement").prepend(error_block);
  	error_block.css({"color":"#CD5C5C", "font-size":"small"});
  }
  
  
  
/* 任意項目聴取取りやめのためコメントアウト 2013.2.26

  $(document).on("click", ".reset_gender", function(e){
    $("#user_gender_1").prop("checked","");
    $("#user_gender_2").prop("checked","");
  });


  //性別リセットボタン押下時
  $(document).on("click", ".reset_gender", function(e){
    $("#user_gender_1").prop("checked","");
    $("#user_gender_2").prop("checked","");
  });

  // 郵便場号入力→住所検索
  $('#zip').zip2addr('#addr');

  // 住所＝日本以外を選んだときのイベント
  $("#user_country_id").change(function(e){
    var country = $(this).val();
    if(( country != "Japan" ) && ( country != "japan" ) && ( country != "日本" ) && ( country != "1" ) && ( country != 1 )){
      //alert(country);
    }
  });
*/
});