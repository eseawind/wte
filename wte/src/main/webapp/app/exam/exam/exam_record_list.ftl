<#include "../../../common/freemarker/include_header.ftl">
<div class="panel panel-primary" style="margin-left:15px;">
       
  <div class="panel-heading">
  	<strong>Exam History List</strong>
  </div>
  <div id="div_scoll" style="margin-left:150px;margin-top:-350px; cursor:hander;position:absolute;width:400px;z-index:10000;display:none;" class="panel panel-default"><!--style="border:2px solid #eee;"-->
			 	<div id="operation_title" class="panel-heading"><strong>Log</strong><a class="pull-right" onclick="show_dir();" class="btn btn-xs  btn-default" ><span class=ui-icon ui-icon-close></span></a></div>
			 	<div class="panel-body" id="div_select_item" style="cursor:hander;"> 
			 	
			 	</div>
			</div>
  <div class="panel-body">
		<table class="table table-condensed table-bordered">
				<tr>
					<td width=25px><strong>#</strong></td>
					<td ><strong><@i18n "title_name" /></strong></td>
					<#--<td ><strong>User ID</strong></td>-->
					<td ><strong><@i18n "title_totalmark" /></strong></td>
					<td ><strong><@i18n "title_passmark" /></strong></td>
					<td></td>
					<#--<td ><strong><@i18n "title_result" /></strong></td>-->
					<#--<td ><strong><@i18n "title_remark" /></strong></td>-->
				</tr>
				<#assign index=1 />
				<#list rhs["datalist"]?keys as papername>
					<tr>
						<td>${index}</td>
						<td >${papername} <button onclick="javascript:showresult(${rhs["datalist"][papername][0].paper.id});" class="btn btn-xs btn-primary pull-right" name="detail">Detail</button></td>
						<td>${rhs["datalist"][papername][0].paper.totalmark}</td>
						<td>${rhs["datalist"][papername][0].paper.passmark}</td>
						<td><#if rhs["export"]><div class="pull-right"><a href="exam_exam_export_record.do?paperId=${rhs["datalist"][papername][0].paper.id}" class="btn btn-xs btn-primary" >Export to Excel</a></div></#if></td>
					</tr>
					<#assign index=index+1 />
					<tr id="${rhs["datalist"][papername][0].paper.id}" style="display:none;">
						<td colspan="5" >
							<table class="table table-condensed table-bordered table-hover">
								<#assign i=1>
								<tr>
									<td><strong>></strong></td>
									<td><strong>User ID</strong></td>
									<td ><strong><@i18n "title_result" /></strong></td>
									<td><strong><@i18n "title_time" /></strong></td>
									<td></td>
								</tr>
								<#list (rhs["datalist"][papername]?sort_by("id"))?reverse as record>
									<tr>
										<td>${i}</td>
										<#--<td ></td><a href="exam_exam_exam_record_detail.do?paperId=${record.paper.id}&recordsId=${record.id}" ></a>-->
										<td>${record.userid}</td>
										<#--<td>${record.paper.totalmark}</td>-->
										<#--<td>${record.paper.passmark}</td>-->
										<td>${record.singlechoicemark?number + record.multichoicemark?number + record.blankmark?number + record.essaymark?number}</td>
										<td>${record.recorddate?if_exists}</td>
										<td>
											<#list rhs["monitorlist"]?keys as recordid>
												<#if recordid == record.id?string && (rhs["monitorlist"][recordid]?size > 0) >
													<a onclick="javascript:showlog('${record.taskid}','${record.paper.id}','${record.userid}');" class="btn btn-xs btn-info">Show Log</a>
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
				</#list>
			</table>
			<form action="exam_exam_exam_record_list.do" id="search_form" method="post" style="display:none;">
				<input type="hidden" name="search" value="search">
				<input type="hidden" name="pageId" id="pageId">
				<input type="hidden" name="maxSize" id="pageMaxSize">
			</form>
			<#include "../../../common/freemarker/macro_pagination.ftl">
			<@pagination  "search_form" />
			
  </div>
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