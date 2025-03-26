/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
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
import model.Quiz;
import model.Dosen;
import model.Mahasiswa_Quiz;

/**
 *
 * @author Farah
 */
@WebServlet(name = "quizController", urlPatterns = {"/quizController"})
public class quizController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session == null || session.getAttribute("kode") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        String menu = request.getParameter("menu");
        String kodeMK = request.getParameter("kodeMatkul");
        String kodeKls = request.getParameter("kodeKelas");
        Quiz quizModel = new Quiz();

        if ("add".equals(menu)) {
            String nama = request.getParameter("nama");
            String deskripsi = request.getParameter("deskripsi");

            quizModel.setNama(nama);
            quizModel.setKodeMK(kodeMK);
            quizModel.setDeskripsi(deskripsi);
            quizModel.setKodeKelas(kodeKls);
            quizModel.insert();
            
            Course_Mahasiswa cmModel = new Course_Mahasiswa();
            cmModel.where("kodeMatkul = '" + kodeMK + "'");
            ArrayList<Course_Mahasiswa> cms = cmModel.get();
            for (Course_Mahasiswa cm : cms) {
                Mahasiswa mahasiswaModel = new Mahasiswa();
                Mahasiswa mahasiswa = mahasiswaModel.find(String.valueOf(cm.getNIM()));
                if (mahasiswa.getKodeKelas().equals(kodeKls)) {
                    Mahasiswa_Quiz mqModel = new Mahasiswa_Quiz();
                    mqModel.setNIM(String.valueOf(mahasiswa.getNIM()));
                    mqModel.setNilai(0);
                    mqModel.setNamaQuiz(nama);
                    mqModel.setKodeKelas(kodeKls);
                    mqModel.insert();
                }
            }
        } else if ("updNilai".equals(menu)) {
            String nama = request.getParameter("nama");
            String nim = request.getParameter("nim");
            int nilai = Integer.parseInt(request.getParameter("nilai"));
            
            Mahasiswa_Quiz mqModel = new Mahasiswa_Quiz();
            mqModel.setNIM(nim);
            mqModel.setNilai(nilai);
            mqModel.setNamaQuiz(nama);
            mqModel.setKodeKelas(kodeKls);
            mqModel.where("nim = '" + nim + "' AND namaQuiz = '" + nama + "'");
            mqModel.update2();

        } else if ("delQuiz".equals(menu)) {
            String nama = request.getParameter("nama");
            quizModel.setNama(nama);
            quizModel.delete();
            Mahasiswa_Quiz mqModel = new Mahasiswa_Quiz();
            mqModel.setNamaQuiz(nama);
            mqModel.delete();
        } else if ("delNilai".equals(menu)){
            String nama = request.getParameter("nama");
            String nim = request.getParameter("nim");
            
            Mahasiswa_Quiz mqModel = new Mahasiswa_Quiz();
            mqModel.setNIM(nim);
            mqModel.setNilai(0);
            mqModel.setNamaQuiz(nama);
            mqModel.setKodeKelas(kodeKls);
            mqModel.where("nim = '" + nim + "' AND namaQuiz = '" + nama + "'");
            mqModel.update2();
        }

        response.sendRedirect("Course/dashboardCourse.jsp?kodeMK=" + kodeMK + "&&kodeKelas=" + kodeKls);
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
