<%-- 
    Document   : dashboardAbdimas
    Created on : Jan 2, 2025, 1:31:13 PM
    Author     : Muthia Rihadatul
--%>

<%@page import="model.Dosen_Abdimas"%>
<%@page import="model.Dosen"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Abdimas"%>
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
        <title>Lecturo - Dashboard Abdimas</title>
        <!-- Custom CSS -->
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
            .course-card {
                background-color: #FFFFFF;
                border-radius: 10px;
                padding: 20px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            }
            .btn-url {
                background-color: #004643;
                color: #FFFFFF;
                padding: 7px 12px;
                border-radius: 10px;
            }
            .quiz-card {
                background-color: #ABD1C6;
                border-radius: 10px;
                padding: 20px;
                box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1);
            }
            .quiz-icon {
                background-color: #004643;
                padding: 5px 10px;
                color: #ABD1C6;
                font-size: 20px;
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
        
        <%
            String kodeAbdimas = request.getParameter("kode");
            Abdimas abdimasModel = new Abdimas();
            Abdimas abdimas = abdimasModel.find(kodeAbdimas);
            Dosen_Abdimas DAModel = new Dosen_Abdimas();
            Dosen_Abdimas da = DAModel.find(kodeAbdimas);
            Dosen dosenModel = new Dosen();
            Dosen dosen = dosenModel.find(da.getKodeDosen());
        %>
        <!-- Dashboard Course -->
        <div class="container mt-5">
            <!-- Header -->
            <div class="course-card d-flex justify-content-between align-items-center">
                <div>
                    <h4 class="fw-bold text-dark"><%= abdimas.getNama()%></h4>
                    <% SimpleDateFormat outputFormat = new SimpleDateFormat("dd MMMM yyyy");
                       String formattedDate = outputFormat.format(abdimas.getTanggal()); %>
                    <p class="fw-bold text-dark mb-1"><%= formattedDate%></p>
                    <br>
                    <br>
                    <br>
                    <p class="fw-bold text-dark mb-1">Dosen pembimbing: <%= dosen.getNama()%> [<%= dosen.getKode() %>]</p>
                </div>
            </div>
            
            <!-- Deskripsi -->
            <div class="col-md-13 mb-4 mt-4">
                <div class="quiz-card d-flex flex-column">
                    <!-- Header -->
                    <div class="d-flex align-items-center">
                        <!-- Icon -->
                        <div class="quiz-icon d-flex align-items-center justify-content-center rounded-circle me-3">
                            <i class="bi bi-card-text"></i>
                        </div>
                        <!-- Details -->
                        <h5 class="pb-2 mt-1 mb-2 fw-bold text-dark border-bottom border-white flex-grow-1">
                            Deskripsi
                        </h5>
                    </div>
                    <!-- Footer (Closes + Delete Icon) -->
                    <div class="d-flex justify-content-between align-items-center mt-2">
                        <div class="flex-grow-1">
                            <p class="mb-1 text-muted small">
                                <%= abdimas.getDeskripsi()%>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                        
        <!-- Bootstrap Bundle JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>
    </body>
</html>
