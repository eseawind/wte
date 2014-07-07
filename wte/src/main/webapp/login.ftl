<#include "common/freemarker/include_header.ftl">
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style type="text/css">
body {
	padding-top: 80px;
    padding-bottom: 40px;
    background-color: #f5f5f5;
}
.form-signin {
    max-width: 450px;
    padding: 20px 30px 30px;
    margin: 0 auto 20px;
    background-color: #fff;
    border: 1px solid #e5e5e5;
}
.form-signin input[type="text"],
.form-signin input[type="password"] {
    font-size: 16px;
    height: auto;
    margin-bottom: 15px;
    padding: 10px 9px;
}


</style>
</head>
<body>

<script>  
function changlang(value){
	document.getElementById('formlanmuadmin').submit();
}		
</script>

<body>
<div class="container">
	<form name="formlang" id="formlang" action="lang.do" method="post" >
	   <#---
                            language
	    <select class=input name="lang" size="1" onchange="document.getElementById('formlang').submit();" value="${Session["lang"]}">
			    <option value="${Session["lang"]}">${language_name[Session["lang"]]}</option>
			    <#list language_name?keys as key>
				   <option value="${key}">${language_name[key]}</option>
				</#list> 
		</select> 
		-->			                            
    </form>
                            
   	<form class="form-signin" name="loginForm" action="login.do" method="post">
        <table>
	        <tr >
	        	<td rowspan="2" style="width:130px; height:130px; border-right: 1px solid #e3e3e3;">
	        		<img src="common/images/login_1.jpg" style="width:100px;height:100px;" />
	        	</td>
	        	<td style="padding: 15px 0 0 30px;">
	        		<input type="text" class="input-block-level" placeholder="Account" name="account" value= >
	        	</td>
	        </tr>
	        <tr>
	        	<td style="padding-left: 30px;">
	        		<input type="password" class="input-block-level" placeholder="Password" name="password" value= >
			        <input type="hidden" class="text" name=sysName value="oa">
	        	</td>
	        </tr>
        
	        <!--
	        <label class="checkbox">
	          <input type="checkbox" value="remember-me"> Remember me
	        </label>
	        -->
        
	      	<tr>
	      		<td style="border-right: 1px solid #e3e3e3;"></td>
	      		<td style="padding-left: 30px;"> 
	        		<#-- rhs?exists>${rhs["tipInfo"]?if_exists}</#if> -->
	        		<button class="btn btn-xs btn-primary" style="padding: 3px 10px;" type="submit"> <@i18n "submit" /></button>
	        		<a href="login.do?method=forget" style="vertical-align: bottom; padding-left: 35px;">Forgot Password</a>
	        	</td>
	        </tr>
        </table>
     </form>
  </div> <!-- /container -->
  
  <div style="width: 450px; margin: 0 auto;background-color: #eee;">
  	<p style="text-align: center; padding: 5px; color: #428bca;"><small>${rhs["url"]?if_exists}</small></p>
  </div>
  
</body>
</html>
