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
import model.Course_Mahasiswa;
import model.Dosen_Penelitian;
import model.Mahasiswa;
import model.Penelitian;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "penelitianController", urlPatterns = {"/penelitianController"})
public class penelitianController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session == null || session.getAttribute("kode") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        String menu = request.getParameter("menu");
        Penelitian penelitianModel = new Penelitian();
        Dosen_Penelitian dpModel = new Dosen_Penelitian();

        if ("add".equals(menu)) {
            Integer kode = null;
            String nama = request.getParameter("nama");
            String bidang = request.getParameter("bidang");
            String deskripsi = request.getParameter("deskripsi");
            Date tanggal = Date.valueOf(request.getParameter("tanggal"));
            String tautan = request.getParameter("tautan");
            
            penelitianModel.setKode(kode);
            penelitianModel.setNama(nama);
            penelitianModel.setBidang(bidang);
            penelitianModel.setDeskripsi(deskripsi);
            penelitianModel.setTanggal(tanggal);
            penelitianModel.setTautan(tautan);
            penelitianModel.insert();
            dpModel.setKodeDosen(String.valueOf(session.getAttribute("kode")));
            penelitianModel.select("*");
            penelitianModel.addQuery("ORDER BY kode DESC LIMIT 1");
            ArrayList<Penelitian> penelitian = penelitianModel.get();
            dpModel.setKodePenelitian(penelitian.get(0).getKode());
            dpModel.insert();
            
        } else if ("upd".equals(menu)) {
            int kode = Integer.parseInt(request.getParameter("kode"));
            String nama = request.getParameter("nama");
            String bidang = request.getParameter("bidang");
            String deskripsi = request.getParameter("deskripsi");
            Date tanggal = Date.valueOf(request.getParameter("tanggal"));
            String tautan = request.getParameter("tautan");

            penelitianModel.setKode(kode);
            penelitianModel.setNama(nama);
            penelitianModel.setBidang(bidang);
            penelitianModel.setDeskripsi(deskripsi);
            penelitianModel.setTanggal(tanggal);
            penelitianModel.setTautan(tautan);
            penelitianModel.update();

        } else if ("del".equals(menu)) {
            int kodePenelitian = Integer.parseInt(request.getParameter("kode"));
            penelitianModel.setKode(kodePenelitian);
            penelitianModel.delete();
        }

        response.sendRedirect("penelitian/viewPenelitian.jsp");
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
