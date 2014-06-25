
<#include "../../../common/freemarker/include_header.ftl">
<script type="text/javascript" src="<@context_module/>smtp.js"></script>
<body style="padding:5px">
	<a class="btn btn-xs btn-primary"   onclick="javascript:action_smtp('create.do','');"><@i18n "title_smtp_add" /></a>
	<a class="btn btn-xs btn-primary" href="ea_ea_menu_mail_list.do" target="mainFrame"><@i18n "menu_mail_tool" /></a>
	<br><br>
	
	<div id=div_smtp_table><#include "ajax_smtp.ftl"></div>

	

</body>

