<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>[Phonebook2]</h1>

   <h2>전화번호 등록폼</h2>

   <p>
      전화번호를 등록하려면<br>
         아래 항목을 기입하고 "등록" 버튼을 클릭하세요
   </p>
   
   <!-- 주소 /phonebook2/pbc/action=write&name=이효리&hp=010-&company=02를 작성하기 위한 부분. 각 부분의 순서는 상관 없음. -->
   <form action="/phonebook2/pbc" method="get">		<!--절대경로로 표기해봄.--><!-- jsp파일이 아닌 컨트롤러에 보내야 함. -->
      이름(name): <input type="text" name="name" value=""> <br>
      핸드폰(hp): <input type="text" name="hp" value=""> <br>
      회사(company): <input type="text" name="company" value=""> <br>
      <input type="hidden" name="action" value="write"><br>	<!-- 주소의 action=write를 위해 -->
      <button type="submit">전송</button>	
   </form>
   
</body>
</html>