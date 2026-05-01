<!-- <%@ page import="java.sql.*" %>
<table border="1px" width="100%">
<tr>
    <th>Name</th>
    <th>Address</th>
    <th>Mobile</th>
    <th>Email</th>
</tr>

<%
String cname=request.getParameter("cname");

try{
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/online_banking";
	Connection con=DriverManager.getConnection(url,"root","");
	String sql="Select * from customer_register where Name='"+cname+"' ";
	PreparedStatement stmt=con.prepareStatement(sql);
	ResultSet rs=stmt.executeQuery(sql);
	while(rs.next()){
		out.print("<tr>");
		out.print("<td>"+rs.getString(1)+"</td>");
		out.print("<td>"+rs.getString(2)+"</td>");
		out.print("<td>"+rs.getString(3)+"</td>");
		out.print("<td>"+rs.getString(4)+"</td>");
		out.print("</tr>");
	}
	
}catch(Exception e){
	
}

%>

</table> -->