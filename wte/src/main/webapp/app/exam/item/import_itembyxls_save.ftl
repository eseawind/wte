<script type="text/javascript">
<#if rhs["method"] == 'item'>
	document.location.href = 'exam_item_list.do';
<#else>
	document.location.href = 'exam_paper_list.do';
</#if>
</script>