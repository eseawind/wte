
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="common/jqueryui183/css/jqui1813/smoothness/jquery-ui-1.8.13.custom.css" media="screen" />

<link href="common/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="common/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<!--[if lte IE 6]>
<link rel="stylesheet" type="text/css" href="common/ddouble-bsie-v1.05/bootstrap/css/bootstrap-ie6.css">
<![endif]-->
<!--[if lte IE 7]>
<link rel="stylesheet" type="text/css" href="common/ddouble-bsie-v1.05/bootstrap/css/ie.css">
<![endif]-->
<link rel="stylesheet" type="text/css" href="common/jquery-plugins/zTree/css/zTreeStyle/zTreeStyle.css" />
	
<script type="text/javascript" src="common/jquery151/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="common/jqueryui183/jquery-ui-1.8.13.custom.min.js"></script>
<script type="text/javascript" src="common/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="common/jquery-plugins/zTree/js/jquery.ztree.core-3.5.js"></script>

<script type="text/javascript" src="common/bootstrap/js/bootstrap.min.js"></script>
<!--
<link rel="stylesheet" type="text/css" href="common/highslide/highslide.css" />
<script type="text/javascript"          src="common/highslide/highslide-with-html.js"></script>
-->
<link rel="stylesheet" type="text/css" href="common/highslide-4-1-13/highslide/highslide.css" />
<script type="text/javascript"          src="common/highslide-4-1-13/highslide/highslide-with-html.js"></script>
<style type="text/css">
	* {font-family:inherit,Arial,verdana,tahoma;margin:0px;padding:0px;
		font-size:11px;
	}
	a{color: #224888;}
	ul#icons li {cursor: pointer; float: left;  list-style: none;}
		ul#icons span.ui-icon {float: left; margin: 0 2px;}
	.ui-icon  { cursor: pointer; float: left;  }
</style>
<style>
.table-indie {
	margin-left: 10px;
}
.table th{
	background:#efefef;
}
.table-indie th, .table-indie td {
	vertical-align: middle;
	text-align: center;
}
select, input[type="text"] {
	margin-bottom: 0px;
	
	box-shadow: none;
	//text-align: center;
}
</style>
<script type="text/javascript">
function rowOver(target) 
{ 
    target.bgColor='#efefef'; 
  //   target.style.borderColor="000";
} 
function rowOut(target) 
{ 
    target.bgColor='#ffffff'; 
  //  target.style.borderColor="";
} 
</script>
<script type="text/javascript" >
	//hs.graphicsDir = 'common/highslide/graphics/';
	hs.graphicsDir = 'common/highslide-4-1-13/highslide/graphics/';
	hs.outlineType = 'rounded-white';
	hs.wrapperClassName = 'draggable-header';
	
	hs.minWidth=800;
	hs.minHeight=800;
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
</script>	
</head>	

<body><script language="javascript" src="app/ea/view/view_organize.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<style>
*{font-size: 12px;}
.zz {
	height: 1200px;	width: 958px auto;border: 0px solid #CCCCCC;
	margin-top: 5px;margin-bottom: 5px;margin-left:auto;margin-right:auto; 
}
a {font-family: "宋体";font-size: 12px;color: #000;text-decoration: none;cursor:hand}
</style>

			<div class="highslide-html-content" id="win_233">
				<div class="highslide-header">
					<ul>
						<li class="highslide-move">RAYOO
							<a href="#" onclick="return false"></a>
						</li>
						<li class="highslide-close">
							<a href="#" onclick="return hs.close(this)">x</a>
						</li>
									
					</ul>
				</div>
				<div class="highslide-body">
				   <p>
				   RAYOO<br>
				   bbbbbb
				   </p>
				</div>
			    <div class="highslide-footer">
			        <div>
			            <span class="highslide-resize" title="Resize">
			            </span>
			        </div>
			    </div>
			</div>
			
			<a style="display:none" id="link_win_233" onclick='return hs.htmlExpand(this, { contentId: "win_233" } )'  class=highslide>RAYOO</a>
			
			<script>
				function win_233()
				{ document.getElementById("link_win_233").onclick();}
			</script>
		
			<div class="highslide-html-content" id="win_234">
				<div class="highslide-header">
					<ul>
						<li class="highslide-move">ODC4566
							<a href="#" onclick="return false"></a>
						</li>
						<li class="highslide-close">
							<a href="#" onclick="return hs.close(this)">x</a>
						</li>
									
					</ul>
				</div>
				<div class="highslide-body">
				   <p>
				   ODC4566<br>
				   bbbbbbb
				   </p>
				</div>
			    <div class="highslide-footer">
			        <div>
			            <span class="highslide-resize" title="Resize">
			            </span>
			        </div>
			    </div>
			</div>
			
			<a style="display:none" id="link_win_234" onclick='return hs.htmlExpand(this, { contentId: "win_234" } )'  class=highslide>ODC4566</a>
			
			<script>
				function win_234()
				{ document.getElementById("link_win_234").onclick();}
			</script>
		
	<div class="zz">
		<script language="javascript"> 
			var n1=new OrgNode();
			n1.Text="<span style='padding:4px;border:1px solid #000;'><b>GSC-APP-design</b></span>";
			n1.Description="";
			n1.Link="";
   	        var organize233=new OrgNode(); 
     	    organize233.Text="<span style='padding:4px;border:1px solid #000;'><b>RAYOO</b></span><div style='margin:10px;'><div style='overflow:hidden;width:130px;height:24px;'>bbbbbb</div></div> ";
			organize233.Description="RAYOO";
			organize233.Link="win_233()";
			n1.Nodes.Add(organize233);
   	        var organize234=new OrgNode(); 
     	    organize234.Text="<span style='padding:4px;border:1px solid #000;'><b>ODC4566</b></span><div style='margin:10px;'><div style='overflow:hidden;width:130px;height:24px;'>bbbbbbb</div></div> ";
			organize234.Description="ODC4566";
			organize234.Link="win_234()";
			n1.Nodes.Add(organize234);
	var OrgShows=new OrgShow(n1);
	OrgShows.Top=75;
	OrgShows.Left=20;
	OrgShows.IntervalWidth=2;
	OrgShows.IntervalHeight=50;
	OrgShows.ShowType=1; //2代表文字是竖的
	OrgShows.BoxHeight=22; //高度
	OrgShows.BoxWidth=174; //宽度
	OrgShows.LineSize=2;  //设置线条大小
	OrgShows.LineColor="#000";  //设置线条颜色
	OrgShows.Run();
		</script>
	</div>	    
</body>
