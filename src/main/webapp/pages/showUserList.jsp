<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<link href="<s:url value="/css/main.css"/>" rel="stylesheet" type="text/css"/>
<%
    String addname = (String)session.getAttribute("ADDUSER");
    String addemail = (String)session.getAttribute("ADDEMAIL");
    
    if ("false" == addname)
    {
        session.removeAttribute("ADDUSER");       
%>
<script type="text/javascript">
    alert("Error: User name already exist! Please try again...")
</script> 
<META HTTP-EQUIV="Refresh" CONTENT="0"/>
<%
    }
    else if ("false" == addemail)
    {
        session.removeAttribute("ADDEMAIL");
%>
<script type="text/javascript">
    alert("Error: Email adress already exist! Please try again...")
</script> 
<META HTTP-EQUIV="Refresh" CONTENT="0"/>
<%
    }
    else
    {
%>
<html>
<head>
<title>用户管理</title>
<style type="text/css" rel="stylesheet">
#container{width:500px; margin:10px auto;}
#container table{text-align:center;width:100%}
#container #link{text-align:right;}
</style>

</head>
<body>
<center>
<h3>用户管理</h3>
<div id="container">
<div id="link">
<s:url action="displayUsertilesAction.action" var="aURL" />
<s:a href="%{aURL}"><u>[添加用户]</u></s:a>
</div>
<div id="link">
<s:url action="admintilesAction.action" var="aURL" />
<s:a href="%{aURL}"><u>[返回首页]</u></s:a>
</div>
<table align=center class="borderAll">
    <tr>
        <th><s:text name="名字"/></th>
        <th><s:text name="类型"/></th>
        <th><s:text name="删除"/></th>
        <th><s:text name="更改权限"/></th>
        <th>&nbsp;</th>
    </tr>
    <s:iterator value="userList" status="status">
        <tr class="<s:if test="#status.even">even</s:if><s:else>odd</s:else>">
            <td class="nowrap"><s:property value="name"/></td>
            <td class="nowrap"><s:property value="type"/></td>
            <td class="nowrap">
                   	<s:url id="deleteUser" action="deleteUsertilesAction">
		       		   <s:param name="username" value="name"/>
		       		</s:url> 
                <s:a href="%{deleteUser}">删除</s:a>
            </td>
            <td class="nowrap">
                   	<s:url id="updateUser" action="updateUsertilesAction">
		       		   <s:param name="username" value="name"/>
		       		</s:url> 
                <s:a href="%{updateUser}">更改</s:a>
            </td>
        </tr>  		
	 </s:iterator>
    </table>
</div>
 </center>
</body>
</html>
<%
    }
%>