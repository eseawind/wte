function action_item(url,para){
	if(url == "delete.do"){
		if (!confirm("Are you sure delete the question?")){
			return false;
		}
	}
  $.ajax({
         type:"POST",
         url: "exam_item_"+url,
         data:"id="+para,
         cache: false,
         success: function(html){
        	 document.getElementById('div_item_table').innerHTML=html;
        	 executeScript(html);
        	 tip_info(); 
           }
  });  
}

function executeScript(html)
{
    var reg = /<script[^>]*>([^\x00]+)$/i;
    //对整段HTML片段按<\/script>拆分
    var htmlBlock = html.split("<\/script>");
    for (var i in htmlBlock) 
    {
        var blocks;//匹配正则表达式的内容数组，blocks[1]就是真正的一段脚本内容，因为前面reg定义我们用了括号进行了捕获分组
        if (blocks = htmlBlock[i].match(reg)) 
        {
            //清除可能存在的注释标记，对于注释结尾-->可以忽略处理，eval一样能正常工作
            var code = blocks[1].replace(/<!--/, '');
            try 
            {
                eval(code) //执行脚本
            } 
            catch (e) 
            {
            }
        }
    }
}
