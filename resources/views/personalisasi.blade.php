@extends('template')

@section('title','Personalisasi')

@section('content')
<html>
<head>
    <title>Preferensi Makanan</title>
</head>
<body>

<h2>Masukkan Makanan Favorit Anda</h2>

@if(session('success'))
    <div>
        {{ session('success') }}
    </div>
@endif

<form method="POST" action="/preferences">
    @csrf

    <label for="favorite_food">Makanan Favorit:</label><br>
    <input type="text" id="favorite_food" name="favorite_food"><br><br>

    <button type="submit">Simpan</button>
</form>

</body>
</html>
