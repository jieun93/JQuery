package kr.or.ddit.board.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	// ??로 뒤에 붙는거 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int seq = Integer.parseInt(request.getParameter("seq"));
		IBoardService  service = BoardServiceImpl.getInstance();
		BoardVO  vo =  service.selectView(seq);
		
		 request.setAttribute("vo", vo);
		 RequestDispatcher  disp = request.getRequestDispatcher("board_data/view.jsp");
		 disp.forward(request, response);
		
	}

	// post형식으로 넘어가는거 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		BoardVO  vo = new BoardVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		IBoardService  service = BoardServiceImpl.getInstance();
		int a =  service.updateBoard(vo);
		
		 request.setAttribute("a", a);
		 RequestDispatcher  disp = request.getRequestDispatcher("board_data/update.jsp");
		 disp.forward(request, response);
		
		
	}

}
