<#if rhs["find"]?exists && !rhs["find"]>
	
<#else>
	<script type="text/javascript" defer="defer">
		alert("${rhs["result"]}");
	</script>
</#if>
<#include "ajax_user.ftl">