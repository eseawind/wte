<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_custom.ftl">
<script type="text/javascript" src="<@context_module/>paper.js"></script>
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

<div style="margin:5px; height: 30px;">
	<#include "include_add_search.ftl">
	<div style="position:absolute;">
		&nbsp;&nbsp;
		<a class="btn btn-xs btn-primary "  href="exam_paper_create.do?method=newpaper"><@i18n "menu_paper_new" /></a>
			<#--
			<a style="margin-left:10px;" class="btn btn-xs btn-info "  href="exam_item_import_itembyxls.do?method=paper"><@i18n "menu_paper_new_excel" /></a> <br />
			-->
			<#--<a style="margin-left:10px;" class="btn btn-xs btn-info "  href="exam_template_list.do"><@i18n "menu_template" /></a>-->
	</div>
</div>

<div style="margin:5px">
	<div class="panel panel-primary" style="clear:both;">
      <div class="panel-heading"><strong><@i18n "title_paper" /></strong></div>
      <div class="panel-body" id="div_paper_table">
		<#include "ajax_paper.ftl">
      </div>
    </div>
</div>	