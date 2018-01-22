<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Sendmsg</title>
</head>
<body>
<form action="/SmartOrder/Queue/Sendmsg/sendmsg" method="POST">
	号　码：<input type='text' name='num'/><br/>
	手机号：<input type='text' name='mobile'/><br/>
	时　间：<input type='text' name='time'/><br/>
	<input type="submit" value="发送"/>
</form>
</body>
</html>