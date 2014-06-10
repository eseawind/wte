
<head>
<style>
#leftFrame {
	border-right-style: solid;
	border-right-width: 1px;
	border-right-color: #e2e2e2;
}
#topFrame {
border-bottom-style: solid;border-bottom-width: 3px;border-bottom-color: #224888;
}
</style>
</head>


<frameset rows="67,*" frameborder="no" marginwidth="0" framespacing="0" id="frameset01">
	<frame src="top.ftl" name="topFrame" scrolling="No" noresize="noresize" id="topFrame"/>
	<frameset cols="180,*" framespacing="0" frameborder="no" framespacing="0" id="frameset02">
		<frame src="adminmenu.do" name="leftFrame" frameborder="no" noresize="noresize" id="leftFrame" />
		<frame src="ea_user_menu_user.do" frameborder="0" scrolling="auto" noresize="noresize" name="mainFrame" id="mainFrame">
	</frameset>
</frameset>










