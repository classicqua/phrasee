$(function() {

  // 郵便場号入力→住所検索
  $('#zip').zip2addr('#addr');

  // 住所＝日本以外を選んだときのイベント
  $("#user_country_id").change(function(e){
    var country = $(this).val();
    if(( country != "Japan" ) && ( country != "japan" ) && ( country != "日本" ) && ( country != "1" ) && ( country != 1 )){
      //alert(country);
    }
  });
});