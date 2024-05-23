<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DapurKu</title>

    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>
<body>
    <header>
        <div class="container">
            <a href="{{ route('recipes.index') }}" class="logo">
                <img src="{{ asset('images/logo.png') }}" alt="DapurKu Logo" height="40">
            </a>
            <form action="#" class="search-form">
                <input type="text" placeholder="Cari resep di sini">
                <button type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </form>
            <div class="user-actions">
                @if(auth()->check())
                    <a href="{{ route('profile.show') }}">Profile</a>
                    <form method="POST" action="{{ route('logout') }}">
                        @csrf
                        <button type="submit">Logout</button>
                    </form>
                @else
                    <a href="{{ route('login') }}">Masuk</a>
                    <a href="{{ route('register') }}">Daftar</a>
                @endif
            </div>
        </div>
    </header>

    <main>
        @if (session('success'))
            <div class="alert alert-success" role="alert">
                {{ session('success') }}
            </div>
        @endif

        @yield('content')
    </main>

    <footer>
        <div class="container">
            <div class="footer-content">
                <img src="{{ asset('images/logo.png') }}" alt="DapurKu Logo" height="30">
                <div class="social-media">
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                </div>
                <div class="app-download">
                    <p>Unduh aplikasi kami</p>
                    <a href="#">
                        <img src="{{ asset('images/playstore.png') }}" alt="Get it on Google Play" height="40">
                    </a>
                </div>
            </div>
            <p class="copyright">Copyright © {{ date('Y') }} DapurKu.id. reserved</p>
        </div>
    </footer>
</body>
</html>
