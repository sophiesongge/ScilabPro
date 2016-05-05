<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" errorPage="ErrorPage.html"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
	<script type="text/javascript">
		function login(){
			var userName = $("#userName").val();
			userName = $.trim(userName);
			if(userName.length<1){
				alert("Please enter a username!");
				return false;
			}
			var password = $("#password").val();
			if(password.length<1){
				alert("Please enter your password!");
				return false;
			}
			var options = {
				type: "post", url: "<s:url value='/LoginAction!login'/>",
				success:function(e){
					$("#loginDiv").html(e);
				}
			};
			$("#loginForm").ajaxSubmit(options);
			return false;
		}
	</script>

	
        <p>
        <div id="LeftOperation"><a href="./PageRun.jsp" ><img src="images/LeftOperation.png" width="200" height="80" alt="LeftOperation" longdesc="images/LeftOperation.png" /></a></div>
        <div id="LeftFunction"><a href="fun_getReleasedFunList" ><img src="images/LeftFunction.png" width="200" height="80" alt="LeftFunction" longdesc="images/LeftFunction.png" /></a></div>
        <div id="LeftShow"><a href="./Show.jsp" ><img src="images/LeftShow.png" width="200" height="80" alt="LeftShow" longdesc="images/LeftShow.png" /></a></div>
        <div id="LeftTeam"><a href="./Team.jsp" ><img src="images/LeftTeam.png" width="200" height="80" alt="LeftTeam" longdesc="images/LeftTeam.png" /></a></div>
        <div id="LeftLinks"><a href="./Link.jsp" ><img src="images/LeftLinks.png" width="200" height="80" alt="LeftLinks" longdesc="images/LeftLinks.png" /></a></div>
        </p>