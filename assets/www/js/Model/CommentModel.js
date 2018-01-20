/**
 * 评价控制类，主要用于控制菜品的评价
 *  1，菜品评价提交
 */
 var Comment = Common.extend({
 	init:function(){
 		this.commentUrl="http://"+SERVER+"/"+ProName+"/Comment"; ;
 	},
 	commiteComment:function(data){
 		var dealComment=function(result){
		result="评价成功";
			modelCon.showAlert(true,result);
			$('#comment').hide();
		}
		commentObj.ajaxRequest(data,dealComment);
 	},
 	ajaxRequest:function(data,dealComment){
 		this._super(data,commentObj.commentUrl,dealComment);
 	}
 });