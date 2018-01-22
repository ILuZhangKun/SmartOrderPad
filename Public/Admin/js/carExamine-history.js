$("#time-end").hide();
function changeInput(){
	$("#time-end").show();
	$("#search-input").hide();
}
$("#sub-sch-menu").children().on("click",function(e){  
	if($(e.target).attr("value")==2){
		$("#time-end").show();
		$("#search-input").hide(); 
	}else{
		$("#time-end").hide();
		$("#search-input").show(); 
	}
})