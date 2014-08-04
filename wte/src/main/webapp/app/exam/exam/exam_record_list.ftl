<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_custom.ftl">
<style type="text/css">
.table th {
	background-color: #B1B3B4; 
	text-align: center;
	color: #fff;
}
.table-hover>tbody>tr:hover>th {
	background-color: #B1B3B4;
}
</style>
<script type="text/javascript" src="<@context_module/>exam.js"></script>
<div id="result_body" style="margin:5px;">
&nbsp;&nbsp;
<a class="btn btn-xs btn-custom" id="groupby"  href="#" onclick="javascript:groupby('user');" >Group by User</a>
<a href="#" onclick="javascript:groupby('paper');" class="btn btn-xs btn-custom">Group by Paper</a>
<a href="#" onclick="javascript:groupby('schedule');" class="btn btn-xs btn-custom">Group by Schedule</a>

<div class="panel panel-custom" style="margin-left:10px;" >
  <div class="panel-heading">
  	<strong>Exam History List</strong>
  </div>
  <div id="div_scoll" style="margin-left:150px; margin-top:-350px; cursor:hander;position:absolute;width:400px;z-index:10000;display:none;" class="panel panel-custom"><!--style="border:2px solid #eee;"-->
  	<div id="operation_title" class="panel-heading"><strong>Log</strong><a onclick='show_dir();' class='pull-right' ><span class='ui-icon-white ui-icon-close'></span></a></div>
	<div class="panel-body" id="div_select_item" style="cursor:hander;"> 
  	</div>
  </div>
  <div class="panel-body" id="div_exam_table">
<#if rhs["groupby"] == "paper" ||rhs["groupby"] == "user">
		<table class="table table-condensed table-bordered">
				<tr>
					<td width=25px><strong>#</strong></td>
					<td ><strong><@i18n "title_name" /></strong></td>
					<#--<td ><strong>User ID</strong></td>
					<td ><strong><@i18n "title_totalmark" /></strong></td>
					<td ><strong><@i18n "title_passmark" /></strong></td>
					-->
					<td><#if rhs["groupby"] == "paper" || rhs["groupby"] == "schedule">
						<#if rhs["export"]>
							<a href="exam_exam_export_user_record.do" class="btn btn-xs btn-custom" >Export to Excel</a>
						</#if>
					</#if></td>
					<#--<td ><strong><@i18n "title_result" /></strong></td>-->
					<#--<td ><strong><@i18n "title_remark" /></strong></td>-->
				</tr>
				<#assign index=1 />
				<#list rhs["datalist"]?keys as papername>
					<tr>
						<td>${index}</td>
						<td >${papername} <small><#if rhs["groupby"] == "user" >(<@i18n "title_totalmark" />:${rhs["datalist"][papername][0].paper.totalmark} <@i18n "title_passmark" />:${rhs["datalist"][papername][0].paper.passmark})</#if></small></td>
						
						
						<td>
						
							<#if rhs["groupby"] == "user" ><button onclick="javascript:showresult(<#if rhs["groupby"] == "user" >${rhs["datalist"][papername][0].paper.id}<#else>${rhs["datalist"][papername][0].id}</#if>);" class="btn btn-xs btn-custom " name="detail">Detail</button></#if>
						
						<#if rhs["export"]>
							<#if rhs["groupby"] == "user" ><a href="exam_exam_export_record.do?paperId=${rhs["datalist"][papername][0].paper.id}" class="btn btn-xs btn-custom" >Export to Excel</a>
							</#if>
						</#if>
						<#if rhs["groupby"] == "user" ><a href="exam_exam_show_answer.do?paperId=${rhs["datalist"][papername][0].paper.id}" class="btn btn-xs btn-custom" >View Each Question</a>
						</#if>
						</td>
					</tr>
					<#assign index=index+1 />
					<#if (rhs["datalist"][papername]?size > 0) >
					<tr id="<#if rhs["groupby"] == "user" >${rhs["datalist"][papername][0].paper.id}<#else>${rhs["datalist"][papername][0].id}</#if>" <#if rhs["groupby"] == "user" >style="display:none;"</#if>>
						<td colspan="5" style="padding:0;">
							<table class="table table-condensed table-bordered table-hover" style="background-color: #ebf2d9; width:100%; border:none;">
								<#assign i=1>
								<tr style="text-align: center;">
									<th style="border:none;"></th>
									<th style="border:none;"><strong>></strong></th>
									<#if rhs["groupby"] == "user" >
										<th style="border:none;"><strong>User ID</strong></th>
									</#if>
									<#if rhs["groupby"] == "paper" || rhs["groupby"] == "schedule">
											<th style="border:none;"><strong>Paper Name</strong></th>
									</#if>
									<th style="border:none;"><strong><@i18n "title_result" /></strong></th>
									<th style="border:none;"><strong><@i18n "title_time" /></strong></th>
									<th style="border:none;"></th>
								</tr>
								<#list (rhs["datalist"][papername]?sort_by("id"))?reverse as record>
									<tr style="text-align: center;">
										<td style="border-bottom: 1px solid #fff; border-top: none; border-left: none; border-right: none;"></td>
										<td style="border-bottom: 1px solid #fff; border-top: none; border-left: none; border-right: none;">${i}</td>
										<#--<td ></td><a href="exam_exam_exam_record_detail.do?paperId=${record.paper.id}&recordsId=${record.id}" ></a>-->
										<#if rhs["groupby"] == "user" >
											<td style="border-bottom: 1px solid #fff; border-top: none; border-left: none; border-right: none;">${record.userid}</td>
										</#if>
										<#if rhs["groupby"] == "paper" || rhs["groupby"] == "schedule">
											<td style="border-bottom: 1px solid #fff; border-top: none; border-left: none; border-right: none;">${record.paper.name}</td>
										</#if>
										<#--<td>${record.paper.passmark}</td>-->
										<td style="border-bottom: 1px solid #fff; border-top: none; border-left: none; border-right: none;">${record.singlechoicemark?number + record.multichoicemark?number + record.blankmark?number + record.essaymark?number}</td>
										<td style="border-bottom: 1px solid #fff; border-top: none; border-left: none; border-right: none;">${record.recorddate?if_exists}</td>
										<td style="border-bottom: 1px solid #fff; border-top: none; border-left: none; border-right: none;">
											<#list rhs["monitorlist"]?keys as recordid>
												<#if recordid == record.id?string && (rhs["monitorlist"][recordid]?size > 0) >
													<a onclick="javascript:showlog('${record.taskid}','${record.paper.id}','${record.userid}');">Security Log</a>
												</#if>
											</#list>
										</td>
										
										<#--<td >${record.remark?if_exists}</td>-->
									</tr>
									<#assign i = i + 1 />
								</#list>
							</table>
						</td>
					</tr>
					</#if>
				</#list>
			</table>
			<form action="exam_exam_exam_record_list.do?groupby=<#if rhs["groupby"] == 'paper'>user<#else>paper</#if>" id="search_form" method="post" style="display:none;">
				<input type="hidden" name="search" value="search">
				<input type="hidden" name="pageId" id="pageId">
				<input type="hidden" name="maxSize" id="pageMaxSize">
			</form>
			<#include "../../../common/freemarker/macro_pagination.ftl">
			<@pagination  "search_form" />
			
<#else>
	<#include "exam_arrange_list.ftl">
</#if>
  </div>
</div>
</div>
<script>
	$(function() {$( "#div_scoll" ).draggable();});  
	function showresult(paperid){
		var resultstyle = $("#"+paperid).attr("style");
		if(resultstyle == null || resultstyle.indexOf("none") < 0){
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
		$("#operation_title").html("Security Log" + "<a onclick='show_dir();' class='pull-right' ><span class='ui-icon-white ui-icon-close'></span></a>");
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
	
	function groupby(type){
		$.ajax({
			type : "POST",
			url : "exam_exam_exam_record_list.do",
			data : "groupby=" + type,
			cache : false,
			success : function(html) {
				document.getElementById("result_body").innerHTML = html;
				/*if(type == "user"){
					$("#groupby").html("Group by Paper");
				}else{
					$("#groupby").html("Group by User");
				}*/
				$(function() {$( "#div_scoll" ).draggable();});  
			}
		});
	}
	
</script>
