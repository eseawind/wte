<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_custom.ftl">
<#if rhs["result"]?exists>
<div class="panel panel-custom" style="margin-top: 18px;">
      <div class="panel-heading"><strong>Arrange Examination</strong></div>
      <div class="panel-body">
      	 <table class="table table-condensed table-bordered table-striped">
      		<tr>
      			<td>
				<div>
				 <#list rhs["result"]?keys as mail>
				 	<div style="padding: 2px 7px; color: #fff; background-color: #f9ae90; font-weight:bolder;">${mail}</div>
				 	<div style="padding: 3px 0 3px 5px; background-color: #fff6f3; ">${rhs["result"][mail]}</div>
				 	<br/>
				</#list>
			 	</div>
			 	</td>
			 </tr>
			 <tr>
			 	<td align="center">
	 				<a  class="btn btn-xs btn-custom" href="exam_paper_list.do">Return</a>
			 	</td>
			 </tr>
<#else>
	<script type="text/javascript">
		document.location.href = '${rhs["page"]}?resultMessage=${rhs["resultMessage"]}';
		window.opener.location.href = 'exam_exam_exam_complete.do';
		window.close();
	</script>
</#if>