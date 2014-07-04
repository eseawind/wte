<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_custom.ftl">
<script type="text/javascript" src="common/ckeditor441/ckeditor.js"></script>
<script type="text/javascript">
	window.onload = function()
	{
		CKEDITOR.replace( 'text',{
			toolbar : [ 
							
							['Bold','Italic','Underline'] ,
							['Font','FontSize','TextColor','BGColor' ]
					  ]
		}); 
	}
</script>
			<form name="form_wo" action="exam_item_save.do" metiod="post">
				<div class="panel panel-primary">
				    <div class="panel-heading">
				    	<#if rhs.readonly> <@i18n "menu_item_view" /><#else><@i18n "menu_item_edit" /></#if>
				    </div>
					<div class="panel-body">
				 	<table class="table table-condensed table-bordered table-striped">
				 		<input type="hidden" id="objectid" name="item.id" value='<#if rhs["item"]?exists>${rhs["item"].id?if_exists}</#if>' />
						<tr>
							<td><@i18n "title_type" /> </td>
							<td>
								<input type="radio" name="item.type" value="1" onclick="javascript:generateitem(1)" <#if rhs["item"].type == 1> checked</#if> <#if rhs.readonly>disabled</#if>/><@i18n "title_single" />
								<input type="radio" name="item.type" value="2" onclick="javascript:generateitem(2)" <#if rhs["item"].type == 2> checked</#if> <#if rhs.readonly>disabled</#if>/><@i18n "title_multi" />
								<#--
								<input type="radio" name="item.type" value="3" onclick="javascript:generateitem(3)" <#if rhs["item"].type == 3> checked</#if> <#if rhs.readonly>disabled</#if>/><@i18n "title_blank" />
								<input type="radio" name="item.type" value="4" onclick="javascript:generateitem(4)" <#if rhs["item"].type == 4> checked</#if> <#if rhs.readonly>disabled</#if>/><@i18n "title_essay" />
							    -->
							</td>
						</tr>
						<tr>
							<td><@i18n "title_content" /></td>
							<td>
								<div>
									<textarea class='input' style='width:400px;' id='text' name='item.content' <#if rhs.readonly>disabled</#if> >${ rhs["item"].content?if_exists}</textarea><br/>
								</div>
								<div id="itemcontent">
									<#if rhs["item"].type == 1>
										<#if !rhs.readonly>
											<button style="margin-bottom: 5px;" id="option" class='btn btn-xs btn-primary' onclick='javascript:addoption(1);return false;'><@i18n "title_option_new" /></button>
										</#if>
										<div id='choice' >
											<#list rhs["item"].choiceitem as choiceitems>
												<input type='radio' name='item.refkey' value='${choiceitems.refid}' <#if rhs.readonly>disabled</#if><#if rhs["item"].refkey?exists&&rhs["item"].refkey?number==choiceitems.refid> checked</#if> /><input style='margin-left:3px;width:700px;' type='text' name='choiceitemvalue' value='${choiceitems.value?if_exists}' <#if rhs.readonly>disabled</#if>/><br/>
												<input type="hidden" name="choiceitemid" value='${choiceitems.id}' />
											</#list>
										</div>
									</#if>
									<#if rhs["item"].type == 2>
										<#if !rhs.readonly>
											<button style="margin-bottom: 5px;"  id="option" class='btn btn-xs btn-primary' onclick='javascript:addoption(2);return false;'><@i18n "title_option_new" /></button>
										</#if>
										<div id='choice' >
											<#list rhs["item"].choiceitem as choiceitems>
												<input type='checkbox' name='item.refkey' value='${choiceitems.refid}' <#if rhs.readonly>disabled</#if><#if rhs["item"].refkey?exists><#list rhs["item"].refkey?split(",") as key><#if (key?trim)?number==choiceitems.refid> checked</#if> </#list></#if> /><input style='margin-left:3px;width:700px;' type='text' name='choiceitemvalue' value='${choiceitems.value?if_exists}' <#if rhs.readonly>disabled</#if>/><br/>
												<input type="hidden" name="choiceitemid" value='${choiceitems.id}' />
											</#list>
										</div>
									</#if>
									<#if rhs["item"].type == 3>
										<input class='input' style='width:400px;' type='text' name='item.content' value='${rhs["item"].content?if_exists}' <#if rhs.readonly>disabled</#if>/><br/>
										<div class='btn btn-xs btn-primary'><@i18n "title_refkey" /><input class='input' style='width:340px;' type='text' value='${rhs["item"].refkey?if_exists}' name='item.refkey' <#if rhs.readonly>disabled</#if>/></div>
									</#if>
									<#if rhs["item"].type == 4>
										<textarea class='input' style='width:400px;height:100px' type='text' name='item.content' <#if rhs.readonly>disabled</#if> > ${rhs["item"].content?if_exists} </textarea><br/>
										<div class='btn btn-xs btn-primary'><@i18n "title_refkey" /><input class='input' style='width:340px;' type='text' value='${rhs["item"].refkey?if_exists}' name='item.refkey' <#if rhs.readonly>disabled</#if>/></div>
									</#if>
								</div>
							</td>
						</tr>
						
						<tr>
							<td><@i18n "title_knowledge" /></td>
							<td>
								<#list rhs["knowledgeRootList"] as knowledge>
									<#if knowledge.getChildKnowledges()?exists >
										<#list knowledge.getChildKnowledges() as knowledgenode>
											<input type="checkbox" name="knowledgevalue" value="${knowledgenode.id}" 
											<#list rhs["item"].knowledge as itemknowledge>
												<#if itemknowledge.id == knowledgenode.id> checked</#if>
											</#list>
											<#if rhs.readonly>
												disabled
											</#if>
											/>&nbsp;&nbsp;${knowledgenode.name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</#list>
									</#if>
								</#list>
							</td>
						</tr>
						<input class='input' <#if rhs.readonly>disabled</#if> type='hidden' value='<#if rhs["item"].mark?exists>${rhs["item"].mark}<#else>0</#if>' name='item.mark' />
						<#--<tr>
							<td><@i18n "title_mark" /></td>
							<td>
							</td>
						</tr>-->
						<tr>
							<td colspan="2" >
								<#if !rhs.readonly>
								    <input type="button" class="btn btn-xs btn-primary" value="Save" id="submitButton"/>
								</#if>
							    <a  class="btn btn-xs btn-primary" href="exam_item_list.do">Return</a>
							</td>
						</tr>
					</table>
					</div>
				</div>
			</form>
<script>
	var option_input_num = <#if rhs["item"].choiceitem?exists>${rhs["item"].choiceitem?size}<#else>4</#if>;
	$('#submitButton').click(function () {
		var btn = $(this);
		btn.button('loading');
		$('#dialog').dialog('open');
		document.getElementsByName("form_wo")[0].submit();
	});
	
	
	function generateitem(type){
		switch(type){
			case 1:
				//$("#itemcontent").html("<button style='margin-top:6px;' class='btn btn-xs btn-info' onclick='javascript:addoption(1);return false;'><@i18n "title_option_new" /></button><div id='choice' ><input type='radio' name='item.refkey' value='1'/><input style='margin-left:3px;width:700px;' type='text' name='choiceitemvalue' /><br/><input type='radio' value='2' name='item.refkey' /><input type='text' style='margin-left:3px;width:700px;' name='choiceitemvalue' /><br/><input type='radio' value='3' name='item.refkey' /><input style='margin-left:3px;width:700px;' type='text' name='choiceitemvalue' /><br/><input type='radio'  value='4' name='item.refkey' /><input style='margin-left:3px;width:700px;' type='text' name='choiceitemvalue' /><br/></div>");
				//$(":input[name='item.refkey']").attr("checked",false);
				$("#option").attr("onclick","javascript:addoption(1);return false;");
				$(":input[name='item.refkey']").attr("type","radio");
				var tmpcontent = $("#choice").html();
				$("#choice").html(tmpcontent);
				break;
			case 2:
				//$("#itemcontent").html("<button style='margin-top:6px;' class='btn btn-xs btn-info' onclick='javascript:addoption(2);return false;'><@i18n "title_option_new" /></button><div id='choice' ><input type='checkbox' name='item.refkey' value='1'/><input style='margin-left:3px;width:700px;' type='text' name='choiceitemvalue' /><br/><input type='checkbox' value='2' name='item.refkey' /><input type='text' style='margin-left:3px;width:700px;' name='choiceitemvalue' /><br/><input type='checkbox' value='3' name='item.refkey' /><input style='margin-left:3px;width:700px;' type='text' name='choiceitemvalue' /><br/><input type='checkbox' value='4' name='item.refkey' /><input style='margin-left:3px;width:700px;' type='text' name='choiceitemvalue' /><br/></div>");
				//$(":input[name='item.refkey']").attr("checked",false);
				$("#option").attr("onclick","javascript:addoption(2);return false;");
				$(":input[name='item.refkey']").attr("type","checkbox");
				var tmpcontent = $("#choice").html();
				$("#choice").html(tmpcontent);
				break;
			case 3:
				$("#itemcontent").html("<div class='btn btn-xs btn-info'><@i18n "title_refkey" /><input class='input' style='width:340px;' type='text' value='' name='item.refkey' /></div>");
				break;
			case 4:
				$("#itemcontent").html("<div class='btn btn-xs btn-info'><@i18n "title_refkey" /><input class='input' style='width:340px;' type='text' value='' name='item.refkey' /></div>");
				break;	
		}
	}
	
	function addoption(type){
		option_input_num += 1;
		var content = $("#choice").html();
		switch(type){
			case 1:
				$("#choice").html(content + "<input type='radio' name='item.refkey' value='"+ option_input_num +"'/><input style='margin-left:3px;width:700px;' type='text' name='choiceitemvalue' /><input type='hidden' name='choiceitemid' value='' /><br/>");
				break;
				
			case 2:
				$("#choice").html(content + "<input type='checkbox' name='item.refkey' value='"+ option_input_num +"'/><input style='margin-left:3px;width:700px;' type='text' name='choiceitemvalue' /><input type='hidden' name='choiceitemid' value='' /><br/>");
				break;
		}
	}
	
	
	$(function(){
		$('#dialog').dialog({
			autoOpen: false,
			modal: true,
			width: 400
		});
	});
</script>
