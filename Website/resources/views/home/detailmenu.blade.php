<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <title>Detail Menu</title>
</head>
<body>
<div class="container-detail-menu my-5">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="card shadow-sm mb-4">
                    <img src="{{ asset('storage/' . $dish->image) }}" class="card-img-top" alt="{{ $dish->name }}">
                    <div class="card-body">
                        <h3 class="card-title">{{ $dish->name }}</h3>
                        <p class="card-text">
                            <i class="fas fa-clock"></i> {{ $dish->cooking_time }} menit |
                            <i class="fas fa-users"></i> {{ $dish->serving }} Orang
                        </p>
                        <p class="card-text">{{ $dish->description }}</p>

                        <h4>Bahan - Bahan</h4>
                        <ul>
                            @foreach (explode("\n", $dish->ingredients) as $ingredient)
                                <li>{{ $ingredient }}</li>
                            @endforeach
                        </ul>

                        <h4>Cara Membuat</h4>
                        <ol>
                            @foreach (explode("\n", $dish->steps) as $step)
                                <li>{{ $step }}</li>
                            @endforeach
                        </ol>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h4 class="card-title">Catatan</h4>
                        <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing elit.
                            Voluptatum accusantium necessitatibus tempore saepe
                            reiciendis molestias, quod ad neque nostrum culpa
                            asperiores atque dolorum iure laboriosam,
                            eveniet quam obcaecati veniam.
                        </p>

                        <hr>

                        <h4 class="card-title">Rating & Ulasan</h4>
                        <div class="rating-summary">
                            @php
                                $avgRating = $dish->ratings()->avg('rating') ?? 0;
                                $ratingCount = $dish->ratings()->count();
                            @endphp

                            <div class="rating-stars">
                                @for ($i = 1; $i <= 5; $i++)
                                    @if ($i <= $avgRating)
                                        <i class="fas fa-star text-warning"></i>
                                    @else
                                        <i class="far fa-star"></i>
                                    @endif
                                @endfor
                            </div>
                            <span class="average-rating text-warning">
                                {{ number_format($avgRating, 1) }} / 5
                            </span>
                            <span class="rating-count text-muted">
                                ( {{ $ratingCount }} Rating )
                            </span>
                        </div>

                        @if(Auth::check())
                            <form action="{{ route('ratings.store') }}" method="POST" class="mb-3">
                                @csrf
                                <input type="hidden" name="dish_id" value="{{ $dish->id }}">
                                <div class="form-group">
                                    <label for="rating">Berikan Rating:</label>
                                    <select name="rating" id="rating" class="form-control">
                                        @for ($i = 1; $i <= 5; $i++)
                                            <option value="{{ $i }}" {{ old('rating') == $i ? 'selected' : '' }}>
                                                {{ $i }} Bintang
                                            </option>
                                        @endfor
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block">Submit Rating</button>
                            </form>
                        @else
                          <p>
                            <a href="{{ route('login') }}">Login</a> untuk memberikan rating.
                        </p>
                        @endif

                        <hr>

                        <h4 class="card-title">Komentar</h4>
                        @foreach ($dish->comments as $comment)
                            <div class="comment border rounded p-3 mb-3">
                                <p>
                                  <strong>{{ $comment->user->name }}:</strong>
                                  {{ $comment->comment }}
                                </p>
                            </div>
                        @endforeach

                        @if(Auth::check())
                            <form action="{{ route('comments.store') }}" method="POST">
                                @csrf
                                <input type="hidden" name="dish_id" value="{{ $dish->id }}">
                                <div class="form-group">
                                    <label for="comment">Tambahkan Komentar:</label>
                                    <textarea name="comment" id="comment" class="form-control" rows="3"></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block">Submit Komentar</button>
                            </form>
                        @else
                          <p>
                            <a href="{{ route('login') }}">Login</a> untuk berkomentar.
                        </p>
                        @endif
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>
