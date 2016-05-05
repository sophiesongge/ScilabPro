<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'FunInput.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body> 
  
    <s:form action="FunInputAction" namespace="/" method="post">
    	<s:textfield name="functionInfo.funName" label="函数名" size="10"  maxlength="100" cssStyle="width:450px"></s:textfield><br/>
    	<s:textarea name="functionInfo.funContent" label="函数本体" cols="50" rows="20" ></s:textarea><br/>
    	<s:textarea name="functionInfo.funExample" label="使用范例" cols="50" rows="20"></s:textarea><br/>
    	<s:textarea name="functionInfo.funHelp" label="备注说明"cols="50" rows="20"></s:textarea><br/>
    	<s:submit value="提交发布" method="Input"></s:submit>
    </s:form>
  </body>
</html>