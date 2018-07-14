<%@page import="Util.ValidateUtil"%>
<%@page import="model.User"%>
<%@page import="dao.UserDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户更新页面</title>
</head>
<body>
	<%
		//获取客户端传递过来的参数
		int id = Integer.parseInt(request.getParameter("id"));
		UserDaoImpl userDao = new UserDaoImpl();
		User user = userDao.load(id);
	%>
	<form action="update.jsp" method="get">
		<table align="center" border="1" width="500">
			<input type="hidden" name="id" value="<%=id %>" />
			<tr>
				<td>用户名称 : </td>
				<td>
					<input type="text" name="username" value="<%=user.getUsername() %>" />
					<%=ValidateUtil.showError(request, "username") %>
				</td>
			</tr>
				<tr>
    			<td>用户密码:</td>
    			<td>
    				<input type="password" name="password" value="<%=user.getPassword() %>"/>
    				<%=ValidateUtil.showError(request, "password") %>
    			</td>
    		</tr>
    		<tr align="center">
    			<td colspan="2">
    				<input type="submit" value="提交" />
    				<input type="reset" value="重置" />
    			</td>
    		</tr>
		</table>
	</form>
</body>
</html>