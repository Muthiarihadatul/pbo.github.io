/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Course;
import model.Course_Mahasiswa;
import model.DosenKoor;
import model.Mahasiswa_Quiz;
import model.Quiz;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "courseController", urlPatterns = {"/courseController"})
public class courseController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session == null || session.getAttribute("kode") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        String menu = request.getParameter("menu");
        Course courseModel = new Course();

        if ("add".equals(menu)) {
            String kodeMatkul = request.getParameter("kodeMatkul");
            String nama = request.getParameter("nama");
            String kodeKelas = request.getParameter("kodeKelas");
            int sks = Integer.parseInt(request.getParameter("sks"));
            String dosenPengampu = request.getParameter("dosenPengampu");

            courseModel.setKodeMK(kodeMatkul);
            courseModel.setNama(nama);
            courseModel.setKodeKelas(kodeKelas);
            courseModel.setSKS(sks);
            courseModel.setDosenPengampu(dosenPengampu);
            courseModel.insert();
            
            String koor = request.getParameter("kodeDosenK");
            DosenKoor dkModel = new DosenKoor();
            dkModel.where("kodeDosen = '" + koor + "'");
            ArrayList<DosenKoor> dks = dkModel.get();
            DosenKoor dk = dks.get(0);
            
            DosenKoor koorModel = new DosenKoor();
            koorModel.setKodeDosen(dk.getKodeDosen());
            koorModel.setMK(kodeMatkul);
            koorModel.setKontak(dk.getKontak());
            koorModel.setEmail(dk.getEmail());
            koorModel.insert();
            
            
        } else if ("upd".equals(menu)) {
            String kodeMatkul = request.getParameter("kodeMatkul");
            String nama = request.getParameter("nama");
            String kodeKelas = request.getParameter("kodeKelas");
            int sks = Integer.parseInt(request.getParameter("sks"));
            String dosenPengampu = request.getParameter("dosenPengampu");

            courseModel.setKodeMK(kodeMatkul);
            courseModel.setNama(nama);
            courseModel.setKodeKelas(kodeKelas);
            courseModel.setSKS(sks);
            courseModel.setDosenPengampu(dosenPengampu);
            courseModel.update();

        } else if ("del".equals(menu)) {
            String kodeMatkul = request.getParameter("kodeMatkul");
            courseModel.setKodeMK(kodeMatkul);
            courseModel.delete();
            Quiz quizModel = new Quiz();
            quizModel.where("kodeMatkul = '" + kodeMatkul + "'");
            ArrayList<Quiz> quizModels = quizModel.get();
            for (Quiz quiz : quizModels) {
                Quiz q = new Quiz();
                q.setNama(quiz.getNama());
                q.delete();
                Mahasiswa_Quiz mqModel = new Mahasiswa_Quiz();
                mqModel.setNamaQuiz(q.getNama());
                mqModel.delete();
            }
            Course_Mahasiswa cmModel = new Course_Mahasiswa();
            cmModel.where("kodeMatkul = '" + kodeMatkul + "'");
            ArrayList<Course_Mahasiswa> cmModels = cmModel.get();
            for (Course_Mahasiswa cms : cmModels) {
                Course_Mahasiswa cm = new Course_Mahasiswa();
                cm.setNIM(cms.getNIM());
                cm.delete();
            }
        }

        response.sendRedirect("Course/viewCourse.jsp");
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
