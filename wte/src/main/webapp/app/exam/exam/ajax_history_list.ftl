<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_exam.ftl">
<table class="table table-condensed table-hover table-bordered">
				<tr>
					<th width=25px>#</th>
					<th ><@i18n "title_name" /></th>
					<#--<th >User ID</th>
					<th ><@i18n "title_totalmark" /></th>-->
					<th ><@i18n "title_passmark" /></th>
					<th ><@i18n "title_result" /></th>
					<th><@i18n "title_time" /></th>
					<#--<th ><@i18n "title_result" /></th>-->
					<#--<th ><@i18n "title_remark" /></th>-->
					<th></th>
				</tr>
				<#assign index=1 />
				<#list rhs["datalist"]?keys as papername>
				<#--<#assign index=1>-->
				<#list (rhs["datalist"][papername]?sort_by("id"))?reverse as record>
				<tr>
					<td>${index}</td>
					<td>${rhs["datalist"][papername][0].paper.name} </td><#--onclick="javascript:showresult(${rhs["datalist"][papername][0].paper.id});"-->
					<td>${rhs["datalist"][papername][0].paper.passmark}</td>
					<td>
					<#if record.remark?exists && record.remark == "Wait for judge">
						${record.remark}
					<#else>
						${record.singlechoicemark?number + record.multichoicemark?number + record.blankmark?number + record.essaymark?number}
					</#if>
					</td>
					<td>${record.recorddate?if_exists}</td><#--<#if rhs["export"]><div class="pull-right"><a href="exam_exam_export_record.do?paperId=${rhs["datalist"][papername][0].paper.id}" class="btn btn-xs btn-primary" >Export to Excel</a></div></#if>-->
					<td><#if rhs["export"]><a onclick="javascript:showlog('${record.taskid}','${record.paper.id}','${record.userid}');" class="btn btn-xs btn-primary">Show Log</a></#if></td>
				</tr>
				<#assign index = index + 1 />
				</#list>
				</#list>
			</table>
			<br/>
			<#if rhs["oatasklist_outdate"]?size gt 0 >	
			<strong style="display:block; padding-bottom: 5px;"> You missed exam: </strong>
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
			<#if (rhs.historymaxPage> 1)>
	<p align=right>
				<#if (rhs.historycurrentPage > 1) ><a   onclick="javascript:page_history('ajax_historypage_data.do','pageId=${rhs.historycurrentPage-1}')">«</a></#if>
				page
				<#if (rhs.historycurrentPage > 1) ><a onclick="javascript:page_history('ajax_historypage_data.do','pageId=1')">1</a></#if>
				<a href="#">${rhs.historycurrentPage}</a><#-- 本页 -->
				<#if (rhs.historycurrentPage < rhs.historymaxPage) ><a   onclick="javascript:page_history('ajax_historypage_data.do','pageId=${rhs.historymaxPage}')">${rhs.historymaxPage}</a></#if>
				<#if (rhs.historycurrentPage < rhs.historymaxPage) ><a  onclick="javascript:page_history('ajax_historypage_data.do','pageId=${rhs.historycurrentPage+1}')">»</a></#if>

			Current:${rhs.historycurrentPage}/${rhs.historymaxPage} Page,
			${rhs.historycount} Records &nbsp;
			<select style="WIDTH: 60px"   onchange="javascript:page_history('change_historypage_number.do','maxSize='+this.value)" >
					    <option value="${rhs["historymaxSize"]}">${rhs["historymaxSize"]}</option>
		  				<option value="5">5</option>
		  				<option value="10">10</option>
		  				<option value="20">20</option>
		  				<option value="50">50</option>
		  				<option value="200">200</option>
		  				<option value="1000">1000</option>
		 			<select>		
	</p>
</#if>