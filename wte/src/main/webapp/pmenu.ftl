<#include "common/freemarker/include_header.ftl">
<style>
/* All levels of nav */
.bs-sidebar .nav > li > a {
  display: block;
  color: #716b7a;
  padding: 5px 20px;
}
.bs-sidebar .nav > li > a:hover,
.bs-sidebar .nav > li > a:focus {
  text-decoration: none;
  background-color: #e5e3e9;
  border-right: 1px solid #dbd8e0;
}
.bs-sidebar .nav > .active > a,
.bs-sidebar .nav > .active:hover > a,
.bs-sidebar .nav > .active:focus > a {
  font-weight: bold;
  color: #563d7c;
  background-color: transparent;
  border-right: 1px solid #563d7c;
}

/* Nav: second level (shown on .active) */
.bs-sidebar .nav .nav {
  display: none; /* Hide by default, but at >768px, show it */
  margin-bottom: 8px;
}
.bs-sidebar .nav .nav > li > a {
  padding-top:    3px;
  padding-bottom: 3px;
  padding-left: 30px;
  font-size: 90%;
}


</style>
<body style="background-color: #f7f5fa;">
  <div class="bs-sidebar hidden-print" >
    <ul class="nav bs-sidenav">
	  <li class="nav-header"></li>
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
		  <li ><a href="ea_user_menu_user.do" target="mainFrame"><@i18n "menu_user" /></a></li>
		  <li ><a href="exam_item_list.do" target="mainFrame">Question Library<#--<@i18n "menu_item" />--></a></li>
		  <li ><a href="exam_paper_list.do" target="mainFrame">Examination Management<#--<@i18n "menu_paper" />--></a></li>
		  <#--
		  <li ><a href="exam_exam_exam_list.do" target="mainFrame"><@i18n "menu_judge" /></a></li>
<<<<<<< HEAD
		  -->
		  		  <li ><a href="exam_exam_exam_arrange_list.do" target="mainFrame"><@i18n "menu_exam_arrange" /></a></li>
		  <li ><a href="exam_exam_exam_record_list.do" target="mainFrame"> Result Management<#--<@i18n "menu_query_exam" />--></a></li>
=======
		  <li ><a href="exam_exam_exam_arrange_list.do" target="mainFrame"><@i18n "menu_exam_arrange" /></a></li>
		  <li ><a href="exam_exam_exam_record_list.do" target="mainFrame"><@i18n "menu_query_exam" /></a></li>
>>>>>>> branch 'master' of https://github.com/AAATEAM/wte.git
    </ul>
  </div>
</body> 
 
