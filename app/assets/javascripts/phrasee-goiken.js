$(function(){

  // submitボタン
  $(document).on("click",  ".post_goiken_button", function(e){
    //prevent(e);
    var body = jQuery.trim( $(".goiken_text").val() );
    if(!body){
      alert("何か書いてからボタンを押してください。");
      return false;
    }
/*
	$.ajax({
		url: '/goiken/create',
		type: "POST",
		cache: false,
		data: body,
		processData: false,
		contentType: false,
		beforeSend:function( xhr ){
			xhr.setRequestHeader("If-Modified-Since", "Thu, 01 Jun 1970 00:00:00 GMT");
		},
		success: function (res) {
			$(".goiken_box").html('<div class="thanks_for_goiken muted"><p>ご意見ありがとうございました。</p><p>今後ともよろしくお願いいたします。</p></div>');
		},
		error : function(){	
			//$(".goiken_box").html("送信失敗")
		}
	});
*/
  });
});

