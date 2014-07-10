<table class="table table-condensed table-hover">
	    <thead>
			<tr>
			    <td width=25px><strong>#</strong></td>
				<td width=250px><strong>Paper Name</strong></td>
			<#--	<td width=150px><strong><@i18n "title_createtime" /></strong></td>-->
				<td width=120px><strong>Certification Score<#--<@i18n "title_passmark" />--></strong></td>
				<td width=100px><strong>Total Score <#--<@i18n "title_totalmark" />--></strong></td>
				<td width=100px><strong><@i18n "title_examtime" /></strong></td>
				<#--<td width=100px><strong><@i18n "title_status" /></strong></td>-->
				<td><strong></strong></td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			<#assign index=1 />
			<#list rhs["dataList"]?keys as papergroup>
			<#list rhs["dataList"][papergroup] as x>
			 <tr>
			    <td class=nob >${index}</td>
				<td><#if x.businessModel.papergroup?exists>[${x.businessModel.papergroup.name}]</#if>&nbsp;${x.businessModel.name?if_exists}</td>
				<#--<td>${x.businessModel.createdate?if_exists}</td>-->
				<td>${x.businessModel.passmark?if_exists}</td>
				<td>${x.businessModel.totalmark?if_exists}</td>
				<td>${x.businessModel.time?if_exists} &nbsp;(Minutes)</td>
				<#--<td>${x.processInstanceStatus}</td>-->
				<td><a href="exam_paper_load.do?method=edit&id=${x.businessModel.id}"><@i18n "title_edit" /></a> <#--| <a href="exam_paper_load.do?method=show&id=${x.businessModel.id}"> <@i18n "title_view" /></a>--> <#if (!(x.businessModel.processInstanceId?exists&&x.businessModel.processInstanceId != "") && x.processInstanceStatus == 'New' || x.processInstanceStatus == 'Done') >| <a onclick="javascript:action_paper('delete.do','${x.businessModel.id}');"><@i18n "title_delete" /></a> </#if> </td><#--href="exam_paper_delete.do?id=${x.businessModel.id}"-->
				<td>
				<a id="startProcess${x.businessModel.id}" title="Start Process" class="btn btn-xs btn-custom"
					    		<#if (x.businessModel.time?number > 0) >href="exam_paper_assign.do?id=${x.businessModel.id}" <#else> onclick="javascript:alert('Exam Time was not set!');"</#if> >
					    		Schedule</a>
					    		
				</td>
			</tr>
			<#assign index=index+1 />
			</#list>
			</#list>
		</tbody>
	</table>
		<#include "../../../common/freemarker/macro_pagination.ftl">
		<@pagination  "search_form" />