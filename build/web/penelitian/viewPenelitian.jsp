<%-- 
    Document   : viewPenelitian
    Created on : 28 Dec 2024, 16.40.21
    Author     : Azra Feby Awfiyah
--%>

<%@page import="java.sql.Date" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Dosen_Penelitian"%>
<%@page import="model.Penelitian"%>
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
        <title>Lecturo - Penelitian</title>
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
            .penelitian-button {
                background-color: #F9BC60;
                color: #004643;
                font-weight: bold;
                border: none;
                padding: 8px 16px;
                border-radius: 20px;
            }
            .penelitian-card {
                background-color: #ABD1C6;
                color: #004643;
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            }
            .view-penelitian-btn {
                background-color: #004643;
                color: #ffffff;
                border: none;
            }
            .view-penelitian-btn:hover {
                background-color: #F9BC60;
                color: #004643;
            }
            .btn-transparent:hover {
                background-color: #F9BC60;
                color: #004643;
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
                            <a class="nav-link" href="${pageContext.request.contextPath}viewPenelitian.jsp">Penelitian</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/abdimas/viewAbdimas.jsp">Pengabdian Masyarakat</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>


        <!-- Content -->
        <div class="container mt-4">
            <!-- Penelitian Button -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div class="penelitian-button">Daftar Penelitian</div>
                <a href="addPenelitian.jsp" class="btn penelitian-button rounded-circle"><b>+</b></a>
            </div>
               
            <%
                HttpSession userSession = request.getSession();
                Dosen_Penelitian DPModel = new Dosen_Penelitian();
                Penelitian penelitianModel = new Penelitian();
                Penelitian penelitian = new Penelitian();
                DPModel.where("kodeDosen = '" + userSession.getAttribute("kode") + "'");
                ArrayList<Dosen_Penelitian> dps = DPModel.get();
            %>
            <!-- Penelitian Cards -->
            <div class="row g-4">
                <% for (Dosen_Penelitian dp : dps) { 
                    penelitian = penelitianModel.find(String.valueOf(dp.getKodePenelitian()));
                %>
                    <div class="col-md-4"> <!-- Menggunakan col-md-4 agar 3 card sejajar -->
                        <div class="penelitian-card">
                            <div class="p-3">
                                <h6><%= penelitian.getNama() %></h6>
                                <h6><%= penelitian.getBidang() %></h6>
                                <p class="text-muted fw-normal">
                                    <% 
                                        SimpleDateFormat outputFormat = new SimpleDateFormat("dd MMMM yyyy");
                                        String formattedDate = outputFormat.format(penelitian.getTanggal()); 
                                    %>
                                    Tanggal : <%= formattedDate %>
                                </p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <a href='dashboardPenelitian.jsp?kode=<%= penelitian.getKode()%>' class="btn view-penelitian-btn w-100 fw-semibold me-2">View Penelitian</a>
                                    <!-- Edit Icon -->
                                    <a href='editPenelitian.jsp?kode=<%= penelitian.getKode()%>' class="btn btn-sm btn-transparent me-1" title="Edit">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <!-- Delete Icon -->
                                    <form method="POST" action="<%= request.getContextPath() %>/penelitianController?menu=del">
                                        <input type="hidden" name="kode" value="<%= penelitian.getKode()%>">
                                        <button type="submit" class="btn btn-sm btn-transparent">
                                            <i class="bi bi-trash3" onclick="return confirm('Apakah Anda yakin ingin menghapus penelitian ini?');"></i>
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                <% } %>
            </div>


        <!-- Bootstrap Bundle JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>
    </body>
</html>