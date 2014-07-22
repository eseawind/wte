<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_exam.ftl">
<table class="table table-condensed table-hover table-bordered">
		  		<tr>
		  			<th width=25px>#</th>
					<th ><@i18n "title_name" /></th>
					<th ><@i18n "title_passmark" /></th>
					<th ><@i18n "title_totalmark" /></th>
					<th ><@i18n "title_examtime" /></th>
					<th ><@i18n "title_starttime" /></th>
					<th ><@i18n "title_operation" /></th>
				</tr>
				<#list rhs["oatasklist"] as item>
				<#if item.obj?exists>
				<tr>
					<td>${item_index+1}</td>
					<td>${item.obj.name}</td>
					<td >${item.obj.passmark}</td>
					<td >${item.obj.totalmark}</td>
					<td >${item.obj.time}(minutes)</td>
					<td id="starttime_${item.task.id}">${item.starttime}</td> <#--${item.task.createTime?datetime}-->
					<td >
					<#--<a href="common_activiti_process_diagram.do?processInstanceId=${item.task.processInstanceId}" target=_blank>
							View
						</a>-->
					<a  <#if item.method == "Start"> onclick="javascript:toFull('${item.handleTaskUrl?if_exists}&taskId=${item.task.id}')"<#else>href="${item.handleTaskUrl?if_exists}&taskId=${item.task.id}"</#if> class="btn btn-xs btn-info">
									${item.method}
					</a>
					</td>
				</tr>
				</#if>
				</#list>
			</table>
			   
<#if (rhs.maxPage> 1) &&rhs["oatasklist"]?size gt rhs["maxSize"] >
	<p align=right>
				<#if (rhs.currentPage > 1) ><a   onclick="javascript:page_exam('ajax_page_data.do','pageId=${rhs.currentPage-1}')">«</a></#if>
				page
				<#if (rhs.currentPage > 1) ><a onclick="javascript:page_exam('ajax_page_data.do','pageId=1')">1</a></#if>
				<a href="#">${rhs.currentPage}</a><#-- 本页 -->
				<#if (rhs.currentPage < rhs.maxPage) ><a   onclick="javascript:page_exam('ajax_page_data.do','pageId=${rhs.maxPage}')">${rhs.maxPage}</a></#if>
				<#if (rhs.currentPage < rhs.maxPage) ><a  onclick="javascript:page_exam('ajax_page_data.do','pageId=${rhs.currentPage+1}')">»</a></#if>

			Current:${rhs.currentPage}/${rhs.maxPage} Page,
			${rhs.count} Records &nbsp;
			<select style="WIDTH: 60px"   onchange="javascript:page_exam('change_page_number.do','maxSize='+this.value)" >
					    <option value="${rhs["maxSize"]}">${rhs["maxSize"]}</option>
		  				<option value="5">5</option>
		  				<option value="10">10</option>
		  				<option value="20">20</option>
		  				<option value="50">50</option>
		  				<option value="200">200</option>
		  				<option value="1000">1000</option>
		 			<select>		
	</p>
</#if>