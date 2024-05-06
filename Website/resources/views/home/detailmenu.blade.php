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
    <div class="container">
        <div class="detail-menu-container">
            <div class="menu-header">
                <h1 class="menu-title">Snow Chocolate Cupcake</h1>
                <div class="menu-author">
                    <img src="{{ asset('images/author_pic.jpg') }}" alt="Author Profile Pic" class="author-profile-pic">
                    <span class="author-name">Psyche Poli</span>
                </div>
            </div>
            <div class="menu-details">
                <div class="ingredients-container">
                    <h3>Bahan - Bahan</h3>
                    <ul class="ingredients-list">
                        <li>1 kotak tepung pondan coklat</li>
                        <li>6 butir telur</li>
                        <li>Bahan frosting coklat (sesuai instruksi kemasan)</li>
                        <li>Strawberry dan hiasan - sesuai selera</li>
                        <li>1 sdm cokelat cair</li>
                    </ul>
                </div>
                <div class="instructions-container">
                    <h3>Cara Membuat</h3>
                    <ol class="instructions-list">
                        <li>Pecahkan telur, kocok hingga mengembang dengan menggunakan mixer</li>
                        <li>Lelehkan margarin, masukkan tepung pondan instan kedalam adonan telur</li>
                        <li>Tuang adonan kedalam cetakan cupcake dengan ketinggian 3/4</li>
                        <li>Panggang 170 celcius selama 25 menit hingga matang. Tes kematangan dengan tusukan lidi. Biarkan dingin dan oles dengan frosting.</li>
                        <li>Hias diatas cupcake yang sudah dingin, kemudian beri hiasan. Selamat mencoba</li>
                    </ol>
                </div>
                <div class="notes-container">
                    <h3>Catatan</h3>
                    <p>Pernah dengar games Cupcakes
                        Fever? Atau serial TV DC Cupcakes?
                        Cupcakes atau kue mangkok memang
                        cantik ya! Lain halnya
                        dengan cakes yang berukuran besar,
                        dengan cupcakes ini kamu hanya
                        menghias area topping. Tak hanya
                        cantik, kue ini juga sangat
                        menggemaskan!</p>

                    <p>Membuat cupcakes ini ternyata
                        sangat sederhana! Anda cukup buat
                        2 adonan, yaitu adonan dasar kue
                        dan topping frosting. Setelah kue
                        matang tinggal dihias dan
                        menyelesaikan toppingnya!
                        dengan menghiasnya dengan topping!</p>
                </div>
            </div>
            <div class="rating-comment-container">
                <h2>Rating & Ulasan</h2>
                <div class="rating-stars">
                    <span class="rating-star">★</span>
                    <span class="rating-star">★</span>
                    <span class="rating-star">★</span>
                    <span class="rating-star">★</span>
                    <span class="rating-star">★</span>
                </div>
                <ul class="comment-list">
                    <li class="comment-item">
                        <div class="comment-header">
                            <img src="{{ asset('images/author_pic.jpg') }}" alt="Author Profile Pic" class="author-profile-pic">
                            <span class="author-name">Psyche Poli</span>
                        </div>
                        <p class="comment-content">Aku udah recook, hasilnya sesuai, rasanya enak. Thank you ya kak resepnya!</p>
                    </li>
                    </ul>
            </div>
        </div>
    </div>
    <script src="{{ asset('js/ratecomment.js') }}"></script>
</body>
</html>
