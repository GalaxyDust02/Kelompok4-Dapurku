<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daftar</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="container-body-signup">
    <div class="container-fluid container-signup bg-light">
        <div class="row">
            <div class="col-md-6 d-none d-md-block container-img2">
            </div>
            <div class="col-md-6 container-form">
                <div class="signup-form">
                    <img src="images/logo.png" alt="Logo" class="logo">
                    <h2 class="title">Daftar</h2>

                    <form method="POST" action="{{route('register.action')}}" >
                        @csrf
                        <div class="form-group">
                            <label for="email">Nama</label>
                            <input type="name" class="form-control" name="name" placeholder="Masukkan nama"  value="{{old('name')}}" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" name="email" placeholder="Masukkan email"  value="{{old('email')}}" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Kata Sandi</label>
                            <input type="password" class="form-control" name="password" placeholder="Masukkan kata sandi" required>
                        </div>
                        <div class="form-group">
                            <label for="password_confirmation">Konfirmasi Kata Sandi</label>
                            <input type="password" class="form-control" name="password_confirmation" placeholder="Masukkan Konfirmasi kata sandi" required>
                        </div>
                        <div class="form-button-group">
                            <button type="submit" class="btn btn-primary submit-button">Daftar</button>
                        </div>
                    </form>

                    <div class="social-login sosmed-list small-triary">
                        <p>Atau daftar dengan</p>
                        <a href="home/dashboard"><img src="images/twitter.png" alt="Twitter"></a>
                        <a href="home/dashboard"><img src="images/facebook.png" alt="Facebook"></a>
                        <a href="home/dashboard"><img src="images/google.png" alt="Google"></a>
                    </div>
                    <p class="text-center small-secondary">Sudah punya akun? <a href="{{route('login')}}">Masuk</a></p>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
