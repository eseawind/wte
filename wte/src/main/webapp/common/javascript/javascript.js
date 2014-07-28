<script type="text/javascript" >

	hs.graphicsDir = '<@context/>common/highslide-4-1-13/highslide/graphics/';
	hs.outlineType = 'rounded-white';
	hs.wrapperClassName = 'draggable-header';
	hs.minWidth=600;
	hs.minHeight=870;
    hs.preserveContent=false;
	
	function tip_info() {
	    $('#div_action_result',window.parent.parent.frames['topFrame'].document).html(document.getElementById('div_action_result').innerHTML);
        setTimeout( "$('#div_action_result',window.parent.parent.frames['topFrame'].document).html('')", 2000);
       	 
	}	
		
	function action_common(url,para){
		$.ajax({
	        type:"POST",
	        url: url,
	        data:para,
	        cache: false,
	        success: function(html){
	            document.getElementById('div_action_result').innerHTML=html;
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
</script>