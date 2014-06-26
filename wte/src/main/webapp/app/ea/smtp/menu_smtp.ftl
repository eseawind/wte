<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_custom.ftl">
<script type="text/javascript" src="<@context_module/>smtp.js"></script>
<div style="margin:5px 0 0 14px">
	<a class="btn btn-xs btn-primary"   onclick="javascript:action_smtp('create.do','');"><@i18n "title_smtp_add" /></a>
	<a class="btn btn-xs btn-primary" href="ea_ea_menu_mail_list.do" target="mainFrame"><@i18n "menu_mail_tool" /></a>
	
	<div id="div_smtp_table" style="margin-top:10px;"><#include "ajax_smtp.ftl"></div>
</div>

