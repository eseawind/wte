<#include "common/freemarker/include_header.ftl">
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">

    <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 400px;
        padding: 19px 29px 29px;
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
      <form class="form-signin" name="loginForm" action="login.do?method=forget" method="post">
        <table>
	        <tr >
	        	<td rowspan="2" style="width:130px; height:130px; border-right: 1px solid #e3e3e3;">
	        		<img src="common/images/login_1.jpg" style="width:100px;height:100px;" />
	        	</td>
	        	<td style="padding: 15px 0 0 30px;">
	        		Input You Account:
	        	</td>
	        </tr>
        	<tr>
	        	<td style="padding-left: 30px;">
	        		<input type="text" class="input-block-level" placeholder="Account" name="account" value= >
	        	</td>
	        </tr>
	      	<tr>
	      		<td style="border-right: 1px solid #e3e3e3;"></td>
	      		<td style="padding-left: 30px;"> 
	        		<button class="btn btn-xs btn-primary" style="padding: 3px 10px;" type="submit"> <@i18n "submit" /></button>
	        	</td>
	        </tr>
        </table>
      </form>
    </div> <!-- /container -->

  
  <div style="width: 450px; margin: 0 auto;background-color: #eee;">
  	<p style="text-align: center; padding: 5px; color: #428bca;"><small>${rhs["tipInfo"]?if_exists}</small><small>${rhs["url"]?if_exists}</small></p>
  </div>
  </body>
</html>
