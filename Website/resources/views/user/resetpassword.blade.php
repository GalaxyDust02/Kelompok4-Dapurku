<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Kata Sandi</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card mt-5">
                    <div class="card-body">
                        <a href="{{ route('forgotpassword') }}" class="btn btn-light mb-3">
                        <img src="{{asset('images/iconback.png')}}" alt="iconback" class="fas fa-arrow-left">
                        </a>
                        <h3 class="card-title text-center mb-3">Reset Kata Sandi</h3>
                        <p class="text-muted text-center">Masukkan kata sandi Anda yang baru</p>
                        <form method="POST" action="{{route('resetpassword.action')}}" >
                            @csrf
                            <div class="form-group">
                                <label for="password">Kata Sandi</label>
                                <input type="password" class="form-control" id="password" placeholder="Masukkan kata sandi">
                            </div>
                            <div class="form-group">
                                <label for="confirm_password">Konfirmasi Kata Sandi</label>
                                <input type="password" class="form-control" id="confirm_password" placeholder="Masukkan konfirmasi kata sandi">
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Simpan</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
