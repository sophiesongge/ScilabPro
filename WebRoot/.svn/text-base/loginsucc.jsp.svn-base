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
    <script type="text/javascript"> 
   
window.setTimeout("goUrl()",1000); //1000 表示1秒后刷新
function goUrl(){
window.location.href="index.jsp";//刷新
}
</script>
  	<s:if test="#session.user!=null">Have a nice day, Dear “${sessionScope.user.userName}”,you have signed in successfully!</s:if>
  	<s:else>Sign In Failed..</s:else>
  	<p>The page will refresh.</p>
