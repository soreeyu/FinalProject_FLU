var sessionCheker = null;
var scheduleParam = {};
var imagepath = "/flu/resources/images";
var oEditors = [];
var vo = { 
			url:'/flu/home/employee.do', 
			id:'Employee', 
			seq : "seq", 
			name : "이름", 
			phone : "전화번호", 
			email : "메일주소"
	};
//데이터군요



/**
 * 스케줄 첨부파일 다운로드
 */
function scheduleFileDown(seq){
	var url = '/flu/home/scheduledownload.do';
	var inputs = '<input type="hidden" name="seq" value="'+seq+'"/>';
	$('<form action="'+ url +'" method="post">'+inputs+'</form>').appendTo('body').submit().remove();
}

/**
 *스케줄 첨부파일 삭제 
 */
function scheduleFileDelete(subname){
	if(confirm('해당파일을 삭제하시겠습니까?')){
		$.ajax({
			url : '/flu/home/scheduleFileDelete.do',
			data : {name : subname},
			type : 'post',
			success:function(response){
				response = JSON.parse(response);
				if(response.isDel){
					alert('삭제되었습니다.');
					$('span[subname='+subname+']').parent().remove();					
				}else{
					alert('삭제실패.');
				}
			}
		});
	}
}

/**
 * 스마트에디터설정
 */
function editorInit(id){
	/*nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: id,
		sSkinURI: "/flu/resources/SE/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
			fOnBeforeUnload : function(){
				//alert("완료!");
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});*/
}

/**
 * 트림함수
 */
function trim(str){
	//return str.replace(new RegExp(' ','g'),'');
}
/**
 * Home 호출함수
 */
function getJSON(vo,param){
	var parentVo = vo;
	var nextVo = vo.nextVo;
	$.getJSON(parentVo.url,param).done(function(response){
		var results = response;
		var bodyDiv = $('.'+parentVo.id + '-container');
		if(!bodyDiv[0]){
			bodyDiv = document.createElement("div");
			$(bodyDiv).addClass( parentVo.id + '-container' );
			$(bodyDiv).css('margin-top','5px');
			$('#main_Home').append(bodyDiv);
		}
		$(bodyDiv).hide();
		$(bodyDiv).html('');
		for(var i = 0 ; i < results.length ; i ++){
			var result = results[i];
			var div = document.createElement("div");
			$(bodyDiv).append(div);
			var spans = new Array();
			for(var key in parentVo){
				if(key == 'id'){
					var span = document.createElement("span");
					$(span).text( eval('parentVo.'+key));
					$(span).css('color','blue');
					$(span).css('font-weight','bold');
					spans.push(span);
				}
				if( key != 'seq' && key != 'url' && key != 'isChild' && key != 'id' && key != 'nextVo' ){
					var span = document.createElement("span");
					$(span).html( eval('parentVo.'+key) + ' : <font>' + eval('result.'+key) + '</font>' );
					spans.push(span);
				}
			}
			
			userTree.append({ email: result.email , title : result.name+"("+result.email+")", name:result.name});
			
			var br = document.createElement("br");
			$(div).html(spans[0].outerHTML + br.outerHTML + spans[1].outerHTML + br.outerHTML + spans[2].outerHTML + br.outerHTML + spans[3].outerHTML );
			$(div).addClass( parentVo.id + ' navbar' );
			$(div).css('cursor','pointer');
			$(div).css('width','97%');
			$(div).css('line-height','18px');
			$(div).attr('seq',result.seq);
			$(div).attr('clicked',"false");
			$(div).attr('name',result.name);
			$(div).attr('phone',result.phone);
			$(div).attr('email',result.email);
			$(div).css('opacity','0.5').mouseover(function(){
				$(this).css('opacity','1');
			}).mouseout(function(){
				$(this).css('opacity','0.5');
			}).click(function(){
				var $obj = $(this);
				if($obj.attr('clicked') == "false"){
					$obj.addClass('clicked');
					$obj.addClass('clicked notify-red');
					$obj.attr('clicked','true');
					$('.'+parentVo.id).each(function(){
						if(!$(this).is($obj)){
							$(this).hide();
						}
					});
					$obj.animate({width:'385px'},800,function(){
						if(nextVo){
							getJSON(nextVo,{url: '/flu/home/userArticle.do', seq:$obj.attr('seq')});							
						}else{
							refrashRow(userArticle, {param:{page : 1, email : $obj.attr('email')}, url: '/flu/home/userArticle.do'});
							$('#work-name').text($obj.attr('name'));
							$('#work-email').attr('href','#');
							$('#work-email').attr('id','write-mail');
							$('#selectUser').val($obj.attr('email'));
							$('#mailTo').text($('#selectUser').val());
							$('.user-work').slideDown('slow');
						}
					});
				}else{
					$obj.attr('clicked','false');
					while(nextVo){
						$('.'+nextVo.id + '-container').html('');
						nextVo = nextVo.nextVo;
					}
					nextVo = parentVo.nextVo;
					$('.user-work').slideUp('slow',function(){
						$obj.animate({width:'97%'},800,function(){
							$('.'+parentVo.id).each(function(){
								$(this).removeClass('clicked');
								$(this).removeClass('notify-red');
								$(this).show();
							});
						});
					});
				}
			});
		}
		$(bodyDiv).slideDown('slow');
	}).fail(function(jqxhr, textStatus, error){
		 var err = textStatus + ", " + error;
		 console.log( "Request Failed: " + err );
		 location.href='/flu/common/error.do?code='+textStatus;
	});	
}

/**
 * 스케줄 수정함수
 */
function contentsUpdate(){
	modal.hide();
	var contents = scheduleParam.contents;
	$('#title').val(scheduleParam.title);
	$('#contents').val(contents);
	var sdate = new Date(scheduleParam.starttime);
	var edate = new Date(scheduleParam.endtime);
	spicker.select(sdate.getFullYear(),sdate.getMonth()+1,sdate.getDate());
	epicker.select(edate.getFullYear(),edate.getMonth()+1,edate.getDate());
	if(scheduleParam.etcYn == 'N'){
		$('#etcYn').attr('checked',true);
	}else{
		$('#etcYn').attr('checked',false);
	}
	$('#schedulefileName').html('');
	var files = scheduleParam.files;
	for(var i = 0 ; i < files.length ; i ++){
		var html = $('#schedulefileName').html();
		var span = document.createElement('span');
		$(span).text(files[i].realname);
		$(span).attr('subname',files[i].subname);
		//$('#schedulefileName').html(html + '<span>&nbsp;' +  span.outerHTML + '<i class="icon-trashcan icon-small" style="cursor:pointer;" onclick="scheduleFileDelete(\''+trim(files[i].subname)+'\')"></i></span>');
	}
	writeModal.show();
	editorInit('contents');
}

/**
 * 스케줄 삭제함수
 */
function contentsDelete(seq){
	if(confirm('삭제 하시겠습니까?')){
		$.post('/flu/home/scheduleDelete.do', {seq:seq}, function(data, textStatus) {
			var result = data;
			if(result.resultCnt > 0){
				alert('삭제 완료');
				$('#schcalendar').fullCalendar('refetchEvents');
				modal.hide();
			}else{
				alert('삭제 실패');
			}
		},"json").fail(function(jqxhr, textStatus, error){
			 var err = textStatus + ", " + error;
			 console.log( "Request Failed: " + err );
			 location.href='/flu/common/error.do?code='+textStatus;
		});
	}
}













