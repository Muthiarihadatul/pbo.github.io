<%-- 
    Document   : viewAbdimas
    Created on : Dec 19, 2024, 11:57:54 AM
    Author     : Muthia Rihadatul
--%>

<%@page import="java.sql.Date" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Dosen_Abdimas"%>
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
        <title>Lecturo - Abdimas</title>
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
            .abdimas-button {
                background-color: #F9BC60;
                color: #004643;
                font-weight: bold;
                border: none;
                padding: 8px 16px;
                border-radius: 20px;
            }
            .abdimas-card {
                background-color: #ABD1C6;
                color: #004643;
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            }
            .view-abdimas-btn {
                background-color: #004643;
                color: #ffffff;
                border: none;
            }
            .view-abdimas-btn:hover {
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
            <!-- abdimas Button -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div class="abdimas-button">Daftar Abdimas</div>
                <a href="addAbdimas.jsp" class="btn abdimas-button rounded-circle"><b>+</b></a>
            </div>
               
            <%
                HttpSession userSession = request.getSession();
                Dosen_Abdimas DAModel = new Dosen_Abdimas();
                Abdimas abdimasModel = new Abdimas();
                Abdimas abdimas = new Abdimas();
                DAModel.where("kodeDosen = '" + userSession.getAttribute("kode") + "'");
                ArrayList<Dosen_Abdimas> das = DAModel.get();
            %>
            <div class="container">
                <div class="row g-4">
                    <% for (Dosen_Abdimas dp : das) { 
                        abdimas = abdimasModel.find(String.valueOf(dp.getKodeAbdimas()));
                    %>
                    <!-- Abdimas Card -->
                    <div class="col-md-4">
                        <div class="abdimas-card shadow-sm rounded">
                            <div class="p-3">
                                <h6><%= abdimas.getNama() %></h6>
                                <p class="text-muted fw-normal">
                                    <% 
                                        SimpleDateFormat outputFormat = new SimpleDateFormat("dd MMMM yyyy");
                                        String formattedDate = outputFormat.format(abdimas.getTanggal()); 
                                    %>
                                    Tanggal : <%= formattedDate %>
                                </p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <a href='dashboardAbdimas.jsp?kode=<%= abdimas.getKode() %>' 
                                       class="btn view-abdimas-btn w-100 fw-semibold me-2">View Abdimas</a>
                                    <!-- Edit Icon -->
                                    <a href='editAbdimas.jsp?kode=<%= abdimas.getKode() %>' 
                                       class="btn btn-sm btn-transparent me-1" title="Edit">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <!-- Delete Icon -->
                                    <form method="POST" action="<%= request.getContextPath() %>/abdimasController?menu=del" class="d-inline">
                                        <input type="hidden" name="kode" value="<%= abdimas.getKode() %>">
                                        <button type="submit" class="btn btn-sm btn-transparent" 
                                                onclick="return confirm('Apakah Anda yakin ingin menghapus abdimas ini?');">
                                            <i class="bi bi-trash3"></i>
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>


        <!-- Bootstrap Bundle JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>
    </body>
</html>