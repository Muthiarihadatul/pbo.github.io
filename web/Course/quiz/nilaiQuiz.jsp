<%-- 
    Document   : nilaiQuiz
    Created on : Jan 3, 2025, 9:43:18 AM
    Author     : Muthia Rihadatul
--%>

<%@page import="java.net.URLEncoder"%>
<%@page import="model.Mahasiswa"%>
<%@page import="model.Mahasiswa_Quiz"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Course"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
              crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"
              rel="stylesheet">
        <title>Lecturo - Mahasiswa</title>
        <style>
            body {
                background-color: #004643;
                color: #ffffff;
            }
            .navbar {
                background-color: #004643;
            }
            .navbar-brand {
                display: flex;
                align-items: center;
                font-weight: bolder;
            }
            .navbar-brand .circle {
                width: 15px;
                height: 15px;
                background-color: #F9BC60;
                border-radius: 50%;
                margin-right: 10px;
            }
            .active-button {
                background-color: #F9BC60;
                color: #004643;
                border: none;
                padding: 8px 16px;
                border-radius: 20px;
                text-decoration: none;
            }
            .passive-button {
                color: #F9BC60;
                border: none;
                padding: 8px 16px;
                text-decoration: none;
            }
            .passive-button:hover {
                color: #ABD1C6;
            }
            .course-button {
                background-color: #F9BC60;
                color: #004643;
                font-weight: bold;
                border: none;
                padding: 8px 16px;
                border-radius: 20px;
            }
        </style>
    </head>
    <%
            String kodeMatkul = request.getParameter("kodeMK");
            String kodeKelas = request.getParameter("kodeKelas");
            String namaQuiz = request.getParameter("namaQuiz");
            Course courseModel = new Course();
            courseModel.where("kodeMatkul = '" + kodeMatkul + "' AND kodeKelas = '" + kodeKelas + "'");
            ArrayList<Course> c = courseModel.get();
            
            Course course = c.get(0);
    %>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/dashboard.jsp">
                    <div class="circle"></div>
                    Lecturo
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/Course/viewCourse.jsp">Mata Kuliah</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/penelitian/viewPenelitian.jsp">Penelitian</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/abdimas/viewAbdimas.jsp">Pengabdian Masyarakat</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>  
        
        
        <div class="container mt-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div class="d-flex justify-space-between align-items-center mb-4 gap-3">
                    <a href="${pageContext.request.contextPath}/Course/dashboardCourse.jsp?kodeMK=<%= course.getKodeMK()%>&&kodeKelas=<%= course.getKodeKelas() %>" class="passive-button fw-bold">Activity</a>
                    <a href="${pageContext.request.contextPath}/Course/mahasiswa/viewMahasiswa.jsp?kodeMK=<%= course.getKodeMK()%>&&kodeKelas=<%= course.getKodeKelas() %>" class="passive-button fw-bold">Mahasiswa</a>
                    <a href="#" class="active-button fw-bold">Nilai</a>
                </div>
            </div>
                <div class="p-0"> 
                            <h6 class="fs-5"><%= namaQuiz%></h6>
                            </div>
            <table class="table table-hover table-bordered rounded-2"> 
                <thead class="table-success text-center">
                    <tr>
                        <th>NIM</th>
                        <th>Nama</th>
                        <th>Nilai Quiz</th>
                        <th></th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Mahasiswa_Quiz mqModel = new Mahasiswa_Quiz();
                        mqModel.where("namaQuiz = '" + namaQuiz + "' AND kodeKelas = '" + kodeKelas + "'");
                        ArrayList<Mahasiswa_Quiz> mq = mqModel.get();
                        for (Mahasiswa_Quiz item : mq) {
                            Mahasiswa mahasiswa = new Mahasiswa();
                            Mahasiswa m = mahasiswa.find(item.getNim());
                    %>
                    <tr>
                        <td><%= item.getNim() %></td>
                        <td><%= m.getNama() %></td>
                        <td><%= item.getNilai() %></td>
                        <!-- Edit Icon -->
                        <td>
                            <%String encodedNama = URLEncoder.encode(namaQuiz, "UTF-8");%>
                            <form method="GET" action="editNilaiQuiz.jsp">
                                <input type="hidden" name="kodeKelas" value="<%= kodeKelas%>">
                                <input type="hidden" name="nim" value="<%= item.getNim()%>">
                                <input type="hidden" name="nama" value="<%= encodedNama%>">
                                <input type="hidden" name="kodeMatkul" value="<%= kodeMatkul %>">
                                <button type="submit" class="btn btn-sm btn-warning"><i class="bi bi-pencil"></i></i></button>
                            </form>
                        </td>
                        <td>
                            <form method="POST" action="<%= request.getContextPath() %>/quizController?menu=delNilai">
                                <input type="hidden" name="kodeMatkul" value="<%= kodeMatkul %>">
                                <input type="hidden" name="kodeKelas" value="<%= kodeKelas %>">
                                <input type="hidden" name="nim" value="<%= item.getNim()%>">
                                <input type="hidden" name="nama" value="<%= item.getNamaQuiz() %>">
                                <button type="submit" class="btn btn-sm btn-danger"><i type="button" class="bi bi-trash3" onclick="return confirm('Apakah Anda yakin ingin menghapus nilai ini?');"></i></button>
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                        
                    </tr>
                </tbody>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>
    </body>
</html>
