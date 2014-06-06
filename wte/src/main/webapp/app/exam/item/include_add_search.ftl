<p class="pull-right" >
      <div class="panel panel-info pull-right" style="width:auto" >
        <div class="panel-heading" onclick="javascript:show_dir();"><strong><@i18n "title_search" />:</strong></div>
        <div class="panel-body" style="display:none;" id="content">
 			 <form action="exam_item_list.do" id="search_form" method="post" > <#-- 该ID需当参数传入分页的宏	-->
				<input type="hidden" name="search" value="search">  					<#-- 这里必须加上，不然不会进行条件查询，且name和value不能修改其他值-->
				<input type="hidden" name="pageId" id="pageId">      					<#-- 这里必须加上，不然分页模块会不正常，且id和name不能修改为其他值	-->
				<input type="hidden" name="maxSize" id="pageMaxSize">      		        <#-- 这里必须加上，不然修改显示条数会不正常，且id和name不能修改为其他值	-->
				<input type="hidden" name="orderBy" id="orderBy" value=${rhs["orderBy"]?if_exists}>
				<#list rhs["knowledgeRootList"] as knowledge>
					<#if knowledge.getChildKnowledges()?exists >
						<#list knowledge.getChildKnowledges() as knowledgenode>
							
							<input type="checkbox" <#list rhs["knowledgevalue"] as val> <#if val?number == knowledgenode.id >checked</#if> </#list> onclick="document.getElementById('search_form').submit();" name="knowledgevalue" value="${knowledgenode.id}"/>&nbsp;&nbsp;${knowledgenode.name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
						</#list>
					</#if>
				</#list>
				<input onclick="document.getElementById('search_form').submit();" <#list rhs["itemtype"] as val> <#if (val?number == 1) >checked</#if> </#list> type="checkbox" name="itemtype" value="1"/>&nbsp;&nbsp;Single Choice&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input onclick="document.getElementById('search_form').submit();" <#list rhs["itemtype"] as val> <#if (val?number == 2) >checked</#if> </#list> type="checkbox" name="itemtype" value="2"/>&nbsp;&nbsp;Multi Choice&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input onclick="document.getElementById('search_form').submit();" <#list rhs["itemtype"] as val> <#if (val?number == 3) >checked</#if> </#list> type="checkbox" name="itemtype" value="3"/>&nbsp;&nbsp;Blank&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input onclick="document.getElementById('search_form').submit();" <#list rhs["itemtype"] as val> <#if (val?number == 4) >checked</#if> </#list> type="checkbox" name="itemtype" value="4"/>&nbsp;&nbsp;Essay&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-default btn-xs" value="Search" onclick="javascript: submit_form('','search')" />
				<#--Order By: 
				<a href="#" onclick="javascript: submit_form('priority')">优先级</a>
				<a href="#" onclick="javascript: submit_form('endTime')">计划结束时间</a>-->
			</form>         
        </div>
      </div>


</p>
<script type="text/javascript">

Date.prototype.format =function(format)
{
	var o = {
	"M+" : this.getMonth()+1, //month
	"d+" : this.getDate(), //day
	"h+" : this.getHours(), //hour
	"m+" : this.getMinutes(), //minute
	"s+" : this.getSeconds(), //second
	"q+" : Math.floor((this.getMonth()+3)/3), //quarter
	"S" : this.getMilliseconds() //millisecond
	}
	if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
	(this.getFullYear()+"").substr(4- RegExp.$1.length));
	for(var k in o)if(new RegExp("("+ k +")").test(format))
	format = format.replace(RegExp.$1,
	RegExp.$1.length==1? o[k] :
	("00"+ o[k]).substr((""+ o[k]).length));
	return format;
}

	$(document).ready(function(){
		var myDate = new Date().format('yyyy-MM-dd');
		$("#autoEndtime").val(myDate);
	});


function  show_dir(){  //定位层
	  if( document.getElementById('content').style.display=='none'){
	  	document.getElementById('content').style.display='block';
	  }else{
	    document.getElementById('content').style.display='none';
	  }
}

function submit_form(orderByVal,operation) {

	if("search" == operation){
		form = document.getElementById("search_form");
		form.orderBy.value = orderByVal;
		form.submit();
	}
}
</script>
       