<#include "../../../common/freemarker/include_header.ftl">
<script>

	function action_paper_start_process(id, assignee){
		$('#startProcess' + id).text('waitting');
		$("#startProcess" + id).attr("onclick","");
		$.ajax({
			type: 'post',
			url: 'exam_paper_assign.do',
			data: 'id=' + id,
			cache: false,
			success: function(html){
			   document.location.href = "exam_paper_list.do";
			}
		});  
	}

</script>
<body> 
<div style="margin:5px">
        <#--
   		<#include "include_add_search.ftl">
   		-->
		&nbsp;&nbsp;&nbsp;
		<a  class="btn btn-xs btn-primary "  href="exam_item_import_itembyxls.do"><@i18n "menu_paper_byexcel" /></a>
		<#--<a style="margin-left:7px;margin-top:5px;" class="btn btn-xs btn-info "  href="exam_paper_save.do?method=show"><@i18n "menu_paper_new" /></a>
		<a style="margin-left:7px;margin-top:5px;" class="btn btn-xs btn-info "  href="exam_template_list.do"><@i18n "menu_template" /></a>-->
		
	<div class="panel panel-primary" >
      <div class="panel-heading"><strong>Paper List</strong></div>
      <div class="panel-body">
			
			
		
		<table class="table table-condensed table-hover">
	    <thead>
			<tr>
			    <td width=25px><strong>#</strong></td>
				<td width=300px><strong><@i18n "title_title" /></strong></td>
				<td width=200px><strong><@i18n "title_createtime" /></strong></td>
				<td width=100px><strong><@i18n "title_passmark" /></strong></td>
				<td width=100px><strong><@i18n "title_totalmark" /></strong></td>
				<td width=100px><strong><@i18n "title_examtime" /></strong></td>
				<td><strong><@i18n "title_operation" /></strong></td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			<#list rhs["dataList"] as x>
			 <tr>
			    <td class=nob >${x_index+1}</td>
				<td>${x.businessModel.name?if_exists}</td>
				<td>${x.businessModel.createdate?if_exists}</td>
				<td>${x.businessModel.passmark?if_exists}</td>
				<td>${x.businessModel.totalmark?if_exists}</td>
				<td>${x.businessModel.time?if_exists} &nbsp;(Minutes)</td>
				<td><a href="exam_paper_load.do?method=edit&id=${x.businessModel.id}"><@i18n "title_edit" /></a> | <a href="exam_paper_load.do?method=show&id=${x.businessModel.id}"> <@i18n "title_view" /></a> | <a href="exam_paper_delete.do?id=${x.businessModel.id}"><@i18n "title_delete" /></a></td>
				<td>
				<a id="startProcess${x.businessModel.id}" title="Start Process" class="btn btn-xs btn-primary"
					    		href="exam_paper_assign.do?id=${x.businessModel.id}" >
					    		Start</a>
				</td>
			</tr>
			</#list>
		</tbody>
	</table>
		<#include "../../../common/freemarker/macro_pagination.ftl">
		<@pagination  "search_form" />
      </div>
    </div>
		
</div>	
</body>