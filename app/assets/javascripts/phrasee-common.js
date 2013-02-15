/*****************************************/
// IE対策
/*****************************************/
//デフォルト動作キャンセル
var prevent = function(e) 
{
	if(e.preventDefault)
		e.preventDefault();
	else
		e.returnValue = false;
}