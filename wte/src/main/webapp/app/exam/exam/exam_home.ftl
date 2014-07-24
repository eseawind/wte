<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_exam.ftl">
<style type="text/css">
.table th {
	background-color: #fff;
	text-align: center;
}
.table-bordered>tbody>tr>td {
	text-align: center;
}
.table-hover>tbody>tr:hover>th {
	background-color: #fff;
}
.table-hover>tbody>tr:hover>td {
	background-color: #CAEAFA;
}
.table-bordered>thead>tr>th, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>tbody>tr>td, .table-bordered>tfoot>tr>td {
	border: 1px solid #bce8f1;
	vertical-align: middle;
}
</style>
<script type="text/javascript" src="<@context_module/>exam.js"></script>
<div class="exam-frame">
	<div style="margin-bottom:5px;">
		<img style="vertical-align: text-bottom;" src="common/images/e_note_orange.png" />
		<span style="padding-left:5px; font-size:18px; color:#C6C6C6;">Notice</span>
	</div>
	<div class="alert alert-warning">
		<p>1. You can take an examination through <strong>Exam Information List</strong>.</p>
		<p>2. You can check all examinations which you had taken through <strong>Exam History List</strong>.</p>
	</div>
</div>

<div class="exam-frame">
	<div style="margin-bottom:5px;">
		<img style="vertical-align: text-bottom;" src="common/images/e_paper_blue.png" />
		<span style="padding-left:5px; font-size:18px; color:#C6C6C6;">Exam Information</span>
	</div>
	<div class="alert alert-info">
		<div class="panel-body" id="exam_table">
  			<#include "ajax_exam_list.ftl">
        </div>
	</div>
</div>

<script>
	function isIE() { //ie?  
    	if (!!window.ActiveXObject || "ActiveXObject" in window)  
        	return true;  
    	else  
        	return false;  
	}
	function   toFull(url){
		if(!isIE()){
			alert("Please starting exam in IE!");
			return false;
		}
	  if(window.name=="fullscreen")
	  	return; 
	  var a =window.open(url,"fullscreen","fullscreen=1,scrollbars=yes");
	}
	
	function   showMissExam(url){
	  if(window.name=="fullscreen")
	  	return; 
	  var a =window.open(url,"fullscreen","fullscreen=0,scrollbars=yes,height=300,width=400");
	}
	
	$(document).ready(function(){
		<#list rhs["oatasklist"] as item>
			<#if item.obj?exists>
				setInterval("getstarttime('${item.task.id}')",30000);
			</#if>
		</#list>
	});
	
	function getstarttime(taskid){
		$.ajax({
			type : "POST",
			url : "exam_exam_getstarttime.do",
			data : "taskid=" + taskid,
			cache : false,
			success : function(html) {
				document.getElementById("starttime_" + taskid).innerHTML = html;
			}
		});
	}
	
</script>

<div class="exam-frame">
	<div style="margin-bottom:5px;">
		<img style="vertical-align: text-bottom;" src="common/images/e_history_blue.png" />
		<span style="padding-left:5px; font-size:18px; color:#C6C6C6;">Exam History</span>
	</div>
	<div class="alert alert-info">
		<div class="panel-body" id="history_table">
			<#include "ajax_history_list.ftl">
  		</div>
	</div>
</div>

<div id="div_scoll" style="margin-left:150px;margin-top:-350px; cursor:hander;position:absolute;width:400px;z-index:10000;display:none;" class="panel panel-default"><!--style="border:2px solid #eee;"-->
	<div id="operation_title" class="panel-heading"><strong>Log</strong></div>
	<a class="pull-right" onclick="show_dir();" class="btn btn-xs  btn-default" ><span class=ui-icon ui-icon-close></span></a>
	<div class="panel-body" id="div_select_item" style="cursor:hander;"></div>
</div>

<script>
$(function() {$( "#div_scoll" ).draggable();});  
	function showresult(paperid){
		var resultstyle = $("#"+paperid).attr("style");
		if(resultstyle.indexOf("none") < 0){
			$("#"+paperid).attr("style","display:none;");
		}else{
			$("#"+paperid).attr("style","display:");
		}
	
	}
	function  show_dir(){  //定位层
	  if( document.getElementById('div_scoll').style.display=='none'){
	  	document.getElementById('div_scoll').style.display='block';
	  }else{
	    document.getElementById('div_scoll').style.display='none';
	  }
	}
	function showlog(taskid,paperid,userid){
		$('#div_scoll').attr("style","margin-left:450px;margin-top:50px; cursor:hander;position:absolute;width:400px;z-index:10000;display:block;");
		$.ajax({
			type : "POST",
			url : "exam_exam_showlog.do",
			data : "taskid=" + taskid + "&paperid=" + paperid + "&userid=" +userid,
			cache : false,
			success : function(html) {
				document.getElementById("div_select_item").innerHTML = html;
			}
		});
	}
	
</script>
