
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" errorPage="ErrorPage.html"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>"/>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="Scilab,Cloud,Online"/>
	<meta http-equiv="description" content="Scilab Cloud Online"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />
    <link type="text/css" media="screen" rel="stylesheet" href="<s:url value='/js/plugin/colorbox/colorbox.css'/>" />
	<link type="text/css" media="screen" rel="stylesheet" href="<s:url value='/js/plugin/colorbox/colorbox-custom.css'/>" />
	<script type="text/javascript" src="js/jquery-1.2.6.pack.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="Scripts/swfobject_modified.js" ></script>
	<script type="text/javascript" src="js/plugin/jquery.form.js"></script> 
    <script type="text/javascript" src="js/plugin/colorbox/jquery.colorbox.js"></script>
         
    <script type="text/javascript">
<!--//导航条JS
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_nbGroup(event, grpName) { //v6.0
  var i,img,nbArr,args=MM_nbGroup.arguments;
  if (event == "init" && args.length > 2) {
    if ((img = MM_findObj(args[2])) != null && !img.MM_init) {
      img.MM_init = true; img.MM_up = args[3]; img.MM_dn = img.src;
      if ((nbArr = document[grpName]) == null) nbArr = document[grpName] = new Array();
      nbArr[nbArr.length] = img;
      for (i=4; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
        if (!img.MM_up) img.MM_up = img.src;
        img.src = img.MM_dn = args[i+1];
        nbArr[nbArr.length] = img;
    } }
  } else if (event == "over") {
    document.MM_nbOver = nbArr = new Array();
    for (i=1; i < args.length-1; i+=3) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = (img.MM_dn && args[i+2]) ? args[i+2] : ((args[i+1])? args[i+1] : img.MM_up);
      nbArr[nbArr.length] = img;
    }
  } else if (event == "out" ) {
    for (i=0; i < document.MM_nbOver.length; i++) {
      img = document.MM_nbOver[i]; img.src = (img.MM_dn) ? img.MM_dn : img.MM_up; }
  } else if (event == "down") {
    nbArr = document[grpName];
    if (nbArr)
      for (i=0; i < nbArr.length; i++) { img=nbArr[i]; img.src = img.MM_up; img.MM_dn = 0; }
    document[grpName] = nbArr = new Array();
    for (i=2; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = img.MM_dn = (args[i+1])? args[i+1] : img.MM_up;
      nbArr[nbArr.length] = img;
  } }
}
//-->
</script>

<!--头文件可编辑区域-->
<title>ScilabCloud-Index</title>
</head>
<!--布局详见style.css-->
<body onload="MM_preloadImages('images/HomeMouseOn.png','images/OperationMouseOn.png','images/FunctionMouseOn.png','images/ShowMouseOn.png','images/TeamMouseOn.png','images/ContactMouseOn.png','images/LinkMouseOn.png','images/BBSMouseOn.png')">
<div id="globalIndex" style="height:1600px!important; *height:1500px!important;">
<!--题头开始-->
 <div id="BlueTopImage">
  <div id="LoginAndRegister">
  <s:if test="#session.user!=null"><jsp:include page="Welcome.jsp"></jsp:include></s:if>
  <s:else><jsp:include page="LoginAndRegister.jsp"></jsp:include></s:else>
  </div>
  <div id="Flash">
    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="250" height="134" id="FlashID" title="AnimationForScilabOnline">
      <param name="movie" value="images/Animation.swf" />
      <param name="quality" value="high" />
      <param name="swfversion" value="7.0.70.0" />
      <!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
      <param name="expressinstall" value="Scripts/expressInstall.swf" />
      <param name="wmode" value="transparent" />
      <param name="BGCOLOR" value="#004277" />
      <!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
      <!--[if !IE]>-->
      <object type="application/x-shockwave-flash" data="images/Animation.swf" width="250" height="134">
        <!--<![endif]-->
        <param name="quality" value="high" />
        <param name="swfversion" value="7.0.70.0" />
        <param name="expressinstall" value="Scripts/expressInstall.swf" />
        <param name="wmode" value="transparent" />
        <param name="BGCOLOR" value="#004277" />
        <!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 -->
        <div>
          <h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
          <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="获取 Adobe Flash Player" width="112" height="33" /></a></p>
        </div>
        <!--[if !IE]>-->
      </object>
      <!--<![endif]-->
    </object>
  </div>
  <div id="navigation">
    <table width="558" border="0" cellpadding="0" cellspacing="1" id="nav">
      <tr>
        <td width="80"><a href="index.jsp" target="_top" onclick="MM_nbGroup('down','group1','NavHome','',1)" onmouseover="MM_nbGroup('over','NavHome','images/HomeMouseOn.png','',1)" onmouseout="MM_nbGroup('out')" ><img src="images/HomeNormal.png" alt="NavHome" name="NavHome" width="80" height="43" border="0" id="index"/></a></td>
        <td width="110" ><a href="PageRun.jsp" target="_top" onclick="MM_nbGroup('down','group1','NavOperation','',1)" onmouseover="MM_nbGroup('over','NavOperation','images/OperationMouseOn.png','',1)" onmouseout="MM_nbGroup('out')"><img src="images/OperationNormal.png" alt="NavOperation" name="NavOperation" border="0"id="operation" /></a></td>
        <td width="106" ><a href="fun_getReleasedFunList" target="_top" onclick="MM_nbGroup('down','group1','NavFunction','',1)" onmouseover="MM_nbGroup('over','NavFunction','images/FunctionMouseOn.png','',1)" onmouseout="MM_nbGroup('out')" ><img src="images/FunctionNormal.png" alt="NavFunction" name="NavFunction" border="0"/></a></td>
        <td width="80" ><a href="Show.jsp" target="_top" onclick="MM_nbGroup('down','group1','NavShow','',1)" onmouseover="MM_nbGroup('over','NavShow','images/ShowMouseOn.png','',1)" onmouseout="MM_nbGroup('out')"><img src="images/ShowNormal.png" alt="NavShow" name="NavShow" border="0" /></a></td>
        <td width="80"><a href="Team.jsp" target="_top" onclick="MM_nbGroup('down','group1','NavTeam','',1)" onmouseover="MM_nbGroup('over','NavTeam','images/TeamMouseOn.png','',1)" onmouseout="MM_nbGroup('out')"><img src="images/TeamNormal.png" alt="NavTeam" name="NavTeam" border="0"/></a></td>
        <td width="215" ><a href="mailto:scilabecpkn@googlegroups.com" target="_top" onclick="MM_nbGroup('down','group1','NavContact','',1)" onmouseover="MM_nbGroup('over','NavContact','images/ContactMouseOn.png','',1)" onmouseout="MM_nbGroup('out')"><img src="images/ContactNormal.png" alt="NavContact" name="NavContact" border="0"/></a></td>
        <td><a href="Link.jsp" target="_top" onClick="MM_nbGroup('down','group1','NavLink','',1)" onMouseOver="MM_nbGroup('over','NavLink','images/LinkMouseOn.png','',1)" onMouseOut="MM_nbGroup('out')"><img name="NavLink" src="images/LinkNormal.png" border="0" alt="NavLink" onLoad="" /></a></td>
        <td><a href="http://www.scilab.org.cn" target="_top" onClick="MM_nbGroup('down','group1','NavBBS','',1)" onMouseOver="MM_nbGroup('over','NavBBS','images/BBSMouseOn.png','',1)" onMouseOut="MM_nbGroup('out')"><img name="NavBBS" src="images/BBSNormal.png" border="0" alt="NavBBS" onLoad="" /></a></td>
      </tr>
    </table>
  </div>
 </div>
<!--题头结束-->
<!--第二部分开始-->
 <div id="PictureChange">
   <div id=BigText><img src="images/TextHome.png" width="235" height="60" alt="TextHome" longdesc="images/TextHome.png" /></div>
   <div id="BandPictureLeft"><img src="images/BandPictureLeft.png" width="696" height="172" alt="BandPictureLeft" longdesc="../images/BandPictureLeft.png" /></div>
<!--第二部分：图片轮换开始-->
   <div id="Bandpicture">
 <div class="fcnt" id="ppt">
    	<div class="mimg" id="mpc">
        	<div style="display:block;"><a href="PageRun.jsp"><img src="images/Picture0.jpg" alt="" /></a></div>
            <div><a href="PageRun.jsp"><img src="images/Picture2.jpg" alt="" /></a></div>
            <div><a href="PageRun.jsp"><img src="images/Picture1.jpg" alt="" /></a></div>
            <div><a href="PageRun.jsp"><img src="images/Picture3.jpg" alt="" /></a></div>
            <div><a href="PageRun.jsp"><img src="images/Picture4.jpg" alt="" /></a></div>
            <div><a href="PageRun.jsp"><img src="images/Picture5.jpg" alt="" /></a></div>
            <div><a href="PageRun.jsp"><img src="images/Picture6.jpg" alt="" /></a></div>
            <div><a href="PageRun.jsp"><img src="images/Picture7.jpg" alt="" /></a></div>
            <div><a href="PageRun.jsp"><img src="images/Picture8.jpg" alt="" /></a></div>
            <div><a href="PageRun.jsp"><img src="images/Picture9.jpg" alt="" /></a></div>
            <div><a href="PageRun.jsp"><img src="images/Picture10.jpg" alt="" /></a></div>
            
        </div>
             
        <ul>
        	<li class="cur"><img src="images/s0.jpg" alt="" /></li>
            <li><img src="images/s2.jpg" alt="" /></li>
            <li><img src="images/s1.jpg" alt="" /></li>
            <li><img src="images/s3.jpg" alt="" /></li>
            <li><img src="images/s4.jpg" alt="" /></li>
            <li><img src="images/s5.jpg" alt="" /></li>
            <li><img src="images/s6.jpg" alt="" /></li>
            <li><img src="images/s7.jpg" alt="" /></li>
            <li><img src="images/s8.jpg" alt="" /></li>
            <li><img src="images/s9.jpg" alt="" /></li>
            <li><img src="images/s10.jpg" alt="" /></li>
        </ul>
    </div>
    </div>
<!--第二部分：图片轮换结束-->    
 </div>
<!--第二部分结束--> 
<div id="Third" style="height:1120px!important; *height:1000px!important;">
<!--左导航开始-->
<div id="LeftDiv">
  <div id="LoginPersonal">
    <s:if test="#session.user!=null">
      <jsp:include page="AlreadyLogin.jsp"></jsp:include>
    </s:if>
    <s:else>
      <jsp:include page="NotLogin.jsp"></jsp:include>
    </s:else>
  </div>
</div>
<!--左导航结束-->

  <div id="RefreshDiv">
<div id="PresentationForProgram">
    <div id="Language"><div id="Chinese"><a href="indexChinese.jsp" ><img src="images/Chinese.jpg" width="22" height="15" alt="简体中文" />&nbsp;简体中文</a></div><div id="English"><a href="index.jsp"><img src="images/English.jpg" width="26" height="15" alt="English" />&nbsp;English</a></div></div>
    <div class="clear"></div>
    <div id="art">
    <p><span lang="EN-US" xml:lang="EN-US">We are from Beijing University of Aeronautics and Astronautics, Ecole Centrale de Pékin.</span></p>
    <p><span lang="EN-US" xml:lang="EN-US">As the first general engineers, we give full play to the `general` character, we produced a cloud computing platform for Scilab.</span></p>
    <p><span lang="EN-US" xml:lang="EN-US">Firstly, we package the Scilab as a standard service--Web Service, so that each computer which accesses the network can run Scilab through Browser, Therefore, we do not need to install Scilab on our computer. Users can use Scilab easily by using our website. At the same time, we also provide to save the tasks, to save the results and to modify tasks for registered users. We achieve the personalized management for users.</span></p>
    <p><span lang="EN-US" xml:lang="EN-US">And we also design a number of interactive features, we offer a platform for sharing functions. Registered users can upload their own function after login, and some powerful functions can be loaded to the Scilab in the background of our website, so that they can be used by other users. This is equivalent to a huge toolbox, and even the users who do not have the experience of making toolbox can now share their wisdom functions.</span></p>
    <p><span lang="EN-US" xml:lang="EN-US">Our greatest contribution is making our website a cloud computing platform. Our website as a server, provide the users with network the page services, while also manage multiple computing nodes. Each node disposes our service of Scilab, and they can be integrated and called via a standardized way. The disposition of node is very simple, only needing to install a node server software (one-click install), and then each computer with network can be used as our node servers. After that they can be integrated into the system, and run the Scilab task, to achieve the cloud computing. By optimization of the scheduling algorithm, as well as the analysis of information transmission between the server addresses, our platform has much reduced the time of waiting after submit the tasks, and the users can get the results much faster, this reflect well the idea of cloud computing.</span></p>
    <p><span lang="EN-US" xml:lang="EN-US">The main features of our website are as follows:</span></p>
    <p><span lang="EN-US" xml:lang="EN-US">Operation: The links for the Scilab web version, click on the link to use the Scilab Online.</span></p>
    <p><span lang="EN-US" xml:lang="EN-US">Function: The link for users to share their functions, each function has its own source code, instructions and use case.</span></p>
    <p><span lang="EN-US" xml:lang="EN-US">Show: A short video of presentation </span></p>
    <p><span lang="EN-US" xml:lang="EN-US">Team: Introductions of our members</span></p>
    <p><span lang="EN-US" xml:lang="EN-US">Contact: Contact us</span></p>
    <p><span lang="EN-US" xml:lang="EN-US">We can login and register via the link `Login` and `Register` on the upper-left corner.</span></p>
    <p><span lang="EN-US" xml:lang="EN-US">After logging in, you can manage your account by using the bookmark on the left side of the screen.</span></p>
    </div>
  </div>
</div>
<a href="PageModel.dwt"></a>     
  </div>
<div class="clear"></div>
<div id="footer">
  <div id="aboutUs">
       <p>This site is managed by The Scilab Cloud Group.</p>
       <p>Inquiries specific to page content can be made via the article navigation at the top of each page.</p>
       <p>Ecole Centrale de Pekin</p>
  </div>

<div id="EcpknLogo"><img src="images/ecpknLOGO.png" alt="ecpknLOGO" longdesc="images/ecpknLOGO.png" /></div>
</div>
<script type="text/javascript">
<!--
swfobject.registerObject("FlashID");
//-->
</script>
</div>
</body>
</html>
