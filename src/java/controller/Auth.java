package controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Dosen;

@WebServlet(name = "Auth", urlPatterns = {"/Auth"})
public class Auth extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Dosen dosen = new Dosen();
        dosen.connect();
        HttpSession sess = request.getSession();
        String action = request.getParameter("action");
        if ("login".equals(action)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            dosen.where("kode = '" + username + "' AND password = '" + password + "'");
            ArrayList<Dosen> rs = dosen.get();
            if (!rs.isEmpty()) {
                sess.setAttribute("kode", username);
                sess.setAttribute("password", password);
                response.sendRedirect(request.getContextPath() + "/dashboard.jsp");
            }else {
                response.sendRedirect(request.getContextPath() + "/login.jsp?error=1");
            }
        } else if ("logout".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("kode")!=null) {
                session.invalidate();
            }
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
        dosen.disconnect();
    }
}
