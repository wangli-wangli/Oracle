
<!-- 信1605-1 王莉  20163623 -->
<%@page import="model.User" %>
<%@page import="dao.UserDaoImpl" %>
<%@page import="dao.IUserDao" %>
<%@page import="Util.UserException" %>
<%@ page import="Util.ValidateUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    //获取客户端传递过来的参数
    String user_name=request.getParameter("user_name");
    String password=request.getParameter("password");
    boolean validate=ValidateUtil.validateNull(request, new String[]{"user_name","password"});
    if(!validate){
    	  %>
 	     <jsp:forward page="LoginInput.jsp"></jsp:forward>
 	<%
 	 }
    
    try{
    UserDaoImpl userDao=new UserDaoImpl();
    User user=userDao.load_username(user_name);
  
    boolean is=false;
   if(user==null)   
   {
	   is=false;
   }
   if(password.equals(user.getPassword()))
   {
	   is=true;
	   
   } 
   if(is==false)
   {
	   session.setAttribute("error", "密码错误");
	   %>
	    <<jsp:forward page="LoginInput.jsp"></jsp:forward>	
	    <%
	   
   }
    session.setAttribute("loginUser", user);
   /*  if(user.getType()==1)
    {
    	 response.sendRedirect("user/teacher.jsp");
    }
    if(user.getType()==0)
    {
    	response.sendRedirect("user/student.jsp");
    } */
    
    }catch(UserException e){
    	//验证出错
    	request.setAttribute("loginError", e.getMessage());
    %>
    <<jsp:forward page="LoginInput.jsp"></jsp:forward>	
    <%
    }
    response.sendRedirect("user/list.jsp");
%>