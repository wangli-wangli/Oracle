
<%@page import="dao.UserDaoImpl"%>
<%@page import="model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int id = Integer.parseInt(request.getParameter("id"));
	
%>
<%
//工厂模式
	UserDaoImpl userDao =new UserDaoImpl();
    User loginUser=(User)session.getAttribute("loginUser");
	userDao.delete(id);
	User user=(User)session.getAttribute("loginUser");
	if(id==loginUser.getUser_id()){
	    response.sendRedirect(request.getContextPath()+"/LoginInput.jsp");
	}else{
		 response.sendRedirect("./list.jsp");
	}
%>