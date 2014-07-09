<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_custom.ftl">
<script type="text/javascript">
	<#if !rhs["flag"]>
	<#else>
		alert('${rhs["info"]}');
	</#if>
</script>
<#include "ajax_paper.ftl">
