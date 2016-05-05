<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" errorPage="ErrorPage.html"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<script type="text/javascript">
		function signout(){
			
			var options = {
				type: "post", url: "<s:url value='/SignoutAction!signout'/>",
				success:function(e){
					$("#LoginPersonal").html(e);
				}
			};
			$("#signoutForm").ajaxSubmit(options);
			return false;
		}
	</script>
	<script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
	<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
	
<div id="LoginSucc">
<s:if test="#session.user!=null">Have a nice day! Dear&ldquo;${sessionScope.user.userName}&rdquo;，Enjoy your journey on ScilabOnline！</s:if>
<s:else>Sign In Failed</s:else></div>
<div ><a href="SignoutAction!signout" class="SignOutTop">Quit</a></div>  
