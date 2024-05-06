@extends('template')

@section('title','Dashboard DapurKu')

@section('content')
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #F8F6F2;">
        <div class="container">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/dashboard">
                        <img src="{{ asset('/images/logo.png') }}" alt="DapurKu logo" width = "35" height = "35" style="border-radius: 50%;">
                        </a>
                    </li>
                </ul>
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item">
                    <form class="d-flex">
                            <input class="form-control" type="search" placeholder="Cari resep di sini" aria-label="Search" style="border-radius: 25px;" href="/dashboard">
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item mx-auto" role="presentation">
            <button class="nav-link active" id="makanan-tab" data-bs-toggle="tab" data-bs-target="#makanan" type="button" role="tab" aria-controls="makanan" aria-selected="true">Makanan</button>
        </li>
        <li class="nav-item mx-auto" role="presentation">
            <button class="nav-link" id="minuman-tab" data-bs-toggle="tab" data-bs-target="#minuman" type="button" role="tab" aria-controls="minuman" aria-selected="false">Minuman</button>
        </li>
    </ul>

    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="makanan" role="tabpanel" aria-labelledby="makanan-tab">
            <h3>Makanan</h3>
            <ul id="makanan-list">
                <li>Nasi Goreng</li>
                <button class="shareButton">Share Resep</button>
                <button class="bookmark-button" data-title="Nasi Goreng">Bookmark</button>
                <li>Sate Ayam</li>
                <button class="shareButton">Share Resep</button>
                <button class="bookmark-button" data-title="Sate Ayam">Bookmark</button>
                <li>Bakso</li>
                <button class="shareButton">Share Resep</button>
                <button class="bookmark-button" data-title="Bakso">Bookmark</button>
            </ul>
        </div>
        <div class="tab-pane fade" id="minuman" role="tabpanel" aria-labelledby="minuman-tab">
            <h3>Minuman</h3>
            <ul id="minuman-list">
                <li>Es Teh</li>
                <button class="shareButton">Share Resep</button>
                <button class="bookmark-button" data-title="Es Teh">Bookmark</button>
                <li>Kopi</li>
                <button class="shareButton">Share Resep</button>
                <button class="bookmark-button" data-title="Kopi">Bookmark</button>
                <li>Jus Mangga</li>
                <button class="shareButton">Share Resep</button>
                <button class="bookmark-button" data-title="Jus Mangga">Bookmark</button>
            </ul>
        </div>
    </div>

    <!-- Modal/Pop-up -->
    <div id="shareModal" style="display:none;">
        <div>
            <p>Salin link resep ini:</p>
            <input type="text" id="shareLink" readonly>
            <button onclick="copyLink()">Salin Link</button>
            <button onclick="closeModal()">Tutup</button>
        </div>
    </div>

    <script src="{{ asset('js/searchBarDashboard.js') }}"></script>
    <script src="{{ asset('js/share.js') }}"></script>
    <script src="{{ asset('js/bookmark.js') }}"></script>
@endsection
