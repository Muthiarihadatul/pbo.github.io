<%-- 
    Document   : addCourse
    Created on : 15 Dec 2024, 12.07.01
    Author     : Azra Feby Awfiyah
--%>

<%@page import="model.Dosen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
              crossorigin="anonymous">
        <title>Lecturo - Tambah Course</title>
        <!-- Custom CSS -->
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
                            <a class="nav-link" href="${pageContext.request.contextPath}/penelitian/viewPenelitian.jsp">Penelitian</a>
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
                <h3 class="mb-4 fw-bold text-dark">Create Course</h3>
                <!-- Form -->
                <form action="<%= request.getContextPath() %>/courseController?menu=add" method="post">
                    <!-- Kode Mata Kuliah -->
                    <div class="mb-3">
                        <label for="courseCode" class="form-label fw-bolder text-dark">Kode Mata Kuliah</label>
                        <input type="text" class="form-control" id="courseCode" name="kodeMatkul" placeholder="isi kode mata kuliah" required>
                    </div>
                    <!-- Nama Mata Kuliah -->
                    <div class="mb-3">
                        <label for="courseName" class="form-label fw-bolder text-dark">Nama Mata Kuliah</label>
                        <input type="text" class="form-control" id="courseName" name="nama" placeholder="isi nama mata kuliah" required>
                    </div>
                    <!-- Kelas -->
                    <div class="mb-3">
                        <label for="classCode" class="form-label fw-bolder text-dark">Kelas</label>
                        <input type="text" class="form-control" id="classCode" name="kodeKelas" placeholder="isi kelas" required>
                    </div>
                    <!-- SKS -->
                    <div class="mb-3">
                        <label for="sks" class="form-label fw-bolder text-dark">SKS</label>
                        <input type="number" class="form-control" id="sks" name="sks" placeholder="isi sks" required>
                    </div>
                    <!-- Kode Dosen Koor -->
                    <div class="mb-3">
                        <label for="kodeDosenK" class="form-label fw-bolder text-dark">Kode Dosen Koor</label>
                        <input type="text" class="form-control" id="kodeDosenK" name="kodeDosenK" placeholder="isi kode dosen koor" required>
                    </div>
                    <!-- Dosen -->
                    <%
                        HttpSession userSession = request.getSession();
                        Dosen dosenModel = new Dosen();
                        Dosen dosen = dosenModel.find(String.valueOf(userSession.getAttribute("kode")));
                    %>
                    <p class="text-black fw-bolder">Dosen: <%= dosen.getNama() %> [<%= dosen.getKode()%>]</p>
                    <input type="hidden" name="dosenPengampu" value="<%= dosen.getKode()%>">
                    <!-- Submit Button -->
                    <div class="text-center">
                        <button type="submit" class="btn btn-create w-100"">Tambah</button>
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