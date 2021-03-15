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
    width: 70%;
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
                <option value="GOODS_COMPANY">��Ż�</option>
                <option value="GOODS_NAME">��ǰ��</option>
                <option value="ISOPEN">���뿩��</option>
                <option value="COUNSELOR">�����̸�</option>
                <option value="USERNAME">��û���̸�</option>
                <option value="DATE_">��û��¥</option>    
            </select>
            <input type="text" name="keyWord" />
            <input type="button" value="�˻�" onclick="searchCheck(form)" />
           
            </form>
           
        </td>      
</tr>
<br>
<tr>  
        <td colspan="6">
            <form name="opt" method ="post">
            <select name="keyField_">
                <option value="0"> ----����----</option>
                <option value="ISOPEN">���뿩��</option>
                <option value="DATE_">��û��¥</option>
                <option value="GOODS_PRICE">��ǰ����</option>    
            </select>
            <input type="button" value="����(��������)" width = 70 onclick="orderCheck(form)" />
           
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
	 function orderCheck(frm){
	        //�˻�
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
	String keyField_ = request.getParameter("keyField_");
	
	ArrayList<String> lis = new ArrayList<String>();
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	stmt = conn.createStatement();
	pstmt = conn.prepareStatement("select * from status order by APPLY_CODE ASC");
	rs = pstmt.executeQuery();
	
	if(keyword != null && !keyword.equals(""))
	{
		pstmt = conn.prepareStatement("select * from status where " + keyField.trim() + " LIKE '%" + keyword.trim()+"%' order by APPLY_CODE ASC");
		rs = pstmt.executeQuery();
	}
	if(keyField_ != null && !keyField_.equals("0"))
	{
		pstmt = conn.prepareStatement("select * from status order by " + keyField_.trim() +" ASC");
		rs = pstmt.executeQuery();
	}
	
	
	out.println("<table class = \"type11\">");
	out.println("<thread>");
	out.println("<tr style = \"text-align: center;\" >");
	out.println("<th scopre = \"cols\">��û��ȣ</th> <th scopre = \"cols\">��ǰ��</th> <th scopre = \"cols\">���� </th><th scopre = \"cols\"> ��û�� </th><th scopre = \"cols\">��û��¥</th> </th><th scopre = \"cols\"> ���뿩��</th> </th><th scopre = \"cols\"> ��Ż�</th> </th><th scopre = \"cols\"> ����</th>");
	out.println("</tr>");
	out.println("</thread>");
	
	out.println("<td>��û��ȣ <td>��ǰ�� <td>���� <td>��û�� <td>��û��¥ <td>���뿩�� <td>��Ż� <td>����");
	while(rs.next())
	{
		out.println("<tr>");
		out.println("<td>"+rs.getString("APPLY_CODE"));
		out.println("<td>"+rs.getString("GOODS_NAME"));
		out.println("<td>"+rs.getString("COUNSELOR"));
		out.println("<td>"+rs.getString("USERNAME"));
		out.println("<td>"+rs.getString("DATE_"));
		out.println("<td>"+rs.getString("ISOPEN"));
		out.println("<td>"+rs.getString("GOODS_COMPANY"));
		out.println("<td>"+rs.getString("GOODS_PRICE"));
		out.println("</tr>");
	}
	out.println("</table>");
	
	conn.close();
	
%>

</body>
</html>