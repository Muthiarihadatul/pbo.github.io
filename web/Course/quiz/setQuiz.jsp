<%-- 
    Document   : setQuiz
    Created on : Jan 3, 2025, 9:43:05 AM
    Author     : Muthia Rihadatul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
              crossorigin="anonymous">
        <title>Lecturo - Buat Quiz</title>
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
                <a class="navbar-brand" href="#">
                    <div class="circle"></div>
                    Lecturo
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="viewCourse.jsp">Mata Kuliah</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="viewPenelitian.jsp">Penelitian</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="viewAbdimas.jsp">Pengabdian Masyarakat</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container d-flex justify-content-center align-items-center p-4">
            <div class="modal-content p-5 shadow-lg w-50">
                <h3 class="mb-4 fw-bold text-dark">Buat Quiz</h3>
                <!-- Form -->
                <form action="<%= request.getContextPath() %>/quizController?menu=add" method="post">
                    <!-- Nama Quiz -->
                    <div class="mb-3">
                        <label for="QuizName" class="form-label fw-bolder text-dark">Nama Quiz</label>
                        <input type="text" class="form-control" id="QuizName" name="nama" placeholder="Masukkan nama quiz" required>
                    </div>

                    <!-- Kode Mata Kuliah -->
                    <div class="mb-3">
                        <label for="kodeMatkul" class="form-label fw-bolder text-dark">Kode Mata Kuliah</label>
                        <input type="text" class="form-control" id="kodeMatkul" name="kodeMatkul" value="<%= request.getParameter("kodeMK") %>" required>
                    </div>


                    <!-- Deadline -->
                    <div class="mb-3">
                        <label for="deadline" class="form-label fw-bolder text-dark">Deadline</label>
                        <input type="text" class="form-control" id="deadline" name="deskripsi" placeholder="Masukkan deadline quiz" required>
                    </div>

                    <!-- Kode Kelas -->
                    <div class="mb-3">
                        <label for="kodeKelas" class="form-label fw-bolder text-dark">Kode Kelas</label>
                        <input type="text" class="form-control" id="kodeKelas" name="kodeKelas" value="<%= request.getParameter("kodeKelas") %>" required>
                    </div>
                    
                    <!-- Submit Button -->
                    <div class="text-center">
                        <button type="submit" class="btn btn-create w-100">Tambah</button>
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