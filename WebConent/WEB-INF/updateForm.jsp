<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page import="java.util.List" %>   
<%@ page import="com.javaex.dao.PhoneDao" %>
<%@ page import="com.javaex.vo.PersonVo" %>

<%
	PhoneDao phoneDao = new PhoneDao();
	int id = Integer.parseInt(request.getParameter("id"));
	
	PersonVo personVo = phoneDao.getPerson(id);
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>[Phonebook2]]</h1>
	<h2>전화번호 수정폼</h2>
	<p>수정 화면입니다. 아래 항목을 수정하고 "수정" 버튼을 클릭하세요</p>
	
	
	<form action="/phonebook2/pbc" method="get">
		이름(name): <input type="text" name="name" value="<%=personVo.getName()%>"><br>
		핸드폰(hp): <input type="text" name="hp" value="<%=personVo.getHp()%>"><br>
		회사(company): <input type="text" name="company" value="<%=personVo.getCompany()%>"><br>
		코드(id): <input type="text" name="id" value="<%=personVo.getPersonId()%>"><br>
		<input type="hidden" name="action" value="update"><br>
		<button type="submit">수정</button>
	</form>

	
</body>
</html>