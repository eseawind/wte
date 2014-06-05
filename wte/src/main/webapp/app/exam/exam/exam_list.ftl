<#include "../../../common/freemarker/include_header.ftl">
<div class="panel panel-primary">
       
  <div class="panel-heading">
  	<strong>Exam Information List</strong>
  </div>
  <div class="panel-body">
		<table class="table table-condensed table-hover table-bordered">
				<tr>
					<td width=25px><strong>#</strong></td>
					<td ><strong><@i18n "title_name" /></strong></td>
					<td ><strong><@i18n "title_passmark" /></strong></td>
					<td ><strong><@i18n "title_totalmark" /></strong></td>
					<td ><strong><@i18n "title_examtime" /></strong></td>
					<td ><strong><@i18n "title_createtime" /></strong></td>
					<td ><strong><@i18n "title_operation" /></strong></td>
				</tr>
				<#list rhs["oatasklist"] as item>
					<#if item.obj?exists>
					<tr>
						<td>${item_index+1}</td>
						<td>${item.obj.name}</td>
						<td >${item.obj.passmark}</td>
						<td >${item.obj.totalmark}</td>
						<td >${item.obj.time}(minutes)</td>
						<td>${item.task.createTime?datetime}</td>
						<td >
							<#--<a href="common_activiti_process_diagram.do?processInstanceId=${item.task.processInstanceId}" target=_blank>
								View
							</a>-->
							<a  <#if item.method == "Start"> onclick="javascript:toFull('${item.handleTaskUrl?if_exists}&taskId=${item.task.id}')"<#else>href="${item.handleTaskUrl?if_exists}&taskId=${item.task.id}"</#if> class="btn btn-xs btn-primary">
								${item.method}
							</a>
						</td>
					</tr>
					</#if>
				</#list>
			</table>
			<form action="exam_exam_exam_list.do" id="search_form" method="post" style="display:none;">
				<input type="hidden" name="search" value="search">
				<input type="hidden" name="pageId" id="pageId">
				<input type="hidden" name="maxSize" id="pageMaxSize">
			</form>
			<#include "../../../common/freemarker/macro_pagination.ftl">
			<@pagination  "search_form" />
  </div>
</div>
<script>
	function   toFull(url){
	  if(window.name=="fullscreen")
	  	return; 
	  var a =window.open(url,"fullscreen","fullscreen=1,scrollbars=yes");
	}
</script>
