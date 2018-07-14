<%@page import="dao.UserDaoImpl"%>
<%@page import="model.User"%>
<%@page import="dao.IUserDao"%>
<%@page import="Util.ValidateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//获取客户端传递过来的参数
	int id = Integer.parseInt(request.getParameter("id"));
	String password = request.getParameter("password");
	
	boolean validate = ValidateUtil.validateNull(request, new String[]{"password"});
	if(!validate){
%>	
    
	<jsp:forward page="updateInput.jsp"></jsp:forward>	
<%
	}
	UserDaoImpl userDao = new UserDaoImpl();
	User user = userDao.load(id);
	
	user.setPassword(password);

	
	userDao.update(user);
	
	response.sendRedirect("list.jsp");
%>