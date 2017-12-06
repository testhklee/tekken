package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.Jdao.MyDao;
import com.Jdto.MyDto;


@WebServlet("/Controller.go")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Controller() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		MyDao dao = new MyDao();
		
		//url
		String url = "";
		
		//��Ʈ�� Ŀ���
		String command = request.getParameter("command");
		
		//���� ����
		HttpSession session = null;
		
		//ȸ������
		if(command.equals("joinform")) {			
			String lastname = request.getParameter("lastName");
			String firstname = request.getParameter("firstName");
			String emailorphone = request.getParameter("emailorphone");
			String password = request.getParameter("password");
			String birth = request.getParameter("my_year")+ "-" +request.getParameter("my_month")+ "-" +request.getParameter("my_day");
			int gender = Integer.parseInt(request.getParameter("gender"));
			
			//���̵� �ߺ�üũ
			if(dao.userInsertCheck(emailorphone) == false) {
				jsResponse("���̵� �ߺ��˴ϴ�.", "index.jsp", response);
			}else {
				MyDto dto = new MyDto(lastname+firstname,emailorphone,password,birth,gender);
				
				int res = dao.userInsert(dto);
				
				if(res > 0) {				
					jsResponse("ȸ�� ���Կ� ���� �߽��ϴ�.", "index.jsp", response);				
				}else {				
					jsResponse("ȸ�� ���Կ� ���� �߽��ϴ�.", "index.jsp", response);				
				}
			}
			
			//�α��� (������ üũ)
			}else if(command.equals("login")) {
								
				String id = request.getParameter("id");
				String mypassword = request.getParameter("mypassword");
				
				MyDto dto = dao.checking(id, mypassword);
				
				if(dto.getEmailorphone() != null || dto.getPassword() != null) {
					
					//���� ���� ���� ����
					session = request.getSession();
					session.setAttribute("dto", dto);
					
					//�������϶�
					if(dto.getRole().equals("admin")) {	
						
						/*List<MyDto> list = dao.selectAll();
						request.setAttribute("list", list);*/
						
						dispatcher("adminmain.jsp", request, response);
						
					//�����ϋ�
					}else if(dto.getRole().equals("member")) {
						session.getAttribute("dto");				
						
						dispatcher("main.jsp", request, response);									
					}					
				}else {
					jsResponse("���̵�� ��й�ȣ�� ��ġ���� �ʰų�, ȸ������ �Ǿ����� �ʴ� �����Դϴ�.", "index.jsp", response);
				}
				
			//�α׾ƿ�	
			}else if(command.equals("logout")) {
				//���� ���� ���� ����
				session = request.getSession(false);
				
				if(session != null){
		    		session.invalidate();
		    	}
				
				response.sendRedirect("index.jsp");
				
			//������(->ȸ��) ������
			}else if(command.equals("adminupdateform")) {	
				String userId = request.getParameter("userid");
				MyDto dto = dao.selectOne(userId);
				request.setAttribute("dto", dto);
				
				dispatcher("adminupdateform.jsp", request, response);
				
			//������(->ȸ��) �����ϱ�
			}else if(command.equals("adUserUpdate")) {
				String idUpdate = request.getParameter("id");
				String birthUpdate = request.getParameter("birth");
				int genderUpdate =  Integer.parseInt(request.getParameter("gender"));
				String enabledUpdate = request.getParameter("enabled");
				String roleUpdate = request.getParameter("role");
				
				int res = dao.adUserUpdate(idUpdate, birthUpdate, genderUpdate, enabledUpdate, roleUpdate);
				
				if(res > 0) {
					String cl = "<script type='text/javascript'>" + "alert('�����Ϸ��Ͽ����ϴ�.');" + "self.close();" + "opener.location.reload()" + "</script>";
					PrintWriter out = response.getWriter();
					out.print(cl);
				}else {
					jsResponse("ȸ�� ���� ������ �����Ͽ����ϴ�.", "Controller.go?command=adminupdateform&userid="+idUpdate, response);
				}
			
			//�����ڿ��� ȸ�� �˻�
			}else if(command.equals("search")) {
				String selOne = request.getParameter("selOne");
				String searchT = request.getParameter("searchT");
				
				List<MyDto> list = dao.search(selOne, searchT);
				
				request.setAttribute("list", list);
				
				dispatcher("adminUserInfo.jsp", request, response);
			
			//�����ڿ��� ȸ�� ����
			}else if(command.equals("deleteOne")) {
				String id = request.getParameter("id");
				
				int res = dao.deleteOne(id);
				
				if(res > 0) {
					String cl = "<script type='text/javascript'>" + "alert('�����Ϸ��Ͽ����ϴ�.');" + "self.close();" + "opener.location.reload()" + "</script>";
					PrintWriter out = response.getWriter();
					out.print(cl);
				}else {
					jsResponse("ȸ�� ���� ������ �����Ͽ����ϴ�.", "Controller.go?command=adminupdateform&userid="+id, response);
				}
			
			//����¡
			}else if(command.equals("adminUserInfo")) {		
				int total = dao.selectAll().size();
				int totalPage = 0;
				if(total%5 != 0) {
					totalPage = (total/5)+1;
				} else {
					totalPage = total/5;
				}
				
				int pageNum = Integer.parseInt(request.getParameter("pageNum"));
				if(pageNum <= 0) {
					pageNum = 1;
				}else if(pageNum >= totalPage ) {
					pageNum = totalPage;
				}		
				
				int begin = ((int)Math.ceil(pageNum / 5.0) -1) * 5 + 1;				
				int end = ((int)Math.ceil(pageNum / 5.0) -1) * 5 + 5;
								
				if(end > totalPage) {
					end = totalPage;
				}
				
				List<MyDto> list = dao.page(pageNum);
				System.out.println("1qqq"+list.size());
				request.setAttribute("list", list);				
				request.setAttribute("begin", begin);
				request.setAttribute("end", end);
				
				
				dispatcher("adminUserInfo.jsp", request, response);
			
			}else if(command.equals("userUpdateOut")) {
				String id = request.getParameter("id");
				MyDto dto = dao.selectOne(id);
				request.setAttribute("dto", dto);
				
				dispatcher("userUpdateOut.jsp", request, response);
			}
		
	}
	
	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>" + "alert('"+msg+"');" + "location.href='"+url+"';" + "</script>";
		PrintWriter out = response.getWriter();
		out.print(s);
	}
	
	public void dispatcher(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		
		dispatcher.forward(request, response);
	}

}
