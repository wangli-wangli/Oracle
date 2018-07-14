<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="dao.UserDaoImpl"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户展示界面</title>
<style type="text/css">
</style>
</head>
<%	
	UserDaoImpl userDao = new UserDaoImpl();
	
    List<User> users=userDao.load_users();
    
    
	//获得用户登录
	User loginuser=(User)session.getAttribute("loginUser");
	
%>
<body>
	<table align="center" border="1" width="700">
	<tr>
	    <form action="list.jsp" method="post">
	            
        </form>
        </tr>
       
                                                                            
		<tr>
			<td>用户编号</td>
			<td>用户名称</td>
			<td>用户密码</td>
			<td colspan="2">用户操作</td>
		</tr>
		<%
			for( User user : users ){
		%>
		<tr>
			<td> <%=user.getUser_id() %></td>
			<td> <%=user.getUsername() %></td>
			<td> <%=user.getPassword() %></td>
			<td> <a href="delete.jsp?id=<%=user.getUser_id() %>" >删除</a></td>
			<td> <a href="updateInput.jsp?id=<%=user.getUser_id() %>" >更新</a></td>
			
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>