<#include "../../../common/freemarker/include_header.ftl">
<body>
<form name="form_item" action="exam_exam_complete_task.do" method="post">
<input type="hidden" value="<#if rhs.method?exists >${rhs["method"]}</#if>" name="method" />
<input type="hidden" value="<#if rhs["task"]?exists >${rhs["task"].id}</#if>" name="taskId" />
<div class="panel panel-primary" style="margin-top: 18px;">
      <div class="panel-heading"><strong>Start Exam</strong></div>
      <div class="panel-body">
      <div id="timeshow" style="left:1px;top:1px;width:250px;height:20px;line-height:20px;text-align:center;font-size:12px;color:#000;background-color:#CCC;border:1px solid #333;"></div> 
	<br />
      	<table class="table table-condensed table-bordered table-striped">
      		<tr><td colspan="8"><font color="red"><strong>
      			1. Do NOT press WIN button and ALT button, or the exam will commit automatic! <br/>
      			2. Do NOT CLOSE window before done the  exam, or the exam will commit automatic!
      			</strong></font>
      		</td>
      		</tr>
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
		  	<strong><@i18n "title_single" /></strong>(total:${rhs["template"].singlechoice + rhs["template"].rmdsinglechoice})
		  	<#list rhs["singleitems"]?sort_by("id") as singleitem>
				<tr>
					<td><strong>${singleitem_index+1}.&nbsp;${singleitem.content}</strong><div class="pull-right">&nbsp;&nbsp;&nbsp;Score:<#if singleitem.mark?exists&&singleitem.mark!="">${singleitem.mark}<#else>${rhs["paper"].singlechoicemark}</#if></div></td>
				<tr>
				<#list singleitem.choiceitem?sort_by("id") as choiceitem>
					<tr>
						<td><input type="radio" value="${choiceitem.refid}" name="result[${i}].answer"/> ${choiceitem.value}</td>
					</tr>
				</#list>
				<input type="hidden" value="${singleitem.id}" name="result[${i}].item.id" />
				<input type="hidden" value="<#if singleitem.mark?exists >${singleitem.mark}<#else>${rhs["paper"].singlechoicemark}</#if>" name="result[${i}].mark" />
				<#assign i = i + 1 > 
		  	</#list>
      	</table>
      	<#if (rhs["multiitems"] > 0) >
      	<table class="table table-condensed table-bordered table-striped">
	      	<strong><@i18n "title_multi" /></strong>(total:${rhs["template"].multichoice + rhs["template"].rmdmultichoice})
	      	<#list rhs["multiitems"]?sort_by("id") as multiitem>
	      		<tr>
					<td><strong>${multiitem_index+1}.&nbsp;${multiitem.content}</strong><div class="pull-right">&nbsp;&nbsp;&nbsp;Score:<#if multiitem.mark?exists&&multiitem.mark!="">${multiitem.mark}<#else>${rhs["paper"].multichoicemark}</#if></div></td>
				<tr>
				<#list multiitem.choiceitem?sort_by("id") as choiceitem>
					<tr>
						<td><input type="checkbox" value="${choiceitem.refid}" name="result[${i}].answer"/> ${choiceitem.value}</td>
					</tr>
				</#list>
				<input type="hidden" value="${multiitem.id}" name="result[${i}].item.id" />
				<input type="hidden" value="<#if multiitem.mark?exists>${multiitem.mark}<#else>${rhs["paper"].multichoicemark}</#if>" name="result[${i}].mark" />
				<#assign i = i + 1 > 
	      	</#list>
      	</table>
      	</#if>
      	<#if (rhs["blankitems"]?size > 0 )>
      	<table class="table table-condensed table-bordered table-striped">
	      	<strong><@i18n "title_blank" /></strong>(total:${rhs["template"].blank + rhs["template"].rmdblank})
	      	<#list rhs["blankitems"]?sort_by("id") as blankitem>
	      		<tr>
					<td><strong>${blankitem_index+1}.&nbsp;${blankitem.content}</strong><div class="pull-right">&nbsp;&nbsp;&nbsp;Score:<#if blankitem.mark?exists&&blankitem.mark!="">${blankitem.mark}<#else>${rhs["paper"].blankmark}</#if></div></td>
				<tr>
				<tr>
					<td><input type="text"  name="result[${i}].answer"/></td>
					<input type="hidden" value="${blankitem.id}" name="result[${i}].item.id" />
					<input type="hidden" value="<#if blankitem.mark?exists >${blankitem.mark}<#else>${rhs["paper"].blankmark}</#if>" name="result[${i}].mark" />
				</tr>
				<#assign i = i + 1 > 
	      	</#list>
      	</table>
      	</#if>
      	<#if (rhs["essayitems"]?size > 0) >
      	<table class="table table-condensed table-bordered table-striped">
	      	<strong><@i18n "title_essay" /></strong>(total:${rhs["template"].essay + rhs["template"].rmdessay})
	      	<#list rhs["essayitems"]?sort_by("id") as essayitem>
	      		<tr>
					<td><strong>${essayitem_index+1}.&nbsp;${essayitem.content}</strong><div class="pull-right">&nbsp;&nbsp;&nbsp;Score:<#if essayitem.mark?exists&&essayitem.mark!="">${essayitem.mark}<#else>${rhs["paper"].essaymark}</#if></div></td>
				<tr>
				<tr>
					<td><textarea name="result[${i}].answer"> </textarea></td>
					<input type="hidden" value="${essayitem.id}" name="result[${i}].item.id" />
					<input type="hidden" value="<#if essayitem.mark?exists>${essayitem.mark}<#else>${rhs["paper"].essaymark}</#if>" name="result[${i}].mark" />
				</tr>
				<#assign i = i + 1 > 
	      	</#list>
	    </table>
	    </#if>
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
	var warn=0;
	var interval;
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
		document.getElementById(timeShowId).innerHTML="Time Remain:"+Math.floor(TimeNum/60)+":"+TimeNum%60+""; 
} 
	$('#submitButton').click(function () {
		var btn = $(this);
		btn.button('loading');
		document.getElementsByName("form_item")[0].submit();
		//window.opener=null;
		opener.location.reload();
		window.close();
	});
	$(document).ready(function(){
     	ChangeTime();
	});
	document.oncontextmenu=function(){
    	alert('Can not use right mouse key!');
    	return false;
	}
	document.onkeydown=function(e){
	    e=e||event;
	    //alert(e.keyCode);//可查看各个按键的keyCode是多少
		//屏蔽F5刷新键
	    if(e.keyCode==116){
	        alert('Can not use F5!');
	        e.keyCode = 0;
	        return false;
	    }
		//屏蔽esc键
		if(e.keyCode == 27){
			alert('Can not use ESC！');
			e.keyCode = 0;
			 return false;
		}
		//屏蔽alt
		if(e.keyCode == 18){
			alert('Warning: Can not use ALT！Or the exam will be commited!');
			e.keyCode = 0;
			if(warn > 1){
				document.getElementsByName("form_item")[0].submit();
				window.close();
			}
			warn=warn+1;
			return false;
		}
		//屏蔽F11
		if(e.keyCode == 122){
			//alert('Can not use F11！');
			e.keyCode = 0;
			return false;
		}
		if((e.ctrlKey)&&(e.keyCode==78)){
			alert('Can not use Ctrl + N！');
			e.keyCode = 0;
			return false;
		}
		if((e.ctrlKey)&&(e.keyCode==67)){
			alert('Can not use Ctrl + C！');
			e.keyCode = 0;
			return false;
		}
		if((e.ctrlKey)&&(e.keyCode==65)){
			alert('Can not use Ctrl + A！');
			e.keyCode = 0;
			return false;
		}
		//屏蔽win键
		if(e.keyCode == 91){
			alert('Can not use Win button！');
			e.keyCode = 0;
			document.getElementsByName("form_item")[0].submit();
			 window.close();
			 return false;
		}
	}
    
    //当关闭窗口时提示是否提交考试 
    //window.onbeforeunload = function() {
        //return "Data has not been saved，CLOSE or SWITCH windows will auto commit the exam，continue?";       
    //}
    
    //窗口关闭后给出提示  
    window.onunload = function()  {
    	document.getElementsByName("form_item")[0].submit();
    }

	window.onfocus=function(){
		interval=window.setInterval("clipboardData.setData('text','')",100);
	} 
	function d(){
		window.clearInterval(interval);
		//window.close();
	}
	//为窗口注册失去焦点事件
    window.onblur = d;
</script>
