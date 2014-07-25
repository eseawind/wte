<#include "common/freemarker/include_header.ftl">
<style type="text/css">
	a{
		color: #224888; 
	}
	.logo{
		padding-top:20px; 
		padding-left:30px;
	}
	#title-text{
		padding: 25px 0 0 34px;
	}
	#title-text span{
		font-size: 30px;
		color: #8a6d3b;;
	}
	.pull-right{
		padding-top: 45px;
		margin-right: 30px;
	}

</style>
<script>
function action_login(url,para){
	  $.ajax({
	         type:"POST",
	         url: url,
	         data:"method="+para,
	         cache: false,
	         success: function(html){
	         	if("logout" == para){
	        	 window.parent.location = "lang.do"; 
	         	}
	         }
	  });  
	}
function   showdialog(url){
	  if(window.name=="fullscreen")
	  	return; 
	  var a =window.open(url,"fullscreen","location=no,fullscreen=0,scrollbars=yes,height=300,width=400");
	}
</script>
<body>
<div style="height:80px; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #e2e2e2;">
    <div class="pull-left" id="title-text">
    	<span>Site Activity Certification Examination System</span>
    </div>
    <div class="pull-right">
		<div>
			<#if Session?exists&&Session["userlogined"]?exists>User：${Session["userlogined"].name?if_exists}  </#if><#--<a href="ea_user_profile.do" target=mainFrame></a>-->
				&nbsp;&nbsp;
  	    	<#if Session?exists&&Session["userlogined"]?exists>
			
        	<a href="#" onclick="javascript:showdialog('reset_password.ftl');">Change Password</a>&nbsp;&nbsp;|&nbsp;&nbsp;
        	<a onclick="javascript:action_login('login.do','logout');" href="#">Log Out</a>
        </div>
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
</div>  
</body>
   
</html>






