<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="gb18030"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
	<%
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String today = df.format(date);
	%>
	µ±Ç°Ê±¼ä£º<%=today %>
	<%@ include file="include.jsp" %>
	<%= copyRight %>
	<a href="include.jsp?id=1">get·½·¨</a>
	
	
	<%

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		try{
			Class.forName("com.mysql.jdbc.Driver") ; 
			out.println("Êý¾Ý¿âÇý¶¯¼ÓÔØ³É¹¦");
			String url = "jdbc:mysql://localhost:3306/java";
			String username = "root";
			String password = "";
			Connection conn = DriverManager.getConnection(url,username,password);
			if(conn != null) {	
				out.print("Êý¾Ý¿âÁ¬½Ó³É¹¦");
				String sql = "insert into msgBoard(title,content) values (?,?) ";
				
				PreparedStatement ps = null;
				ps = conn.prepareStatement(sql); 
				
				ps.setString(1,title);
			    ps.setString(2,content);
			    int i = ps.executeUpdate(); 
				out.println(i);
				conn.close();
				%>
				<script>alert("ÁôÑÔ³É¹¦");</script>
				<%
				response.sendRedirect("msgBoard.jsp");
			} else {
				out.print("Êý¾Ý¿âÁ¬½ÓÊ§°Ü");
			}
		}catch(ClassNotFoundException e){
			e.printStackTrace() ;
		}catch(SQLException e) {
			e.printStackTrace();
		}
	%>
</body>
</html>