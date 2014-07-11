<#include "common/freemarker/include_header.ftl">
<#include "common/freemarker/include_custom.ftl">
<style>
body {
	background-color: #fff;
}
</style>

<script type="text/javascript">
function changeArrow(currentId){
	document.getElementById(currentId).src ="common/images/arrow_blue.png"
}

function backArrow(currentId){
	document.getElementById(currentId).src ="common/images/arrow_grey.png"
}

$('a').bind('focus', function(){
	if(this.blur){    
		this.blur();   
    }   
}); 
</script>

<body>
  <div class="bs-sidebar hidden-print">
    <ul class="nav bs-sidenav">
	  <#--<li class="nav-header"></li>-->
		  <#--<li ><a href="ea_organize_index.do" target="mainFrame">组织架构</a></li>
		  <li ><a href="ea_rule_menu_rule.do" target="mainFrame">信息发布</a></li>
		  <li ><a href="ea_smtp_menu_smtp.do" target="mainFrame">邮箱系统</a></li>
		  <li ><a href="ea_ea_menu_mail_list.do" target="mainFrame">邮件发送工具</a></li>
		  <li ><a href="ea_systempara_menu_systempara.do" target="mainFrame">系统参数</a></li>
		  <li ><a href="ea_resource_menu_resource.do" target="mainFrame">权限</a></li>
 		  <li ><a href="common_monitor_home.do" target="mainFrame">运行状态</a></li>
		  <li ><a href="common_activiti_menu_process_definition.do" target="mainFrame">工作流管理</a></li>
 		  <li ><a href="ea_report_assessment.do" target="mainFrame">技术管理</a></li>
 		  -->
 		  <#--<li ><a href="exam_knowledge_menu_knowledge.do" target="mainFrame">知识领域</a></li>-->
		  <#--<li ><a href="exam_template_list.do" target="mainFrame">模板管理</a></li>-->
		  <#--<li ><a href="common_edit_list_file.do" target="mainFrame"><@i18n "menu_edit_para" /></a></li>-->
		  
		  <li ><a href="ea_user_menu_user.do" target="mainFrame" onMouseOver="changeArrow(1)" onMouseOut="backArrow(1)" onfocus="this.blur();"><img src="common/images/arrow_grey.png" id="1"/>&nbsp;&nbsp;<@i18n "menu_user" /></a></li>
		  <li ><a href="exam_item_list.do" target="mainFrame" onMouseOver="changeArrow(2)" onMouseOut="backArrow(2)" onfocus="this.blur();"><img src="common/images/arrow_grey.png" id="2" />&nbsp;&nbsp;Question Library</a></li>
		  <li ><a href="exam_paper_list.do" target="mainFrame" onMouseOver="changeArrow(3)" onMouseOut="backArrow(3)" onfocus="this.blur();"><img src="common/images/arrow_grey.png" id="3" />&nbsp;&nbsp;Examination Management</a></li>
		  <#--<li ><a href="exam_exam_exam_arrange_list.do" target="mainFrame" onMouseOver="changeArrow(4)" onMouseOut="backArrow(4)" onfocus="this.blur();"><img src="common/images/arrow_grey.png" id="4" />&nbsp;&nbsp;<@i18n "menu_exam_arrange" /></a></li>-->
		  <li ><a href="exam_exam_exam_record_list.do?groupby=user" target="mainFrame" onMouseOver="changeArrow(5)" onMouseOut="backArrow(5)" onfocus="this.blur();"><img src="common/images/arrow_grey.png" id="5" />&nbsp;&nbsp;Result Management</a></li>
		  <li ><a href="ea_smtp_menu_smtp.do" target="mainFrame" onMouseOver="changeArrow(6)" onMouseOut="backArrow(6)" onfocus="this.blur();"><img src="common/images/arrow_grey.png" id="6"/>&nbsp;&nbsp;Mail Management</a></li>
    </ul>
  </div>
</body> 
 
