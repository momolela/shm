//全局样式风格
var theme = 'metro';
//easyUI
function showErr(text) {
	$.messager.alert('错误',text,'error');
}
function showOk(text) {
	$.messager.show({
		title:'提示',
		msg: text,
		timeout:2000,
		showType:'slide',
		style:{
			right:'',
			top:document.body.scrollTop+document.documentElement.scrollTop,
			bottom:''
		}
	});
}
//JqWidgets显示通知信息 message--文本 template--类型（info、warning、success、error、mail、time）
function showInfo(message, template) {
	var ss = $("#messageNotification");
	if (ss.length == 0) {
		var messageDiv = $("<DIV id='messageNotification'><div id='messageText'></div></DIV>");
		$('body').append(messageDiv);
		$(messageDiv).jqxNotification({
			width : 400,
			position: 'top-left',
			opacity : 0.9,
			showCloseButton : false,
			autoOpen : false,
			animationOpenDelay : 800,
			autoClose : true,
			closeOnClick : false,
			autoCloseDelay : 2000,
			browserBoundsOffset: 20,
			template : "info"
		});
	}
	var ww = ($(window).width() - 400) / 2;
	$('.jqx-notification-container').css({
		"left" : ww + "px",
		"z-index" : 9999
	});
	if ($("#messageNotification")) {
		$("#messageNotification").jqxNotification("closeAll");
	}
	if (template == undefined || template == '') {
		$("#messageNotification").jqxNotification({
			template : 'info',
			autoClose : true,
			showCloseButton : false
		});
	}else {
		$("#messageNotification").jqxNotification({
			template : template,
			autoClose : true,
			showCloseButton : false
		});
	}
	$("#messageText").text(message);
	$("#messageNotification").jqxNotification("open");
}

//确认框  info---提示信息  ， callback---确认后回调函数
function delete_confirm(info, callback){
	var ww = $("#windowConfirm");
	if (ww.length == 0) {
		var windowDiv = $("<DIV id='windowConfirm'><div style='float:left'>" +
				"<img style='float:left;padding-left: 2px; margin-top: 1px;' src='"+basePath+"/commons/css/images/help.png'/>" +
				"&nbsp;<div style='float:left' id='confirmTitle'>确认</div></div>" +
				"<div style='position:relative;'><div id='confirmContent' style='margin-top: 15px;padding-left:18px;'></div>" +
				"<div style='position: absolute;bottom: 10px;right: 10px;'>" +
				"<input type='button' id='confirmok' value='确 定' style='margin-right: 10px' />" +
				"<input type='button' id='confirmcancel' value='取 消' />" +
				"</div></div></DIV>");
		$('body').append(windowDiv);
		$(windowDiv).jqxWindow({
			theme:theme,
			height: 145, 
			width: 270,
            resizable: false, 
            isModal: true, 
            modalOpacity: 0.3,
            cancelButton: $('#confirmcancel'),
            initContent: function () {
                $('#confirmok').jqxButton({ theme:theme, width: '65px' });
                $('#confirmcancel').jqxButton({ theme:theme, width: '65px' });
            }
		});

	}
	
	if(info==null){
		info = "删除是不可恢复的，确认要删除吗？";
	}
	$("#windowConfirm").find("#confirmContent").text(info);
	$("#windowConfirm").jqxWindow("open");
	$("#windowConfirm").find('#confirmok').focus();
	
	$('#confirmok').unbind("click");
	$('#confirmok').click(function(){
		callback();
		$("#windowConfirm").jqxWindow("close");
	})
}

//加载中
function loading(){
	var ld = $('#myLoading');
	if (ld.length == 0) {
		var ldDiv = $("<div id='myLoading'></div>");
		$('body').append(ldDiv);
		ldDiv.jqxLoader({ 
			theme: theme,
			isModal: true, 
			text: "",
			width: 100, 
			height: 60, 
			imagePosition: 'top' 
		});
	}
	$('#myLoadingModal').css('z-index', 998);
	$('#myLoading').jqxLoader('open');
}

//进度条
function progressBar(num, end, inter, fun){
	clearInterval(inter);
	var pb = $('#myProgressBar');
	if (pb.length == 0) {
		var pbDiv = $("<div style='margin: 5px auto;position: fixed;left: 40%;z-index: 18003;' id='myProgressBar'></div>");
		var modalDiv = $("<div class='my-window-modal' id='myPbModal'></div>");
		$('body').append(pbDiv);
		$('body').append(modalDiv);
		pbDiv.jqxProgressBar({ 
			theme: theme,
			animationDuration: 0, 
			showText: true, 
			template: "info", 
			width: 250, 
			height: 30,
			value: 0 
		});
		var dlDiv = $("<div class='delete-icon' style='position: absolute;width:16px;height:16px;right:3px;top:3px;'></div>");
		pbDiv.append(dlDiv);
		dlDiv.click(function(){
			pbDiv.hide();
			modalDiv.hide();
		})
	}else{
		if(num!=null){
			pb.val(num);
		}
		pb.show();
		$('#myPbModal').show();
	}
	var values = {};
    var addInterval = function (id, intervalStep) {
        values[id] = {value: num};
        values[id].interval = setInterval(function () {
            values[id].value++;
            if (values[id].value == 100) {
            	clearInterval(values[id].interval);
                $("#" + id).hide();
        		$('#myPbModal').hide();
                if(typeof(fun) == "function"){
                	fun();
                }
            }else if (values[id].value == end) {
                clearInterval(values[id].interval);
            }
            $("#" + id).val(values[id].value);
        }, intervalStep);
    }
    addInterval("myProgressBar", 20);
    return values["myProgressBar"].interval;
}

function hideProgressBar(inter){
	clearInterval(inter);
    $("#myProgressBar").hide();
    $('#myPbModal').hide();
}
