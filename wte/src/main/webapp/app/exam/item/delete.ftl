<#include "../../../common/freemarker/include_header.ftl">
<#if !rhs["flag"]>

<#else>
	<script type="text/javascript">
		alert('${rhs["info"]}');
	</script>
</#if>
<#include "list.ftl">