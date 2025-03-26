<%-- 
    Document   : editNilaiQuiz
    Created on : Jan 3, 2025, 9:43:38 AM
    Author     : Muthia Rihadatul
--%>

<%@page import="java.net.URLDecoder"%>
<%@page import="model.Mahasiswa"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Mahasiswa_Quiz"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
              crossorigin="anonymous">
        <title>Lecturo - Edit Nilai Quiz</title>
        <style>
            body {
                background-color: #004643; /* Warna latar belakang */
                color: #fff;
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
            .modal-content {
                background-color: #ABD1C6; /* Warna putih kehijauan */
                border-radius: 10px;
            }
            .btn-create {
                background-color: #F9BC60;
                color: #004643;
                font-weight: bold;
            }
            .btn-create:hover {
                background-color: #e9a932;
                color: #000;
            }
        </style>
    </head>
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
                            <a class="nav-link" href="viewPenelitian.jsp">Penelitian</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/abdimas/viewAbdimas.jsp">Pengabdian Masyarakat</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
                           
        <!-- Main Content -->
        <div class="container d-flex justify-content-center align-items-center p-4">
            <div class="modal-content p-5 shadow-lg w-50">
                <h3 class="mb-4 fw-bold text-dark text-center">Edit Nilai Quiz</h3>
                <div class="p-0 text-black">
                    <%
                        String decodedNama = request.getParameter("nama");
                        String kodeMatkul = request.getParameter("kodeMatkul");
                        String namaQuiz = URLDecoder.decode(decodedNama, "UTF-8");
                        String nim = request.getParameter("nim");
                        Mahasiswa_Quiz mqModel = new Mahasiswa_Quiz();
                        mqModel.where("namaQuiz = '" + namaQuiz + "' AND nim = '" + nim + "'");
                        ArrayList<Mahasiswa_Quiz> mq = mqModel.get();
                        Mahasiswa_Quiz item = mq.get(0);
                        Mahasiswa mahasiswa= new Mahasiswa();
                        Mahasiswa m = mahasiswa.find(nim);
                    %>
                    <p>NIM: <%= item.getNim() %></p>
                    <p>Nama: <%= m.getNama() %></p>
                </div>
                <!-- Form -->
                <form action="<%= request.getContextPath() %>/quizController?menu=updNilai" method="post">
                    <input type="hidden" name="nim" value="<%= nim%>">
                    <input type="hidden" name="nama" value="<%= namaQuiz%>">
                    <input type="hidden" name="kodeMatkul" value="<%= kodeMatkul %>">
                    <input type="hidden" name="kodeKelas" value="<%= m.getKodeKelas() %>">
                    <!-- Nilai Quiz -->
                    <div class="mb-3">
                        <label for="nilaiQuiz" class="form-label text-dark">Nilai Quiz</label>
                        <input type="number" class="form-control" id="nilaiQuiz" name="nilai" value=<%= item.getNilai()%> required>
                    </div>
                   
                    <!-- Submit Button -->
                    <div class="text-center">
                        <button type="submit" class="btn btn-create w-100">Edit</button>
                    </div>
                </form>
            </div>
        </div>
        
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>
    </body>
</html>
