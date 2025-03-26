<%-- 
    Document   : login
    Created on : 15 Dec 2024, 11.10.34
    Author     : Azra Feby Awfiyah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
              crossorigin="anonymous">
        <title>Lecturo - Masuk</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #ABD1C6;
        }
        .left-image {
            background: url('https://mediacdn.quipper.com/media/W1siZiIsIjIwMjIvMDEvMTAvMTUvMDAvNTcvYzVkNzdmMDYtNDEyYy00Y2E3LTk1ZGQtOTA1MzY3NGY3NjMwLyJdLFsicCIsInRodW1iIiwiMTIwMHhcdTAwM2UiLHt9XSxbInAiLCJjb252ZXJ0IiwiLWNvbG9yc3BhY2Ugc1JHQiAtc3RyaXAiLHsiZm9ybWF0IjoianBnIn1dXQ.jpg?sha=6dfa715eca5bd939') no-repeat center center;
            background-size: cover;
            height: 100vh;
        }
        .login-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: auto;
        }
        .login-title {
            font-weight: bold;
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }
        .btn-masuk {
            background-color: #f8b94c;
            color: #000;
            font-weight: bold;
        }
        .btn-masuk:hover {
            background-color: #e0a636;
            color: #000;
        }
    </style>
</head>
<body>
    <div class="container-fluid p-0">
        <div class="row g-0">
            <!-- Kolom Kiri: Gambar -->
            <div class="col-md-6 d-none d-md-block left-image"></div>

            <!-- Kolom Kanan: Form Login -->
            <div class="col-md-6 d-flex align-items-center justify-content-center">
                <div class="login-container w-100">
                    <div class="text-center mb-3">
                        <span class="badge bg-warning rounded-circle p-3"></span>
                    </div>
                    <div class="login-title">Lecturo</div>
                    <p class="text-center">Selamat datang kembali!</p>
                    <form method="POST" action="<%= request.getContextPath() %>/Auth?action=login">
                        <div class="mb-3">
                            <label for="username" class="form-label">Kode Pengguna</label>
                            <input type="text" class="form-control" id="username" name="username" placeholder="Kode anda" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Kata Sandi</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Masukkan kata sandi" required>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-masuk">Masuk</button>
                        </div>
                    </form>
                    <% if (request.getParameter("error") != null) { %>
                    <div class="alert alert-danger mt-3 text-center">
                        Username atau password salah!
                    </div>
                    <% } %>
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