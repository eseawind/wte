<#include "../../../common/freemarker/include_header.ftl">
<script type="text/javascript">
	<#if !rhs["flag"]>
	<#else>
		alert('${rhs["info"]}');
	</#if>
</script>
<#include "ajax_paper.ftl">
