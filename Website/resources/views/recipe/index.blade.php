@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        @foreach($recipes as $recipe)
        <div class="col-md-4 mb-4">
            <div class="card">
                <a href="{{ route('recipes.show', $recipe) }}">
                    <img src="{{ asset('storage/' . $recipe->image) }}" alt="{{ $recipe->title }}" class="card-img-top">
                </a>
                <div class="card-body">
                    <h5 class="card-title">{{ $recipe->title }}</h5>
                    <p class="card-text">{{ Str::limit($recipe->description, 100) }}</p>
                    <a href="{{ route('recipes.show', $recipe) }}" class="btn btn-primary">Lihat Resep</a>
                </div>
            </div>
        </div>
        @endforeach
    </div>

    <div class="d-flex justify-content-center">
        {{ $recipes->links() }}
    </div>
</div>
@endsection
