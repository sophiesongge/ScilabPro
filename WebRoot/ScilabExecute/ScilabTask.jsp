<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'MyJsp.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script language="Javascript" type="text/javascript" src="<%=basePath%>edit_area/edit_area_full.js"></script>
		<script type="text/javascript" src="<s:url value="/js/jquery-1.4.2.min.js"/>"></script>
		<script type="text/javascript" src="<s:url value="/js/plugin/jquery.form.js"/>"></script>
		<link type="text/css" media="screen" rel="stylesheet" href="<s:url value='/js/plugin/colorbox/colorbox.css'/>" />
		<link type="text/css" media="screen" rel="stylesheet" href="<s:url value='/js/plugin/colorbox/colorbox-custom.css'/>" />
		
		<script type="text/javascript" src="<s:url value="/js/plugin/colorbox/jquery.colorbox.js"/>"></script>
		
		<script type="text/javascript">
	editAreaLoader
			.init( {
				id : "scilabtask_1", // id of the textarea to transform					
				start_highlight : true,
				font_size : "10",
				font_family : "verdana, monospace",
				allow_resize : "y",
				allow_toggle : false,

				language : "zh",
				syntax : "php",
				toolbar : "new_document, save, load, |, search, go_to_line, |, undo, redo, |, select_font, |, highlight",
				plugins : "charmap",
				charmap_default : "arrows",
				is_multi_files : false

			});
	function my_save(id, content) {
		document.getElementById("myForm").submit();
	}

	function my_load(id) {
		editAreaLoader
				.setValue(id,
						"The content is loaded from the load_callback function into EditArea");
	}
	function validate(){
		var taskName = $("#myForm_taskName").val();
		taskName = $.trim(taskName);
		var taskContent = $("#scilabtask_1").val();
		taskContent = $.trim(taskContent);
		if (taskName.length==0) {
			alert("请输入任务名");
			return false;
		}
		if (taskContent.length==0) {
			alert("请输入SCILAB代码");
			return false;
		}
		var options = {
				type: "post", url: "<s:url value='/TaskAction!submitTask'/>",
				success:function(e){
					if($("#myTask div").size()==0){
						$("#myTask").html(e);
					}else{
						$(e).insertBefore("#myTask div:eq(0)");
					}
				}
			};
			$("#myForm").ajaxSubmit(options);
			return false;
	}
	function validate1(){
		var taskname = $("#checkForm_taskname").val();
		taskname = $.trim(taskname);
		if (taskname.length==0) {
			alert("请输入任务名");
			return false;
		}
		var options = {
				type: "post", url: "<s:url value='/CheckTask!getResult'/>",
				success:function(e){
					$("#myResult").html(e);
				}
			};
			$("#checkForm").ajaxSubmit(options);
			return false;
	}
	
	function statueAjax(){
		var taskname = $("#checkForm_taskname").val();
		taskname = $.trim(taskname);
		if (taskname.length==0) {
			alert("请输入任务名");
			return false;
		}
		$.ajax({
			type: "post", url: "CheckTask!getStatue", data: "taskname="+taskname+"&date="+new Date(),
			success:function(e){
				$("#myajaxdiv").html(e);
			}
		});
	}
	$(function(){
		$.fn.colorbox.settings.bgOpacity = "0.3";
	});
	function saveAjax(){
		var taskname = $("#checkForm_taskname").val();
		taskname = $.trim(taskname);
		if (taskname.length==0) {
			alert("请输入任务名");
			return false;
		}
		$.ajax({
			type: "post", url: "CheckTask!saveTask", data: "taskname="+taskname+"&date="+new Date(),
			success:function(e){
			$("#myajaxdiv").html(e);
		}
	});
	}
	$(function(){
		$.fn.colorbox.settings.bgOpacity = "0.3";
	});
	function statueAjax(){
		var taskname = $("#checkForm_taskname").val();
		taskname = $.trim(taskname);
		if (taskname.length==0) {
			alert("请输入任务名");
			return false;
		}
		$.ajax({
			type: "post", url: "CheckTask!getStatue", data: "taskname="+taskname+"&date="+new Date(),
			success:function(e){
				$("#myajaxdiv").html(e);
			}
		});
	}
	$(function(){
		$.fn.colorbox.settings.bgOpacity = "0.3";
	});
</script>
	</head>
	<body>

		<s:form action='TaskAction' method='post' id="myForm" target="_blank"
			theme="simple" onsubmit="return validate()">
			<p>
				Task name:
				<input type="text" name="task.taskName" id="myForm_taskName" />
			</p>
			<textarea id="scilabtask_1" style="height: 500px; width: 600px;"
				name="task.taskContent">you can write scilab codes here!</textarea>
			<br />
			<s:submit value='提交任务' method="submitTask"/>
		</s:form>
		
		<div id="myTask"></div>
	</body>
</html>