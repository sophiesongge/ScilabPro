<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script type="text/javascript">
<!--
	
	$(function(){
		$("a.loginAction").colorbox({contentWidth:"300px", contentHeight:"150px"});
		$("a.registerAction").colorbox({contentWidth:"450px", contentHeight:"180px", contentIframe:true});//contentIframe可能要去掉
			return false;
		});
		$(function(){
		$.fn.colorbox.settings.bgOpacity = "0.3";
		});
//-->
</script>
<div id="longinandregister" align="left">
     <a href="./login.jsp" class="loginAction" >Login</a> | <a href="./register.jsp" class="registerAction">Register</a>
</div>
<!--<s:property value="message"/>-->

