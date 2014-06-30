<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_custom.ftl">
<style type="text/css">
input {
	text-align: center;
}
.panel-body {
	padding: 0;
}
.table-bordered {
	border: none;
}
.table-bordered>thead>tr>th, 
.table-bordered>tbody>tr>td {
	text-align: center;
}
</style>
<script type="text/javascript" src="<@context_module/>user.js"></script>
<div style="margin:5px">
	&nbsp;&nbsp;
	<a  class="btn btn-xs btn-primary" onclick="javascript:action_user('create.do','');action_user('ajax_page_data.do','pageId=${rhs.maxPage}');"  ><@i18n "menu_user_new" /></a>

	<div class="panel panel-primary">
		<div class="panel-heading"><strong>User List</strong></div>
      	<div class="panel-body">
	<#--
	<a href="ea_ea_menu_person_deploy.do" target="_blank">&nbsp;&nbsp;人员部署</a>  
	<a href="ea_ea_report_user_check.do?resultftl=menu_check_deploy_error" target="_blank">&nbsp;&nbsp;人员分配合理性检查</a><br>
	-->
	<#--&nbsp;&nbsp;排序:
		<a href="ea_user_menu_user.do?sortName=assessLev" >评级</a>
		<a href="ea_user_menu_user.do?sortName=account" >帐号</a></li>
		<a href="ea_user_menu_user.do?sortName=name" >姓名</a></li>
	&nbsp;&nbsp;过滤：
	                                                      级别
					<select  style="width:50px" onchange="javascript:action_user('search_by_level.do','assessLev='+escape(encodeURIComponent(this.value)))" >
					    <option value="T">T</option>
		  				<option value="A">A</option>
		  				<option value="B">B</option>
		  				<option value="C">C</option>
		 			<select>
		 			<#if  rhs["system_para_map"]["user-status"]?exists>
			                            在职状态
					<select  style="width:60px" onchange="javascript:action_user('search_by_status.do','status='+escape(encodeURIComponent(this.value)))" >
				        <option value="">所有</option>
					    <#list  rhs["system_para_map"]["user-status"]?keys as key>
						   <option value="${key}">${rhs["system_para_map"]["user-status"][key]?if_exists}</option>
						</#list> 				
		 			<select>
		 			</#if>	
    <br>		-->

			<div id="div_user_table"><#include "ajax_user.ftl"></div>
	  	</div>
    </div>
</div>

