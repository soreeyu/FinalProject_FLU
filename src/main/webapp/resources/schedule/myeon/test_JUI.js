/**
 * 
 */

var modal;
var sviewModal;
var writeModal;
var datepicker;
var spicker;
var epicker;
var userPaging;
var userTree;


/**
 * JUI 영역
 */
jui.ready(function(ui, uix, _) {
	
	
	modal = ui.modal("#modal", {
		color: "black",
		target: ".main_section"
	});
	
	
	writeModal = ui.modal("#writeModal", {
		color: "black",
		target: ".main_section"
	});
	
	datepicker = ui.datepicker("#datepicker", {
	    titleFormat: "yyyy년 MM월",
	    format: "yyyy/MM/dd",
	    event: {
	       select: function(date, e) {
	    	   //refrashRow(scheduleArticle,{url: '/flu/home/scheduleArticle.do', param:{page : 1, today : date}});
	       },
	       prev: function(e) {
	       },
	       next: function(e) {
	       }
	    }
	});
	
	spicker = ui.datepicker("#spicker", {
	    titleFormat: "yyyy년 MM월",
	    format: "yyyy/MM/dd",
	    event: {
	       select: function(date, e) {
	    	   if(spicker.getTime() > epicker.getTime()){
					var sdate = new Date(spicker.getTime());
		    		epicker.select(sdate.getFullYear(),sdate.getMonth()+1,sdate.getDate());
		    		$('#starttime').val(date);
				}else{
					$('#starttime').val(date);
				}
	       },
	       prev: function(e) {
	    	   var sdate = new Date(spicker.getTime()-(1000*60*60*24*30));
    		   spicker.select(sdate.getFullYear(),sdate.getMonth()+1,sdate.getDate());
	       },
	       next: function(e) {
	    	   var sdate = new Date(spicker.getTime()+(1000*60*60*24*30));
    		   spicker.select(sdate.getFullYear(),sdate.getMonth()+1,sdate.getDate());
	       }
	    }
	});

	epicker = ui.datepicker("#epicker", {
	    titleFormat: "yyyy년 MM월",
	    format: "yyyy/MM/dd",
	    event: {
	       select: function(date, e) {
	    	   if(spicker.getTime() > epicker.getTime()){
	    		alert("종료일이 시작일보다 빠릅니다.");
	    		var sdate = new Date(spicker.getTime());
	    		epicker.select(sdate.getFullYear(),sdate.getMonth()+1,sdate.getDate());
	    	   }else{
	    	   	$('#endtime').val(date);
	    	   }
	       },
	       prev: function(e) {
	    	   var edate = new Date(epicker.getTime()-(1000*60*60*24*30));
	    		epicker.select(edate.getFullYear(),edate.getMonth()+1,edate.getDate());
	       },
	       next: function(e) {
	    	   var edate = new Date(epicker.getTime()+(1000*60*60*24*30));
	    		epicker.select(edate.getFullYear(),edate.getMonth()+1,edate.getDate());
	       }
	    }
	});
	
});



