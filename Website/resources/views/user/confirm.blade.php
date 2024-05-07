<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Reset Success</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card mt-5">
                    <div class="card-body confirm">
                        <img src="{{asset('images/berhasil.png')}}" alt="" class="icon-checmark">
                        <h3 class="card-title text-center mb-3">Kata Sandi Berhasil Direset</h3>
                        <p class="text-muted text-center">Kata sandi Anda berhasil direset! Silahkan masuk menggunakan kata sandi baru Anda.</p>
                        <button type="submit" class="btn btn-primary btn-block">Masuk</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
