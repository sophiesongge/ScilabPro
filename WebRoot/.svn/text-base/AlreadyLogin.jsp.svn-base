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
    <p>
        <div id="LeftSignout"><a href="SignoutAction!signout" ><img src="images/LeftSignout.png" width="200" height="80" alt="LeftSignout" longdesc="images/LeftSignout.png" /></a></div>
        <div id="LeftRunScilabOnline"><a href="./PageRun.jsp" ><img src="images/LeftRunScilabOnline.png" width="200" height="80" alt="LeftRunScilabOnline" longdesc="images/LeftRunScilabOnline.png" /></a></div>
        <div id="LeftViewMyTaskList"><a href="task_getAllTask?id=${task.taskId}"><img src="images/LeftViewMyTaskList.png" width="200" height="80" alt="LeftViewMyTaskList" longdesc="images/LeftViewMyTaskList.png" /></a></div>
        <div id="LeftViewMyFunctions"><a href="fun_getAllFunctions"><img src="images/LeftViewMyFunctionsList.png" width="200" height="80" alt="LeftViewMyFunctionsList" longdesc="images/LeftViewMyFunctions.png" /></a></div>
        <div id="LeftShareMyFunctions"><a href="./PageFunctionInput.jsp"><img src="images/LeftShareMyFunctionsList.png" width="200" height="80" alt="LeftShareMyFunctionsList" longdesc="images/LeftShareMyFunctions.png" /></a></div>
    </p>

  
