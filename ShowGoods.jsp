<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<style>
table.type11 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: center;
  line-height: 1.5;
  margin: 20px 10px;
}
table.type11 th {
  width: 155px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
  background: #ce4869 ;
}
table.type11 td {
  width: 155px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #eee;
}

.button {
  background-color: blue;
  border: none;
  color: white;
  padding: 15px 30px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
.b {background:red;}
.c {background:green;}

  table, th, td {
    border: 1px solid #bcbcbc;
  }
  table {
    width: 55%;
  }
</style>


<head>
<meta charset="UTF-8">
<title>��Ż� ������� ���α׷�</title>
</head>
<body>

<span
style="
font-style: italic ; 
font-weight: bold; 
font-size: 1.5em;
line-height: 1.0em; 
color: navy;
font-family: arial;
">
��Ż� ������� ���α׷�
</span>

<Form>
	<input type="button" class = "button c" value = '������Ȳ' id = "getS">
	<input type="button" class = "button c" value = '����' id = "getM">
	<input type="button" class = "button c" value = '��ǰ���' id = "getG">
	<input type="button" class = "button c" value = '������' id = "getU">
</Form>

<tr>  
        <td colspan="7">
            <form name="serach" method ="post">
            <select name="keyField">
                <option value="0"> ----����----</option>
                <option value="COMPANY">��Ż�</option>
                <option value="g_name">��ǰ��</option>
                <option value="option_">�ɼ�</option>  
            </select>
            <input type="text" name="keyWord" />
            <input type="button" value="�˻�" onclick="searchCheck(form)" />
           
            </form>
           
        </td>      
</tr>

<br>

<script type = "text/javascript">
	document.getElementById("getS").onclick = function(){
	location.href = "http://localhost:8090/WebTest/ShowStatus.jsp";
	}
	document.getElementById("getM").onclick = function(){
	location.href = "http://localhost:8090/WebTest/ShowManager.jsp";
	}
	document.getElementById("getG").onclick = function(){
	location.href = "http://localhost:8090/WebTest/ShowGoods.jsp";
	}
	document.getElementById("getU").onclick = function(){
	location.href = "http://localhost:8090/WebTest/ShowUsers.jsp";
	}
	 function searchCheck(frm){
	        //�˻�
	       
	        if(frm.keyWord.value ==""){
	            alert("�˻� �ܾ �Է��ϼ���.");
	            frm.keyWord.focus();
	            return;
	        }
	        frm.submit();      
	    }
</script>

<%
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "LEE";
	String pass = "YOON";
	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	String getSt = "";
	
	String keyField = request.getParameter("keyField");
	String keyword = request.getParameter("keyWord");
	
	ArrayList<String> lis = new ArrayList<String>();
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	stmt = conn.createStatement();
	pstmt = conn.prepareStatement("select * from goods");
	rs = pstmt.executeQuery();
	
	if(keyword != null && !keyword.equals(""))
	{
		pstmt = conn.prepareStatement("select * from goods where " + keyField.trim() + " LIKE '%" + keyword.trim()+"%'");
		rs = pstmt.executeQuery();
	}

	out.println("<table class = \"type11\">");
	out.println("<thread>");
	out.println("<tr style = \"text-align: center;\" >");
	out.println("<th scopre = \"cols\">��ǰ�ڵ�</th> <th scopre = \"cols\">��Ż�</th> <th scopre = \"cols\">��ǰ�� </th><th scopre = \"cols\"> ���� </th><th scopre = \"cols\"> �ɼ�</th>");
	out.println("</tr>");
	out.println("</thread>");
	while(rs.next())
	{
		out.println("<tr>");
		out.println("<td>"+rs.getString("CODE_NUM")+"</th>");
		out.println("<td>"+rs.getString("COMPANY")+"</th>");
		out.println("<td>"+rs.getString("G_NAME")+"</th>");
		out.println("<td>"+rs.getString("PRICE")+"</th>");
		out.println("<td>"+rs.getString("OPTION_")+"</th>");
		out.println("</tr>");
	}

	out.println("</table>");
	
	conn.close();
	
%>

</body>
</html>