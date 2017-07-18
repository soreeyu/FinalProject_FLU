/**
 * 
 */

$(function(){
	
	$('#starttime').val(spicker.getFormat());
	$('#endtime').val(epicker.getFormat());
	
	
	$('#writeBtn').click(function(){
		alert('글쓰기클릭');
		//oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
		var title = $('#title').val();
		var contents = $('#contents').val();
		var starttime = $('#starttime').val();
		var endtime = $('#endtime').val();
		var email = $('.email').val();
		var partName = $('.partName').val();
		
		//빈칸 등록해야함
		if(trim(title) == '' || trim(title) == '<p>&nbsp;</p>'){
			alert('제목을 입력하세요');
			$('#title').val('');
			$('#title').focus();
		}
		else if(trim(contents) == '<p>&nbsp;</p>' || trim(contents) == ''){
			alert('내용을 입력하세요');
			$('#contents').val('');
			$('#contents').focus();
		}else{
			/*
			var realnames = '';
			var subnames = '';
			$('#schedulefileName').find('span').each(function(){
				var isRealName = ($(this).attr('realname')!='' && $(this).attr('realname')!=null && $(this).attr('realname')!='undefined');
				if( isRealName ){
					realnames += $(this).attr('realname');
					realnames +=',';
				}
				if(isRealName && $(this).attr('subname')!='' && $(this).attr('subname')!=null && $(this).attr('subname')!='undefined'){
					subnames += $(this).attr('subname');
					subnames +=',';
				}
			});*/
			scheduleParam.unitName=title;
			scheduleParam.unitDescribe=contents;
			scheduleParam.unitStartDate = starttime;
			scheduleParam.unitFinishDate = endtime;
			
			var url = getContextPath()+'/schedule/unitWrite';
			//if(scheduleParam.seq > 0){
			//	url = getContextPath()+'/schedule/unitUpdate';
			//}
			//scheduleParam.realnames = realnames;
			//scheduleParam.subnames = subnames;
			//alert('url= '+url);
			$.ajax({
				url : '/flu/schedule/unitWrite',
				type : 'POST',
				//dataType: 'JSON',
			    //data:  scheduleParam,
			    //contentType:"application/json; charset=UTF-8",
				data: {
					unitName:title,
					unitDescribe:contents,
					unitStartDate:starttime,
					unitFinishDate:endtime,
					email:email,
					partName:partName
					
				},
				
				success : function(response){
					alert(response);
					writeModal.hide();
					//$('iframe[id!=scheduleFrame]').remove();
					//$('#title').val('');
					//$('#contents').val('');
					//$('#schcalendar').fullCalendar('refetchEvents');
					//$('#schedulefileName').html('');
					var date = new Date();
		    		spicker.select(date.getFullYear(),date.getMonth()+1,date.getDate());
		    		epicker.select(date.getFullYear(),date.getMonth()+1,date.getDate());
				},
				error: function(request,status,error){
					  alert("에러 부들 code:"+request.status+"\n"+"error:"+error);
				}
			});
		}
		
		//$("#unitFrm").attr("action",getContextPath()+'/schedule/unitWrite');
		//$("#unitFrm").submit();
	});
	
	$('#schcalendar').fullCalendar({
		header: {
			left: ' ',
			center: 'prev title next',
			right: 'today,month,basicWeek,basicDay'
		},
		titleFormat: {
			month: 'yyyy년 MMMM',
			week: "yyyy년 MMMM d[yyyy]{'일 ~ '[mmm] dd일'}",
			day: "yyyy년 MMM d dddd"
		},
		monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNames : ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
		dayNamesShort : ['일','월','화','수','목','금','토'],
		allDayText : '금일일정',
		minTime : 9,
		maxTime : 19,
		axisFormat : "HH:mm",
		editable: false,
		events: function(start, end, callback) {
	       /* $.ajax({
	            url: getContextPath()+"/schedule/test",
	            dataType: 'json',
	            data: {
	            	syear:start.getFullYear(),
		        	smonth:start.getMonth()+1,
		        	eyear:end.getFullYear(),
		        	emonth:end.getMonth()+1
	            },
	            success: function(response) {
	            	getPayDay();
	                var events = [];
	                for(var i = 0 ; i < response.length ; i ++){
	                	var color;
	                	var textColor;
	                	var borderColor;
	                	events.push({
	                        title: response[i].title,
	                        start: new Date(response[i].starttime),
	                        end : new Date(response[i].endtime),
	                        seq : response[i].seq,
	                        allDay: (new Date(response[i].starttime).getHours()<8 || new Date(response[i].end).getHours()>19),
	                        color : color,
	                        textColor : textColor,
	                        borderColor:borderColor
	                    });
	                }
	                callback(events);
	            },
	            error : function(response,txt){
	            	location.href = "";//getContextPath()+"/common/error.do?error="+txt;
	            }
	        });*/
	    },
	    eventClick: function(calEvent, jsEvent, view) {/*
	    	if(calEvent.seq != null){
	    		
	    		$.getJSON(getContextPath()+"/home/scheduleFiles.do",{seq:calEvent.seq},function(response){
	    			var files;
	    			files = response;
	    		
			    	$.getJSON(getContextPath()+"/home/getSchedule.do",{seq:calEvent.seq},function(response){
			    		var article = response;
				    	var sdate = new Date(article.starttime);
						var stime = sdate.getFullYear() + "년 " + (sdate.getMonth()+1) + "월 " + sdate.getDate() + "일";
						var edate = new Date(article.endtime);
						var etime = edate.getFullYear() + "년 " + (edate.getMonth()+1) + "월 " + edate.getDate() + "일";
						var fileHtml = '<div class="notify" style="margin-top:5px;">';
						for(var i = 0 ; i < files.length ; i ++){
							fileHtml += '&nbsp;&nbsp;<a href="javascript:scheduleFileDown('+files[i].seq+')">' + files[i].realname +'</a>&nbsp;&nbsp;';
						}
						fileHtml += '</div>';
						$("#modal-contents").html('<div class="label label-red" style="min-width:300px;">' + stime + ' ~ ' + etime + '</div><br><div class="notify contents-view" style="margin-top:5px;">' + article.contents +'</div>'+fileHtml);
						if(article.isWriter == 'true'){
							scheduleParam = {seq : article.seq,title : article.title, contents : article.contents, starttime : article.starttime, endtime : article.endtime, etcYn : article.etcYn, files:files};
							var updateBtn = $('<a/>', {
											    href: '#',
											    name: 'updateBtn',
											    id: 'updateBtn',
											    html: '수정',
											    addClass : 'btn btn-gray btn-small',
											    onclick: 'javascript:contentsUpdate();'
											});
							var deleteBtn = $('<a/>', {
											    href: '#',
											    name: 'deleteBtn',
											    id: 'deleteBtn',
											    html: '삭제',
											    addClass : 'btn btn-gray btn-small',
											    onclick: 'javascript:contentsDelete('+article.seq+');'
											});
							var closeBtn = $('<a/>', {
											    href: '#',
											    name: 'closeBtn',
											    id: 'closeBtn',
											    html: 'Close',
											    addClass : 'btn btn-gray btn-small',
											    onclick: 'javascript:modal.hide();'
											});
							
							$('#contentsBtn').html( updateBtn[0].outerHTML +  deleteBtn[0].outerHTML +  closeBtn[0].outerHTML);
						}else{
							var closeBtn = $('<a/>', {
							    href: '#',
							    name: 'closeBtn',
							    id: 'closeBtn',
							    html: 'Close',
							    addClass : 'btn btn-gray btn-small',
							    onclick: 'javascript:modal.hide();'
							});
			
							$('#contentsBtn').html( closeBtn[0].outerHTML);
						}
						$("#modal-title").html(article.title + '<span style="float:right;">'+article.writer+'</span>');
						modal.show();
			    	}).fail(function(jqxhr, textStatus, error){
						 var err = textStatus + ", " + error;
						 console.log( "Request Failed: " + err );
						 location.href=getContextPath()+'/common/error.do?code='+textStatus;
					});
	    		});
	    	}*/
	    },
	    dayClick: function(date) {
			scheduleParam = {seq : 0, title : '', contents : '', starttime : date.getTime(), endtime : date.getTime(), writer:''};
			$('#title').val(scheduleParam.title);
			$('#contents').val(scheduleParam.contents);
			spicker.select(date.getFullYear(),date.getMonth()+1,date.getDate());
			epicker.select(date.getFullYear(),date.getMonth()+1,date.getDate());
			$('#etcYn').attr('checked',false);
			writeModal.show();
			//editorInit('contents');
	    }
	});
});