<#include "../../../common/freemarker/include_header.ftl">
<div class="panel panel-primary" style="margin-top: 18px;">
      <div class="panel-heading"><strong>View Paper</strong></div>
      <div class="panel-body">
		<br />
      	<table class="table table-condensed table-bordered table-striped">
      		<tr><td colspan="8"><font color="red"><strong>
      			Preview</strong></font>
      		</td>
      		</tr>
      		<tr>
      			<td><strong><@i18n "title_name" /></strong></td>
      			<td><#if rhs["paper"]?exists > ${rhs["paper"].name}</#if></td>
      			<td><strong><@i18n "title_examtime" /></strong></td>
      			<td><#if rhs["paper"]?exists > ${rhs["paper"].time}</#if></td>
      			<td><strong><@i18n "title_totalmark" /></strong></td>
      			<td><#if rhs["paper"]?exists > ${rhs["paper"].totalmark}</#if></td>
      			<td><strong><@i18n "title_passmark" /></strong></td>
      			<td><#if rhs["paper"]?exists > ${rhs["paper"].passmark}</#if></td>
      		</tr>
      	</table>
      	<#assign i = 0 >
  		<table class="table table-condensed table-bordered table-striped">
		  	<strong><@i18n "title_single" /></strong>(total:${rhs["template"].singlechoice + rhs["template"].rmdsinglechoice})
		  	<#list rhs["singleitems"]?sort_by("id") as singleitem>
				<tr>
					<td><strong>${singleitem_index+1}.&nbsp;${singleitem.content}</strong><div class="pull-right">&nbsp;&nbsp;&nbsp;Score:<#if singleitem.mark?exists&&singleitem.mark!="">${singleitem.mark}<#else>${rhs["paper"].singlechoicemark}</#if></div></td>
				<tr>
				<#list singleitem.choiceitem?sort_by("id") as choiceitem>
					<tr>
						<td><input disabled type="radio" value="${choiceitem.refid}" name="result[${i}].answer"/> ${choiceitem.value}</td>
					</tr>
				</#list>
				<#assign i = i + 1 > 
		  	</#list>
      	</table>
      </div>
</div>
