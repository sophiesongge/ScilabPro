<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Register Page</title>
		<script type="text/javascript" src="<s:url value="/js/jquery-1.4.2.min.js"/>"></script>
		<script type="text/javascript">
			var b = false;
			function isRegister(){
				var username = $("#userName").val();
				username = $.trim(username);
				if(username.length>0){
					$.ajax({
						type: "post", url: "<s:url value='/RegisterAction!isRegister'/>", data: "userInfo.userName="+username,
						success: function(e){
							if(e=='exist'){
								b = false;
								$("#isExist").text("Username“"+username+"”is still existed，please change!").attr("color", "red");
							}else if(e=="notexist"){
								b = true;
								$("#isExist").text("Username“"+username+"”can be used！").attr("color", "green");
							}
						}
					});
				}
			}
			function register(){
				var username = $("#userName").val();
				username = $.trim(username);
				if(username.length<1){
					$("#isExist").text("Please enter the username！").attr("color", "red");
					return false;
				}
				if(b){
					return true;
				}
				return false;
			}
		</script>
	</head>

	<body>
    <div id=regis align="center">
		Sign Up for ScilabCloud：
		</br>
		<s:form action="RegisterAction" namespace="/" method="post" theme="simple" onsubmit="return register()" >
			<table>
				<tr>
					<td style="">
						Username
					</td>
					<td>
						<s:textfield name="userInfo.userName" id="userName" label="账号" onblur="isRegister()" />
						<span id="isExist"></span>
					</td>
				</tr>
				<tr>
					<td style="">
						Password
					</td>
					<td>
						<s:password name="userInfo.password" label="密码" />
					</td>
				</tr>

				</tr>
				<tr>
					<td style="">
						<s:submit value="Sign Up" method="register"></s:submit>
					</td>
					<td style="">
						<s:reset value="Cancel" />
					</td>
				</tr>
			</table>
		</s:form>
		<s:fielderror cssStyle="color:red" />
        </div>
	</body>
</html>



