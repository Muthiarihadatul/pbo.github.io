/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Dosen_Abdimas;
import model.Abdimas;

/**
 *
 * @author Asus
 */
@WebServlet(name = "abdimasController", urlPatterns = {"/abdimasController"})
public class abdimasController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session == null || session.getAttribute("kode") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        String menu = request.getParameter("menu");
        Abdimas abdimasModel = new Abdimas();
        Dosen_Abdimas daModel = new Dosen_Abdimas();

        if ("add".equals(menu)) {
            Integer kode = null;
            String nama = request.getParameter("nama");
            String deskripsi = request.getParameter("deskripsi");
            Date tanggal = Date.valueOf(request.getParameter("tanggal"));
            
            abdimasModel.setKode(kode);
            abdimasModel.setNama(nama);
            abdimasModel.setDeskripsi(deskripsi);
            abdimasModel.setTanggal(tanggal);
            abdimasModel.insert();
            daModel.setKodeDosen(String.valueOf(session.getAttribute("kode")));
            abdimasModel.select("*");
            abdimasModel.addQuery("ORDER BY kode DESC LIMIT 1");
            ArrayList<Abdimas> abdimas = abdimasModel.get();
            daModel.setKodeAbdimas(abdimas.get(0).getKode());
            daModel.insert();
            
        } else if ("upd".equals(menu)) {
            int kode = Integer.parseInt(request.getParameter("kode"));
            String nama = request.getParameter("nama");
            String deskripsi = request.getParameter("deskripsi");
            Date tanggal = Date.valueOf(request.getParameter("tanggal"));

            abdimasModel.setKode(kode);
            abdimasModel.setNama(nama);
            abdimasModel.setDeskripsi(deskripsi);
            abdimasModel.setTanggal(tanggal);
            abdimasModel.update();

        } else if ("del".equals(menu)) {
            int kodeAbdimas = Integer.parseInt(request.getParameter("kode"));
            abdimasModel.setKode(kodeAbdimas);
            abdimasModel.delete();
        }

        response.sendRedirect("abdimas/viewAbdimas.jsp");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("kode")==null) {
            response.sendRedirect("index.jsp");
            return;
        }
    }
}
