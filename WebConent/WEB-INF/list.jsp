<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "com.javaex.vo.PersonVo" %>
<%@ page import = "java.util.List" %>

<%
	//request의 attribute영역의 리스트를 가져온다. (Dao에서 가져오는게 아님)
	List<PersonVo> personList = (List<PersonVo>)request.getAttribute("pList");		//주소가 꺼내짐.
								//setAttribute가 모든 값을 받을 수 있어서 불러올 때 형변환을 해줘야 함.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>[phonebook2]</h1>
	<h2>전화번호 리스트</h2>
	<p>입력한 정보 내역입니다.</p>

	<%
	for(int i=0; i<personList.size(); i++){
	%>
		<table border = "1">
			<tr>
				<td>이름(name)</td>
				<td><%=personList.get(i).getName()%></td>
			</tr>
			<tr>
				<td>핸드폰(hp)</td>
				<td><%=personList.get(i).getHp()%></td>
			</tr>
			<tr>
				<td>회사(company)</td>
				<td><%=personList.get(i).getCompany()%></td>
			</tr>
			<tr>
				<td><a href="/phonebook2/pbc?action=updateForm&id=<%=personList.get(i).getPersonId()%>">수정</a></td>
				<td><a href="/phonebook2/pbc?action=delete&id=<%=personList.get(i).getPersonId()%>">삭제</a></td>
			</tr>
		</table>
		<br>
	<%
	}
	%>
	<a href="/phonebook2/pbc?action=writeForm">추가번호 등록</a>
</body>
</html>