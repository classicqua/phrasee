$(function(){

	// お気に入りボタンクリック時のイベント
  $(document).on("click", ".ph_favorite_button", function(e){
  	var icon_class = $(this).find("i").prop("class");
  	var button_text_add = "<i class='"+ icon_class +"'></i>" + " お気に入りに追加";
  	var button_text_del = "<i class='"+ icon_class +"'></i>" + " お気に入り追加済";
    $('.flash_msg').remove();
  	if( $(this).hasClass("active") ){ 
  	//お気に入りに追加したとき
  		$(this).addClass("btn-success").html(button_text_del);
      $(this).after("&nbsp;&nbsp;<small class='flash_msg alert-success'>&nbsp;お気に入りリストに追加しました！</small>");
  	} else { 
  	//お気に入りから削除したとき
  		$(this).removeClass("btn-success").html(button_text_add);
      $(this).after("&nbsp;&nbsp;<small class='flash_msg alert-info'>&nbsp;お気に入りリストから削除しました。</small>");
  	}
  });
});

