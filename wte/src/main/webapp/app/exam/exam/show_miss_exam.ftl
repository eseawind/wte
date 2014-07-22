<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_exam.ftl">
<div class="exam-frame">
	<div style="margin-bottom:5px;">
		<img style="vertical-align: text-bottom;" src="common/images/e_history_blue.png" />
		<span style="padding-left:5px; font-size:18px; color:#C6C6C6;">Missed Exam</span>
	</div>
	<div class="alert alert-info">
		<div class="panel-body" id="history_table">
			<#if rhs["oatasklist_outdate"]?size gt 0 >
					<table class="table table-condensed table-hover table-bordered">
						<tr>
							<th width=25px>#</th>
							<th ><@i18n "title_name" /></th>
							<th ><@i18n "title_examtime" /></th>
							<th ><@i18n "title_starttime" /></th>
						</tr>
						<#list rhs["oatasklist_outdate"] as item>
							<#if item.obj?exists>
								<tr>
									<td>${item_index+1}</td>
									<td>${item.obj.name}</td>
									<td >${item.obj.time}(minutes)</td>
									<td id="starttime_${item.task.id}">${item.starttime}</td>
								</tr>
							</#if>
						</#list>
					</table>
			</#if>
  		</div>
	</div>
</div>
