<%-- 
    Document   : viewCourse
    Created on : 15 Dec 2024, 12.07.52
    Author     : Azra Feby Awfiyah
--%>

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
        <title>Lecturo - Course</title>
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
            .course-button {
                background-color: #F9BC60;
                color: #004643;
                font-weight: bold;
                border: none;
                padding: 8px 16px;
                border-radius: 20px;
            }
            .course-card {
                background-color: #ABD1C6;
                color: #004643;
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            }
            .view-course-btn {
                background-color: #004643;
                color: #ffffff;
                border: none;
            }
            .view-course-btn:hover {
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
                            <a class="nav-link" href="${pageContext.request.contextPath}/penelitian/viewPenelitian.jsp">Penelitian</a>
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
            <!-- Course Button -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div class="course-button">Daftar Course</div>
                <a href="addCourse.jsp" class="btn course-button rounded-circle"><b>+</b></a>
            </div>
            
            <%
                HttpSession userSession = request.getSession();
                Course course = new Course();
                course.where("dosenPengampu = '" + userSession.getAttribute("kode") + "'");
                ArrayList<Course> rs = course.get();
            %>
            <!-- Course Cards -->
            <div class="row g-4">
                <% for (Course item : rs) { %>
                    <div class="col-md-4"> <!-- Menggunakan col-md-4 agar 3 card sejajar -->
                        <div class="course-card">
                            <div class="p-3">
                                <h6><%= item.getKodeMK() %></h6>
                                <h6><%= item.getNama() %></h6>
                                <p class="text-muted fw-normal">
                                    <%= item.getKodeKelas() %>
                                    <br>
                                    SKS: <%= (int) item.getSKS() %>
                                </p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <a href='dashboardCourse.jsp?kodeMK=<%= item.getKodeMK()%>&&kodeKelas=<%= item.getKodeKelas() %>' class="btn view-course-btn w-100 fw-semibold me-2">View Course</a>
                                    <!-- Edit Icon -->
                                    <a href='editCourse.jsp?kodeMK=<%= item.getKodeMK() %>' class="btn btn-sm btn-transparent me-1" title="Edit">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <!-- Delete Icon -->
                                    <form method="POST" action="<%= request.getContextPath() %>/courseController?menu=del">
                                        <input type="hidden" name="kodeMatkul" value="<%= item.getKodeMK()%>">
                                        <input type="hidden" name="kodeKelas" value="<%= item.getKodeKelas() %>">
                                        <button type="submit" class="btn btn-sm btn-transparent">
                                            <i class="bi bi-trash3" onclick="return confirm('Apakah Anda yakin ingin menghapus mata kuliah ini?');"></i>
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
