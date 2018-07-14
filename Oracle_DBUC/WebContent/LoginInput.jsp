<!-- 信1605-1 王莉  20163623 -->
<%@ page import="Util.ValidateUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   String loginError=(String)session.getAttribute("error");
   if(loginError==null){
	   loginError=" ";
   }
%>
  <%=loginError %><br>
  <form action="login.jsp" method="post">

  <table align="center" border="0" width="400">
    <tr>
    <td>
          用户名：<input type="text" name="user_name"/>
           <%= ValidateUtil.showError(request,"user_name") %>
     
   </td>
   </tr>
   <tr>
    <td>
         用户密码：<input type="password" name="password"/><br>
         <%= ValidateUtil.showError(request,"password") %>
          </td>
   </tr>
   <tr>
    <td>
         <input type="submit" value="用户登录"/>
          
  </td>
   </tr>
  </form>

</body>
</html>