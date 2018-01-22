$(document).ready(function(){ 
	$("#time").hide();
	$("#department").hide();
	$("#car").hide();
	function changeInput(){
		$("#time").show();
		$("#search-input").hide();
	}
	$("#sub-sch-menu").children().on("click",function(e){  
		// if($(e.target).attr("value")==3){
		// 	$("#time").show();
		// 	$("#search-input").hide(); 
		// }else{
		// 	$("#time").hide();
		// 	$("#time-start").val("");
		// 	$("#time-end").val("");
		// 	$("#search-input").show(); 
		// }
		var value=$(e.target).attr("value"); 
		switch(value){
			case "1":  
				$("#department").show();
				$("#time").hide();
				$("#car").hide();
				$("#search-input").hide();
				break;
			case "2": 
				$("#car").show();
				$("#time").hide();
				$("#department").hide();
				$("#search-input").hide();
				break;
			case "3":
				$("#time-start").val("");
				$("#time-end").val("");
				$("#time").show();
				$("#department").hide();
				$("#car").hide();
				$("#search-input").hide();
				break;
			default:
				$("#time").hide();
				$("#department").hide();
				$("#car").hide();
				$("#time-start").val("");
				$("#time-end").val("");
				$("#search-input").show();
				break;
		}
		avalon.scan();
	})
});