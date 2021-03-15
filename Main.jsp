<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import = "java.sql.*" %>
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
</style>


<head>
<meta charset="EUC-KR">
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
	
</script>
</body>
</html>