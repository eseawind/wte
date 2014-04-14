<#include "common/freemarker/include_header.ftl">
<style type="text/css">
	a{color: #224888; }
</style>
<body >
   
    <div class="pull-left"><img class="logo" style="height:60px;padding-top:2px;padding-bottom:3px;padding-left:10px;" src="common/images/elogo.png" /></div>
    <div class="pull-right" style="padding:10px;   " >
		<#if Session?exists&&Session["userlogined"]?exists>   用户：${Session["userlogined"].name?if_exists}  </#if><#--<a href="ea_user_profile.do" target=mainFrame></a>-->
		&nbsp;&nbsp;
  	<#if Session?exists&&Session["userlogined"]?exists>
		<#--
		<li><a href="ea_ea_menu_workhomepage.do" target=mainFrame>work-handbook</a> </li>
		<li style="padding-top: 10px;"><span>|</span></li>
		-->
        <a href="reset_password.ftl" target="mainFrame">Change Password</a>
        <#--
        <li><a href="access.ftl" target="mainFrame">access</a></li>
             -->
        </#if>
	   <#if Session?exists&&Session["currnetProject"]?exists>
				&nbsp;&nbsp;项目
				<select style="WIDTH: 130px"  id="userid"  onchange="javascript: changeProject(this.value)">
					<option value=${Session["currnetProject"].id?if_exists}>${Session["currnetProject"].name?if_exists}</option>
				    <#list  Session["projectList"] as p>
				    <option value=${p.id?if_exists}>${p.name?if_exists} </option>
					</#list>
				</select>
		</#if>
		<#if Session?exists&&Session["currnetProject"]?exists>
				&nbsp;&nbsp;部门     
			    <select style="WIDTH: 130px" id="userid"  onchange="javascript: changuser(this.value)">
				    <#list  Session["departmentList"] as department>
				    <option value=${department.id?if_exists}>${department.name?if_exists} </option>
					</#list>          
				</select>
		</#if>
        <br>
		<span id="div_action_result"></span>
	</div>   
        
  
      
</body>
   
</html>






