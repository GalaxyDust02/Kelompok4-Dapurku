@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Buat Resep Baru</h1>

    @if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
    @endif

    <form method="POST" action="{{ route('recipes.store') }}" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label for="title">Judul Resep</label>
            <input type="text" name="title" id="title" class="form-control" value="{{ old('title') }}" required>
        </div>
        <div class="form-group">
            <label for="description">Deskripsi (Opsional)</label>
            <textarea name="description" id="description" class="form-control">{{ old('description') }}</textarea>
        </div>
        <div class="form-group">
            <label for="image">Gambar</label>
            <input type="file" name="image" id="image" class="form-control-file">
        </div>
        <div class="form-row">
            <div class="form-group col-md-4">
                <label for="prep_time">Waktu Persiapan (Menit)</label>
                <input type="number" name="prep_time" id="prep_time" class="form-control" value="{{ old('prep_time') }}" required>
            </div>
            <div class="form-group col-md-4">
                <label for="cook_time">Waktu Memasak (Menit)</label>
                <input type="number" name="cook_time" id="cook_time" class="form-control" value="{{ old('cook_time') }}" required>
            </div>
            <div class="form-group col-md-4">
                <label for="servings">Porsi</label>
                <input type="number" name="servings" id="servings" class="form-control" value="{{ old('servings') }}" required>
            </div>
        </div>
        <div class="form-group">
            <label for="ingredients">Bahan-Bahan (Pisahkan dengan baris baru)</label>
            <textarea name="ingredients" id="ingredients" class="form-control" rows="5" required>{{ old('ingredients') }}</textarea>
        </div>
        <div class="form-group">
            <label for="instructions">Cara Membuat (Pisahkan dengan baris baru)</label>
            <textarea name="instructions" id="instructions" class="form-control" rows="8" required>{{ old('instructions') }}</textarea>
        </div>
        <div class="form-group">
            <label for="notes">Catatan (Opsional)</label>
            <textarea name="notes" id="notes" class="form-control">{{ old('notes') }}</textarea>
        </div>
        <button type="submit" class="btn btn-primary">Tambah Resep</button>
    </form>
</div>
@endsection
