package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.PhoneDao;
import com.javaex.vo.PersonVo;

@WebServlet("/pbc")
public class PhonebookController extends HttpServlet {
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//System.out.println("PhonebookController");
		
		String act = request.getParameter("action");	//넘어온 주소값 중 action이 있으면 act에 담기
		
		//System.out.println(act);
		
		if("list".equals(act)) {
			//System.out.println("action=list");
			
			PhoneDao phoneDao = new PhoneDao();
			List<PersonVo> personList = phoneDao.getPersonList();
			
			//System.out.println(personList.toString()); 		//toString() 생략 가능
			
			//html과 list 섞어서 표현
			//servlet으론 표현이 복잡하다 ---> jsp를 이용한다.
			
			request.setAttribute("pList", personList);  // (이름표, 실제). 어트리뷰트 영역에 pList라는 이름으로 personList 주소 받기
			
			//포워드
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/list.jsp");	//누구한테 시킬건지..
			rd.forward(request, response);		//request, response를 rd(list.jsp)로 넘긴다
		
		}else if("writeForm".equals(act)) {
			//System.out.println("action=writeForm");
			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/writeForm.jsp");
			rd.forward(request, response);
			
		}else if("write".equals(act)) {
			//System.out.println("action=write");
			
			//파라미터 3개값 꺼내온다 
			String name = request.getParameter("name");
			String hp = request.getParameter("hp");
			String company = request.getParameter("company");
			
			//vo로 만든다
			PersonVo personVo = new PersonVo(name, hp, company);
			//System.out.println(personVo);
			
			//Dao 메모리에 올린다.
			PhoneDao phoneDao = new PhoneDao();
			
			//dao.insert(vo); 형태로 넣어준다
			phoneDao.personInsert(personVo);
			
			//리다이렉트	(포워드x)
			response.sendRedirect("/phonebook2/pbc?action=list");	//""값은 주소창에 들어갈 값.
			
		}else if("updateForm".equals(act)) {
			//System.out.println("action=updateForm");
			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/updateForm.jsp");
			rd.forward(request, response);
			
		}else if("update".equals(act)) {	
			String name = request.getParameter("name");
			String hp = request.getParameter("hp");
			String company = request.getParameter("company");
			int id = Integer.parseInt(request.getParameter("id"));
			
			PhoneDao phoneDao = new PhoneDao();
			PersonVo personVo = new PersonVo(id, name, hp, company);
			
			phoneDao.personUpdate(personVo);
			
			response.sendRedirect("/phonebook2/pbc?action=list");
			
			
		}else if("delete".equals(act)) {	
			//System.out.println("action=delete");
			
			int id = Integer.parseInt(request.getParameter("id"));
			
			PhoneDao phoneDao = new PhoneDao();
			phoneDao.personDelete(id);
			
			response.sendRedirect("/phonebook2/pbc?action=list");
			
		}else {
			System.out.println("파라미터값 없음");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
