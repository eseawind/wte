<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_custom.ftl">
<form name="form_item" action="exam_item_import_itembyxls_save.do" method="post" enctype="multipart/form-data" >
<input type="hidden" name="method" value="${rhs["method"]}" />
	<div class="panel panel-custom"">
		<div class="panel-heading"><strong><@i18n "menu_item_import" /></strong></div>
		<div class="panel-body">
		 
             <table >
                 <tr>
                 	<td>
                 		<b>Please select Excel file which you want to upload.</b><input type="File" style="width:300px" name="file" id="file"/> 
						<br>
						<p align=left>
							&nbsp;<input type="button" class="btn btn-xs btn-custom" value="Submit" id="submitButton"/>	
						</p>				
                 	</td>
                 </tr>
				 <tr>
				 	<td>
					 <#if rhs["exception"]?exists>
						 <div>
							 <#list rhs["exception"]?keys as exception>
							 	<div style="padding: 2px 7px; color: #fff; background-color: #f9ae90; font-weight:bolder;">${exception}</div>
							 	<#list rhs["exception"][exception] as status>
							 	<div style="padding: 3px 0 3px 5px; background-color: #fff6f3; ">${status}</div>
							 	</#list>
							 	<br/>
							 </#list>
						 </div>
					 </#if>
				 
					<b style="display: block; margin-top: 10px; margin-bottom: 5px;">Template Preview <span style="color: orange;">(You can click the picture as below directly to download the template.)</span></b>
					<a href="exam_item_getItemTemplate.do"><img width="75%" src="<@context/>common/images/uploadtemplate.jpg" alt="Upload file template" "/></a></td>
                 	</td>
                 </tr>
             </table>
             
                <#---
				<tr>
					<td colspan="2">
						1. 上传的excel需根据下面的模板一致。表格头的第一列为"知识领域"、第二列为"题型"、第三列为"题目内容"、第四列为"题目分值"、第五列为"正确答案"、后面的列分别是选项。
						<br/>2. 目前支持的题型为: "1"为单项选择题、"2"为多项选择题、"3"为填空题、"4"为问答题。
						<br/>3. 对于单项选择题，其Answer一列，值应该为1到选项最大个数。不应该超过最大选项个数。
						对于多项选择题，多个选项答案，用英文逗号分隔。
						<br/>4. 对于填空和问答题，不应该有选项列。
					</td>
				</tr>
				-->
		</div>
	</div>
</form>
<script>
	$('#submitButton').click(function () {
		var file = $('#file').val();
		var index=file.lastIndexOf('.'); 
        var filetype=file.substr(index,4);
		if(file == ""){
			alert("Please select Question Template File!");
			return false;
		}
		if(filetype != ".xls"){
			alert("Please select Excel File!");
			return false;
		}
		var btn = $(this);
		btn.button('loading');
		$('#dialog').dialog('open');
		document.getElementsByName("form_item")[0].submit();
	});
	
	function gettemplate(){
	  $.ajax({
	         type:"POST",
	         url: "exam_item_getItemTemplate.do",
	         data: "",
	         cache: false,
	         success: function(html){
	        	 //document.getElementById('div_item_table').innerHTML=html;
	          }
	  });  
	}
</script>