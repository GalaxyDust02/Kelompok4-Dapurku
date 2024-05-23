@extends('layouts.app')

@section('content')
<div class="container">
    <div class="recipe-details">
        <h1>{{ $recipe->title }}</h1>

        <div class="recipe-meta">
            <span>
                <i class="fas fa-user"></i> {{ $recipe->user->name }}
            </span>
            <span>
                <i class="fas fa-clock"></i> {{ $recipe->prep_time }} menit
            </span>
            <span>
                <i class="fas fa-users"></i> {{ $recipe->servings }} orang
            </span>
        </div>

        <img src="{{ asset('storage/' . $recipe->image) }}" alt="{{ $recipe->title }}" class="recipe-image img-fluid">

        <h2>Bahan - Bahan</h2>
        <ul>
            @foreach(explode("\n", $recipe->ingredients) as $ingredient)
                <li>{{ $ingredient }}</li>
            @endforeach
        </ul>

        <h2>Cara Membuat</h2>
        <ol>
            @foreach(explode("\n", $recipe->instructions) as $instruction)
                <li>{{ $instruction }}</li>
            @endforeach
        </ol>

        <h2>Catatan</h2>
        <p>{{ $recipe->notes }}</p>

        <div class="rating-and-comments mt-4">
            <h2>Rating & Ulasan</h2>

            @if(auth()->check())
            <form action="{{ route('recipes.ratings.store', $recipe) }}" method="POST" class="mb-3">
                @csrf
                <div class="rating">
                    @for ($i = 5; $i >= 1; $i--)
                        <input type="radio" id="star{{ $i }}" name="rating" value="{{ $i }}" {{ old('rating') == $i ? 'checked' : '' }}>
                        <label for="star{{ $i }}">★</label>
                    @endfor
                </div>
                <textarea name="comment" class="form-control" placeholder="Tuliskan ulasan Anda"></textarea>
                <button type="submit" class="btn btn-primary mt-2">Kirim</button>
            </form>
            @else
            <p>Silahkan <a href="{{ route('login') }}">masuk</a> atau <a href="{{ route('register') }}">daftar</a> untuk memberikan rating dan ulasan.
            </p>
            @endif

            <div class="ratings">
                @forelse ($recipe->ratings as $rating)
                <div class="rating-item border p-3 mb-2">
                    <div class="user-info d-flex align-items-center">
                        <span class="user-initials bg-secondary text-white rounded-circle mr-2" style="display: inline-block; width: 30px; height: 30px; line-height: 30px; text-align: center;">
                            {{ substr($rating->user->name, 0, 2) }}
                        </span>
                        <div>
                            <p class="mb-0"><strong>{{ $rating->user->name }}</strong></p>
                            <p class="rating-date text-muted small">{{ $rating->created_at->diffForHumans() }}</p>
                        </div>
                    </div>
                    <div class="rating-stars">
                        @for ($i = 1; $i <= 5; $i++)
                            <i class="fas fa-star {{ $i <= $rating->rating ? 'filled text-warning' : 'text-secondary' }}"></i>
                        @endfor
                    </div>
                    <p>{{ $rating->comment }}</p>
                </div>
                @empty
                <p>Belum ada rating untuk resep ini.</p>
                @endforelse
            </div>
        </div>

    </div>
</div>
@endsection
