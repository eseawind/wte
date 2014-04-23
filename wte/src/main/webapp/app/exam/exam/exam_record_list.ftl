<#include "../../../common/freemarker/include_header.ftl">
<div class="panel panel-primary">
       
  <div class="panel-heading">
  	<strong>Exam History List</strong>
  </div>
  <div class="panel-body">
		<table class="table table-condensed table-bordered">
				<tr>
					<td width=25px><strong>#</strong></td>
					<td ><strong><@i18n "title_name" /></strong></td>
					<td ><strong>User ID</strong></td>
					<td ><strong><@i18n "title_totalmark" /></strong></td>
					<td ><strong><@i18n "title_passmark" /></strong></td>
					<td ><strong><@i18n "title_result" /></strong></td>
					<#--<td ><strong><@i18n "title_remark" /></strong></td>-->
				</tr>
				<#list rhs["datalist"]?keys as papername>
				<#assign index=1 />
					<tr>
						<td></td>
						<td colspan="5">${papername} <#if rhs["export"]><div class="pull-right"><a href="exam_exam_export_record.do?paperId=${rhs["datalist"][papername][0].paper.id}" class="btn btn-xs btn-primary" >Export to Excel</a></div></#if></td>
					</tr>
					<#list rhs["datalist"][papername] as record>
						<tr>
							<td>${index}</td>
							<td ></td><#--<a href="exam_exam_exam_record_detail.do?paperId=${record.paper.id}&recordsId=${record.id}" ></a>-->
							<td>${record.userid}</td>
							<td>${record.paper.totalmark}</td>
							<td>${record.paper.passmark}</td>
							<td >${record.singlechoicemark?number + record.multichoicemark?number + record.blankmark?number + record.essaymark?number}</td>
							<#--<td >${record.remark?if_exists}</td>-->
						</tr>
					<#assign index = index + 1 />
					</#list>
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
