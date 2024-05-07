<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Masuk</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="container-body-login">
    <div class="container-fluid container-login bg-light">
        <div class="row">
            <div class="col-md-6 d-none d-md-block container-img">
            </div>
            <div class="col-md-6 container-form">
                <div class="login-form">
                    <img src="images/logo.png" alt="Logo" class="logo">
                    <h2 class="title">Masuk</h2>
                    <form method="POST" action="{{route('login.action')}}" >
                        @csrf
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" name="email" placeholder="Masukkan email" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Kata Sandi</label>
                            <input type="password" class="form-control" name="password" placeholder="Masukkan kata sandi" required>
                        </div>
                        <div class="form-button-group">
                            <a href="{{route('forgotpassword')}}" class="float-end">Lupa kata sandi?</a>
                            <button type="submit" class="btn btn-primary submit-button">Masuk</button>
                        </div>
                    </form>

                    <div class="social-login sosmed-list small-triary">
                        <p>Atau masuk dengan</p>
                        <a href="home/dashboard"><img src="images/twitter.png" alt="Twitter"></a>
                        <a href="home/dashboard"><img src="images/facebook.png" alt="Facebook"></a>
                        <a href="home/'dashboard"><img src="images/google.png" alt="Google"></a>
                    </div>
                    <p class="text-center small-secondary">Belum punya akun? <a href="{{route('register')}}">Daftar</a></p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
