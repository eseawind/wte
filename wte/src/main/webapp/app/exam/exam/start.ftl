<#include "../../../common/freemarker/include_header.ftl">
<body>
<form name="form_item" action="exam_exam_complete_task.do" method="post">
<input type="hidden" value="<#if rhs.method?exists >${rhs["method"]}</#if>" name="method" />
<input type="hidden" value="<#if rhs["task"]?exists >${rhs["task"].id}</#if>" name="taskId" />
<div class="panel panel-primary" style="margin-top: 18px;">
      <div class="panel-heading"><strong>Start Exam</strong></div>
      <div class="panel-body">
      	<table class="table table-condensed table-bordered table-striped">
      	<tr><td colspan="8"><font color="red"><strong>考试中请勿关闭浏览器，否则会导致考试失败</strong></font></td></tr>
      	<tr><td colspan="8"><div id="timeshow" style="left:1px;top:1px;width:250px;height:20px;line-height:20px;text-align:center;font-size:12px;color:#000;background-color:#CCC;border:1px solid #333;"></div></td></tr>
      		<tr>
      			<td><strong><@i18n "title_name" /></strong></td>
      			<td><#if rhs["paper"]?exists > ${rhs["paper"].name}</#if></td>
      			<td><strong><@i18n "title_examtime" /></strong></td>
      			<td><#if rhs["paper"]?exists > ${rhs["paper"].time}</#if></td>
      			<td><strong><@i18n "title_totalmark" /></strong></td>
      			<td><#if rhs["paper"]?exists > ${rhs["paper"].totalmark}</#if></td>
      			<td><strong><@i18n "title_passmark" /></strong></td>
      			<td><#if rhs["paper"]?exists > ${rhs["paper"].passmark}</#if></td>
      		</tr>
      	</table>
      	<#assign i = 0 >
  		<table class="table table-condensed table-bordered table-striped">
		  	<strong><@i18n "title_single" /></strong>(total:${rhs["template"].singlechoice + rhs["template"].rmdsinglechoice}, each: ${rhs["paper"].singlechoicemark})
		  	<#list rhs["singleitems"]?sort_by("id") as singleitem>
				<tr>
					<td><strong>${singleitem_index+1}.&nbsp;${singleitem.content}</strong></td>
				<tr>
				<#list singleitem.choiceitem?sort_by("id") as choiceitem>
					<tr>
						<td><input type="radio" value="${choiceitem.refid}" name="result[${i}].answer"/> ${choiceitem.value}</td>
					</tr>
				</#list>
				<input type="hidden" value="${singleitem.id}" name="result[${i}].item.id" />
				<input type="hidden" value="${rhs["paper"].singlechoicemark}" name="result[${i}].mark" />
				<#assign i = i + 1 > 
		  	</#list>
      	</table>
      	
      	<table class="table table-condensed table-bordered table-striped">
	      	<strong><@i18n "title_multi" /></strong>(total:${rhs["template"].multichoice + rhs["template"].rmdmultichoice}, each: ${rhs["paper"].multichoicemark})
	      	<#list rhs["multiitems"]?sort_by("id") as multiitem>
	      		<tr>
					<td><strong>${multiitem_index+1}.&nbsp;${multiitem.content}</strong></td>
				<tr>
				<#list multiitem.choiceitem?sort_by("id") as choiceitem>
					<tr>
						<td><input type="checkbox" value="${choiceitem.refid}" name="result[${i}].answer"/> ${choiceitem.value}</td>
					</tr>
				</#list>
				<input type="hidden" value="${multiitem.id}" name="result[${i}].item.id" />
				<input type="hidden" value="${rhs["paper"].multichoicemark}" name="result[${i}].mark" />
				<#assign i = i + 1 > 
	      	</#list>
      	</table>
      	<table class="table table-condensed table-bordered table-striped">
	      	<strong><@i18n "title_blank" /></strong>(total:${rhs["template"].blank + rhs["template"].rmdblank}, each: ${rhs["paper"].blankmark})
	      	<#list rhs["blankitems"]?sort_by("id") as blankitem>
	      		<tr>
					<td><strong>${blankitem_index+1}.&nbsp;${blankitem.content}</strong></td>
				<tr>
				<tr>
					<td><input type="text"  name="result[${i}].answer"/></td>
					<input type="hidden" value="${blankitem.id}" name="result[${i}].item.id" />
					<input type="hidden" value="${rhs["paper"].blankmark}" name="result[${i}].mark" />
				</tr>
				<#assign i = i + 1 > 
	      	</#list>
      	</table>
      	<table class="table table-condensed table-bordered table-striped">
	      	<strong><@i18n "title_essay" /></strong>(total:${rhs["template"].essay + rhs["template"].rmdessay}, each: ${rhs["paper"].essaymark})
	      	<#list rhs["essayitems"]?sort_by("id") as essayitem>
	      		<tr>
					<td><strong>${essayitem_index+1}.&nbsp;${essayitem.content}</strong></td>
				<tr>
				<tr>
					<td><textarea name="result[${i}].answer"> </textarea></td>
					<input type="hidden" value="${essayitem.id}" name="result[${i}].item.id" />
					<input type="hidden" value="${rhs["paper"].essaymark}" name="result[${i}].mark" />
				</tr>
				<#assign i = i + 1 > 
	      	</#list>
	    </table>
	    <table class="table table-condensed table-bordered table-striped">
	    	<tr>
      			<td><input type="button" class="btn btn-xs btn-info" value="Save" id="submitButton"/></td>
      		</tr>
	    </table>
      </div>
</div>
</form>
</body>
<script>
	$('#submitButton').click(function () {
		var btn = $(this);
		btn.button('loading');
		document.getElementsByName("form_item")[0].submit();
		window.close();
	});
	document.oncontextmenu=function(){
    	alert('禁止鼠标右键菜单!');
    	return false;
	}
	document.onkeydown=function(e){
	    e=e||event;
	    //alert(e.keyCode);//可查看各个按键的keyCode是多少
		//屏蔽F5刷新键
	    if(e.keyCode==116){
	        alert('禁止F5刷新!');
	        e.keyCode = 0;
	        return false;
	    }
		//屏蔽esc键
		if(e.keyCode == 27){
			alert('禁止ESC！');
			e.keyCode = 0;
			 return false;
		}
		//屏蔽alt
		if(e.keyCode == 18){
			alert('禁止ALT！');
			e.keyCode = 0;
			return false;
		}
		//屏蔽F11
		if(e.keyCode == 122){
			//alert('禁止F11！');
			e.keyCode = 0;
			return false;
		}
		if((e.ctrlKey)&&(e.keyCode==78)){
			alert('禁止Ctrl + N！');
			e.keyCode = 0;
			return false;
		}
	}
	//失去焦点后的动作
	function c(){  
        window.close();  
    }
	//为窗口注册失去焦点事件  
    window.onblur = c;
    
    //当关闭窗口时提示是否提交考试 
    window.onbeforeunload = function()  {  
        return "当前数据还没有保存，关闭、刷新或切换窗口会自动完成考试，是否继续?";       
    }
    
    //窗口关闭后给出提示  
    window.onunload = function(){
    	document.getElementsByName("form_item")[0].submit();
        alert("已成功提交考试！");  
    }
    var h=0; //设置考试时间(小时单位) 
	var m=1; //设置考试时间(分钟单位) 
	var timeShowId="timeshow"; //设置时间显示层ID 
	var TimeNum=h*60*60+parseInt(${rhs["paper"].time})*60; 
	var timeStr; 
	function ChangeTime(){ 
		TimeNum--; 
		if(TimeNum > 0){ 
			timeStr=setTimeout("ChangeTime()",1000); 
		}else{ 
			document.getElementsByName("form_item")[0].submit();
		} 
		document.getElementById(timeShowId).innerHTML="在线考试系统提示你的时间还剩"+Math.floor(TimeNum/60)+"分"+TimeNum%60+"秒"; 
	}
	$(document).ready(function(){
     	window.opener=null;
     	ChangeTime();
	});
</script>