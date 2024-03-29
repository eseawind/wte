function additem(type,templateid) {
	var tagid = "";
	$("#div_select_item").html("Loading...");
	$("input:checkbox[name=knowledgevalue]:checked").each(function(i) {
		if (0 == i) {
			tagid = $(this).val();
		} else {
			tagid += ("," + $(this).val());
		}
	});
	if (tagid == "") {
		alert("Please select one category!");
		return false;
	}
	$("#operation_title").html("Add question" + "<a onclick='show_dir();' class='pull-right' ><span class='ui-icon-white ui-icon-close'></span></a>");
	$('#div_scoll').attr("style","margin-left:150px;margin-top:-350px; cursor:hander;position:absolute;width:700px;z-index:10000;display:block;");
	$.ajax({
		type : "POST",
		url : "exam_item_listbycondition.do",
		data : "knowledgesid=" + tagid + "&type=" + type + "&templateid=" + templateid,
		cache : false,
		success : function(html) {
			document.getElementById('div_select_item').innerHTML = html;
		}
	});
}

function getmaxitemcount(knowledgeid){
	var tagid = "";
	$("input:checkbox[name=knowledgevalue]:checked").each(function(i) {
		if (0 == i) {
			tagid = $(this).val();
		} else {
			tagid += ("," + $(this).val());
		}
	});
	//alert(tagid);
	$.ajax({
		type : "POST",
		url : "exam_paper_getmaxitem.do",
		data : "knowledgesid=" + tagid,
		cache : false,
		success : function(html) {
			var para = html.split(",");
			document.getElementById('maxsinglechoicecount').innerHTML = para[0];
			document.getElementById('maxmultichoicecount').innerHTML = para[1];
		}
	});
}

function action_item_admin(paperid, itemid, itemtype){
	var divid="";
	switch(itemtype){
	case 1:
		divid="reqsinglechoice";
		break;
	case 2:
		divid="reqmultichoice";
		break;
	case 3:
		divid="reqblank";
		break;
	case 4:
		divid="reqessay";
		break;
	}
	$.ajax({
		type : "POST",
		url : "exam_paper_addreqitem.do",
		data : "paperid=" + paperid + "&type=" + itemtype + "&itemid=" + itemid,
		cache : false,
		success : function(html) {
			document.getElementById(divid).innerHTML =  html;
			counttotalmark();
		}
	});
}

function ajax_show_item(url, data){
	$("#operation_title").text("View Question");
	$('#div_scoll').attr("style","margin-left:150px;margin-top:-350px; cursor:hander ;position:absolute; z-index:10000; display:block;");
	$("#div_select_item").html("Loading...");
	$.ajax({
		type : "POST",
		url : "exam_item_load.do",
		data : data,
		cache : false,
		success : function(html) {
			document.getElementById("div_select_item").innerHTML =  html;
		}
	});
}
function action_paper(url,para){
	  $.ajax({
	         type:"POST",
	         url: "exam_paper_"+url,
	         data:"id="+para,
	         cache: false,
	         success: function(html){
	        	 document.getElementById('div_paper_table').innerHTML=html;
	        	 executeScript(html);
	        	 tip_info(); 
	           }
	  });  
}
function checkvalue(obj,type){
	if(type == 1){
		var maxvalue = $("#maxsinglechoicecount").text();
	}else{
		var maxvalue = $("#maxmultichoicecount").text();		
	}
	obj.value=obj.value.replace(/[^\.\d]/g,'');
	if(obj.value.split('.').length>2){
		obj.value=obj.value.split('.')[0]+'.'+obj.value.split('.')[1]
	}
	if(parseInt(obj.value) > parseInt(maxvalue)){
		obj.value = maxvalue;
	}
}

function executeScript(html)
{
    var reg = /<script[^>]*>([^\x00]+)$/i;
    //对整段HTML片段按<\/script>拆分
    var htmlBlock = html.split("<\/script>");
    for (var i in htmlBlock) 
    {
        var blocks;//匹配正则表达式的内容数组，blocks[1]就是真正的一段脚本内容，因为前面reg定义我们用了括号进行了捕获分组
        if (blocks = htmlBlock[i].match(reg)) 
        {
            //清除可能存在的注释标记，对于注释结尾-->可以忽略处理，eval一样能正常工作
            var code = blocks[1].replace(/<!--/, '');
            try 
            {
                eval(code) //执行脚本
            } 
            catch (e) 
            {
            }
        }
    }
}
