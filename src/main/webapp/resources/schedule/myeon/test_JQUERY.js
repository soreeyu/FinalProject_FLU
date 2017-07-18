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
		var formData = new FormData();
		 //첫번째 파일태그
		formData.append("schedulefile",$("input[name=schedulefile]")[0].files[0]);
		alert(title+contents+starttime+endtime+email+partName);
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
			var starttimeStr=starttime.toString();
			var endtimeStr=endtime.toString();
			$.ajax({
				url : '/flu/schedule/unitWrite',
				type : 'POST',
				//dataType: 'JSON',
			    //data:  scheduleParam,
			    //contentType:"application/json; charset=UTF-8",
				processData: false,
				contentType: false,
				data: {
					unitName:title,
					unitDescribe:contents,
					unitStartDate:starttimeStr,
					unitFinishDate:endtimeStr,
					email:email,
					partName:partName,
					schedulefile:formData
					
				},
				
				success : function(response){
					alert(response);
					//writeModal.hide();
					//$('iframe[id!=scheduleFrame]').remove();
					//$('#title').val('');
					//$('#contents').val('');
					//$('#schcalendar').fullCalendar('refetchEvents');
					//$('#schedulefileName').html('');
					//var date = new Date();
		    		//spicker.select(date.getFullYear(),date.getMonth()+1,date.getDate());
		    		//epicker.select(date.getFullYear(),date.getMonth()+1,date.getDate());
				},
				error: function(request,status,error){
					  alert("에러 부들 code:"+request.status+"\n"+"error:"+error);
				}
			});
		}
		
		//$("#unitFrm").attr("action",getContextPath()+'/schedule/unitWrite');
		//$("#unitFrm").submit();
	});
	
	
	$('#writeClose').click(function(){
		//$('#schedulefileName').html('');
		writeModal.hide();
		//$('iframe[id!=scheduleFrame]').remove();
	});
	
	$('#schcalendar').fullCalendar({
		header: {
			left: ' ',
			center: 'prev title next',
			right: 'today,month'//'today,month,basicWeek,basicDay'
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
		events: [{
	        id: 'All Day Event',
	        title: 'All Day Event',
	        start: new Date()
	    }, {
	        id: 'popo',
	        title: 'popo',
	        start: new Date('2017-07-20'),
	        //end:   '2014-11-05T12:30:00',
	        description: 'This is a cool event 테슷흐',
	        color: 'rgb(142, 67, 163)',
	        textColor: 'orange'
	    }, {
	        id: 'test2',
	        title: 'test2',
	        url: 'http://google.com/',
	        start: new Date('2017-07-30'),
	    }],
	   eventClick: function(calEvent, jsEvent, view) {

	        alert('Event: ' + calEvent.title);
	        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY); // 화면 좌표인듯
	        alert('View: ' + view.name);

	        // change the border color just for fun
	        $(this).css('border-color', 'red');
	        
	        
	        if(event.url) {
                alert(event.title + "\n" + event.url, "wicked", "width=700,height=600");
                window.open(event.url);
                return false;
            }


	    },
	    dayClick: function(date) {
			//scheduleParam = {seq : 0, title : '', contents : '', starttime : date.getTime(), endtime : date.getTime(), writer:''};
			//$('#title').val(scheduleParam.title);
			//$('#contents').val(scheduleParam.contents);
			spicker.select(date.getFullYear(),date.getMonth()+1,date.getDate());
			epicker.select(date.getFullYear(),date.getMonth()+1,date.getDate());
			//$('#etcYn').attr('checked',false);
			writeModal.show();
			//editorInit('contents');
	    }
	});
	
	getPartList(66);
    $('#schcalendar').fullCalendar('addEventSource',[{
        id: '젠장젠장',
        title: '제발좀 되라',
        start: new Date('2017-07-30'),
        end: new Date('2017-08-12')
    }]);
});