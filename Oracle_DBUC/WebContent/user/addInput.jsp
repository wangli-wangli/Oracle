<%@page import="Util.ValidateUtil"%>

<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>用户添加页面</title>
</head>
<body>

	<form action="add.jsp" method="post">
		<table align="center" border="1" width="500">
			<tr>
				<td>用户名称 : </td>
				<td>
					<input type="text" name="username" />
					
					<%=ValidateUtil.showError(request, "username") %>
				<tr>
    			<td>用户密码:</td>
    			<td>
    				<input type="password" name="password" />
    				
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