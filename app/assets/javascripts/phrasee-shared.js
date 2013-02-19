/*
  各ページ共通で使う部品についてのjs
**/
$(function(){
  
  // disabledのボタンアクションをクリックしたらキャンセル
  $(document).on("click", ".disabled", function(e){
    prevent(e); //ダブルクリック防止
  });

  // フレーズ投稿・検索ボタンクリック時のイベント
  $(document).on("click", ".post-phrase, .search-phrase", function(e){
    $(this).addClass("disabled"); //ダブルクリック防止
  });
});

