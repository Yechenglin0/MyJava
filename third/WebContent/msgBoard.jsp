<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="gb18030"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>���԰�</title>

</head>
<body>
	<%
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String today = df.format(date);
	%>
	��ǰʱ�䣺<%=today %>
	<%@ include file="include.jsp" %>
	<%= copyRight %>
	<a href="include.jsp?id=1">get����</a>
	
	<form action="db.jsp" method="post">
		<input type="text" name="title" placeholder="�������"><br>
		<input type="text" name="content" placeholder="��������"><br>
		<input type="submit">
	</form>
	
	
	
	
	<%
	class FunctionDemo 
	{
	 	public String getUsernameById(int id)
	 	{
	 		String sql = "select username from user where id = ?";
	 		PreparedStatement pst=conn.prepareStatement(sql);
	 	    pst.setString(1,id);
	 	    ResultSet rs=pst.executeQuery();
	 	    
	 	   if(rs.next()) {   
 	           return rs.getString("username");
 	       } else {
 	           out.print("��½ʧ�ܣ���������ȷ�ϣ�");
 	     }
	 	}

	}

	%>
	<%
		
	
	
		try{
			Class.forName("com.mysql.jdbc.Driver") ; 
			out.println("���ݿ��������سɹ�");
			String url = "jdbc:mysql://localhost:3306/java";
			String username = "root";
			String password = "";
			Connection conn = DriverManager.getConnection(url,username,password);
			if(conn != null) {	
				out.print("���ݿ����ӳɹ�<br>");
				String sql = "select * from msgBoard";
				
				PreparedStatement ps = conn.prepareStatement(sql); 

 				  Statement stmt = null;
			      stmt = conn.createStatement();
			      
			      ResultSet rs = stmt.executeQuery(sql);
			     
			      while(rs.next()){
					
			    	 int uid = rs.getInt("uid");
			         String title  = rs.getString("title");
			         String content = rs.getString("content");
			  
			         out.println("title:" + title + "<br> content:" + content + "<br>");
			      }
			      rs.close();
			} else {
				out.print("���ݿ�����ʧ��");
			}
		}catch(ClassNotFoundException e){
			e.printStackTrace() ;
		}catch(SQLException e) {
			e.printStackTrace();
		}
	
	
	%>
</body>
</html>