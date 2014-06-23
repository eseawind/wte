<#include "common/freemarker/include_header.ftl">
<style>
body {
	background-color: #fff;
}
/* All levels of nav */
.bs-sidenav {
	margin-top: 10px;
	margin-left: 12px;
	background-color: #fff;
}
.bs-sidebar .nav > li {
	width: 180px;
 	background:url(common/images/dotted_level.gif) repeat-x bottom left;
}
.bs-sidebar .nav > li > a {
	display: block;
  	color: #716b7a;
  	padding: 10px 20px;
  	line-height: 26px;
}
.bs-sidebar .nav > li > a:hover,
.bs-sidebar .nav > li > a:focus {
  	text-decoration: none;
  	background-color: #fff;
  	border: none;
  	background:url(common/images/dotted_level.gif) repeat-x bottom left;
  	font-weight: bold;
}
.bs-sidebar .nav > .active > a,
.bs-sidebar .nav > .active:hover > a,
.bs-sidebar .nav > .active:focus > a {
  	font-weight: bold;
  	color: red;
  	background-color: transparent;
  	border-right: 1px solid #563d7c;
}

/* Nav: second level (shown on .active) */
.bs-sidebar .nav .nav {
  	display: none; /* Hide by default, but at >768px, show it */
  	margin-bottom: 8px;
}
</style>

<script type="text/javascript">
function changeArrow(currentId){
	document.getElementById(currentId).src ="common/images/arrow_blue.png"
}

function backArrow(currentId){
	document.getElementById(currentId).src ="common/images/arrow_grey.png"
}
  
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
		  <li ><a href="ea_smtp_menu_smtp.do" target="mainFrame" onMouseOver="changeArrow(1)" onMouseOut="backArrow(1)"><img src="common/images/arrow_grey.png" id="1"/>&nbsp;&nbsp;Mail Management</a></li>
		  <li ><a href="ea_user_menu_user.do" target="mainFrame" onMouseOver="changeArrow(1)" onMouseOut="backArrow(1)"><img src="common/images/arrow_grey.png" id="1"/>&nbsp;&nbsp;<@i18n "menu_user" /></a></li>
		  <li ><a href="exam_item_list.do" target="mainFrame" onMouseOver="changeArrow(2)" onMouseOut="backArrow(2)"><img src="common/images/arrow_grey.png" id="2" />&nbsp;&nbsp;Question Library</a></li>
		  <li ><a href="exam_paper_list.do" target="mainFrame" onMouseOver="changeArrow(3)" onMouseOut="backArrow(3)"><img src="common/images/arrow_grey.png" id="3" />&nbsp;&nbsp;Examination Management</a></li>
		  <li ><a href="exam_exam_exam_arrange_list.do" target="mainFrame" onMouseOver="changeArrow(4)" onMouseOut="backArrow(4)"><img src="common/images/arrow_grey.png" id="4" />&nbsp;&nbsp;<@i18n "menu_exam_arrange" /></a></li>
		  <li ><a href="exam_exam_exam_record_list.do?groupby=paper" target="mainFrame" onMouseOver="changeArrow(5)" onMouseOut="backArrow(5)"><img src="common/images/arrow_grey.png" id="5" />&nbsp;&nbsp;Result Management</a></li>
    </ul>
  </div>
</body> 
 
