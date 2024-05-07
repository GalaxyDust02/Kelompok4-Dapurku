<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lupa Kata Sandi</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card mt-5">
                    <div class="card-body">
                        <a href="{{ route('login') }}" class="btn btn-light mb-3">
                        <img src="{{asset('images/iconback.png')}}" alt="iconback" class="fas fa-arrow-left">
                        </a>
                        <h3 class="card-title text-center mb-3">Lupa Kata Sandi</h3>
                        <p class="text-muted text-center">Masukkan email Anda yang terdaftar untuk melakukan reset kata sandi.</p>
                        <form method="POST" action="{{route('forgotpassword.action')}}">
                            @csrf
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" id="email" placeholder="Masukkan email">
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Selanjutnya</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
