<#macro pagination searchFromId>
<script>
function page_list_commit(pageNo){
	document.getElementById('pageId').value = pageNo;
	document.getElementById('pageMaxSize').value = $("#changeMaxSize").val();
	$('#${searchFromId}').submit();	
}
</script>

<p align=right>
	<#-- ${rhs.count} -->
	    <#if (rhs.currentPage > 1)><a onclick="javascript:page_list_commit(${rhs.currentPage-1})" href="#">«</a></#if><#-- 上一页 -->
	    <#if (rhs.currentPage > 1)><a onclick="javascript:page_list_commit(1)" href="#"> 1</a>&nbsp;···&nbsp;</#if><#-- 第一页 -->
	    <a href="#">${rhs.currentPage}</a>&nbsp;<#-- 本页 -->
	    <#if (rhs.currentPage < rhs.maxPage)>···&nbsp;<a onclick="javascript:page_list_commit(${rhs.maxPage})" href="#">${rhs.maxPage}</a></#if><#-- 最后一页 -->
	    <#if (rhs.currentPage < rhs.maxPage)><a onclick="javascript:page_list_commit(${rhs.currentPage+1})" href="#">»</a></#if><#-- 下一页  -->
	   
	   <#--&nbsp;Current:${rhs.currentPage}/${rhs.maxPage} Page,-->
		&nbsp;Total: ${rhs.count}&nbsp;
		<select style="WIDTH: 60px"  id=changeMaxSize onchange="javascript:page_list_commit(1)" >
		    <option value="${rhs.maxSize}">${rhs.maxSize}</option>
			<option value="5">5</option>
			<option value="10">10</option>
			<option value="20">20</option>
			<option value="50">50</option>
			<option value="200">200</option>
		<select>
</P>
</#macro>