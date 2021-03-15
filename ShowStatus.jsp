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
<title>통신사 전산관리 프로그램</title>
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
통신사 전산관리 프로그램
</span>

<Form>
	<input type="button" class = "button c" value = '접수현황' id = "getS">
	<input type="button" class = "button c" value = '상담사' id = "getM">
	<input type="button" class = "button c" value = '상품목록' id = "getG">
	<input type="button" class = "button c" value = '고객정보' id = "getU">
</Form>

<tr>  
        <td colspan="7">
            <form name="serach" method ="post">
            <select name="keyField">
                <option value="0"> ----선택----</option>
                <option value="GOODS_COMPANY">통신사</option>
                <option value="GOODS_NAME">상품명</option>
                <option value="ISOPEN">개통여부</option>
                <option value="COUNSELOR">상담사이름</option>
                <option value="USERNAME">신청자이름</option>
                <option value="DATE_">신청날짜</option>    
            </select>
            <input type="text" name="keyWord" />
            <input type="button" value="검색" onclick="searchCheck(form)" />
           
            </form>
           
        </td>      
</tr>
<br>
<tr>  
        <td colspan="6">
            <form name="opt" method ="post">
            <select name="keyField_">
                <option value="0"> ----선택----</option>
                <option value="ISOPEN">개통여부</option>
                <option value="DATE_">신청날짜</option>
                <option value="GOODS_PRICE">상품가격</option>    
            </select>
            <input type="button" value="정렬(오름차순)" width = 70 onclick="orderCheck(form)" />
           
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
	        //검색
	       
	        if(frm.keyWord.value ==""){
	            alert("검색 단어를 입력하세요.");
	            frm.keyWord.focus();
	            return;
	        }
	        frm.submit();      
	    }
	 function orderCheck(frm){
	        //검색
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
	out.println("<th scopre = \"cols\">신청번호</th> <th scopre = \"cols\">상품명</th> <th scopre = \"cols\">상담사 </th><th scopre = \"cols\"> 신청자 </th><th scopre = \"cols\">신청날짜</th> </th><th scopre = \"cols\"> 개통여부</th> </th><th scopre = \"cols\"> 통신사</th> </th><th scopre = \"cols\"> 가격</th>");
	out.println("</tr>");
	out.println("</thread>");
	
	out.println("<td>신청번호 <td>상품명 <td>상담사 <td>신청자 <td>신청날짜 <td>개통여부 <td>통신사 <td>가격");
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