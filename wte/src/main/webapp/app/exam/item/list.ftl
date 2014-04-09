<#include "../../../common/freemarker/include_header.ftl">
<body> 
   		<#include "include_add_search.ftl">
		<br><br>
		<a style="margin-left:10px;margin-top:5px;" class="btn btn-info "  href="exam_knowledge_menu_knowledge.do">知识领域</a>
		<a style="margin-left:7px;margin-top:5px;" class="btn btn-info "  href="exam_item_save.do?method=show">添加题目</a>
		
	<div class="panel panel-primary" style="margin-top: 18px;">
      <div class="panel-heading"><strong>Item List</strong></div>
      <div class="panel-body">
			
			
		
		<table class="table table-condensed table-hover">
	    <thead>
			<tr>
			    <td width=25px><strong>#</strong></td>
				<td width=500px><strong>题目内容</strong></td>
				<td width=120px><strong>题目类型</strong></td>
				<td><strong>操作</strong></td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			<#list rhs["dataList"]?sort_by("id") as x>
			 <tr>
			    <td class=nob >${x_index+1}</td>
				<td>${x.content?if_exists}</td>
				<td>
					<#if x.type == 1>
						单项选择题
					</#if>
					<#if x.type == 2>
						多项选择题
					</#if>
					<#if x.type == 3>
						填空题
					</#if>
					<#if x.type == 4>
						主观题
					</#if>
				</td>
				<td><a href="exam_item_load.do?method=edit&id=${x.id}">编辑</a> | <a href="exam_item_load.do?method=show&id=${x.id}"> 查看</a> | <a href="exam_item_delete.do?id=${x.id}">删除</a></td>
				<td></td>
			</tr>
			</#list>
		</tbody>
	</table>
				<form action="exam_item_list.do" id="search_form" method="post" style="display:none;">
				<input type="hidden" name="search" value="search">
				<input type="hidden" name="pageId" id="pageId">
				<input type="hidden" name="maxSize" id="pageMaxSize">
			</form>
		<#include "../../../common/freemarker/macro_pagination.ftl">
		<@pagination  "search_form" />
      </div>
    </div>
		
		
</body>