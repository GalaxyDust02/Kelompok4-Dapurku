// Mengambil daftar bookmark
var bookmarkList = document.getElementById('bookmark-list');

// Menambahkan bookmark ke daftar
function addBookmark(title) {
    // Membuat elemen li baru
    var li = document.createElement('li');
    li.textContent = title;

    // Membuat tombol hapus
    var deleteButton = document.createElement('button');
    deleteButton.textContent = 'Hapus';
    deleteButton.addEventListener('click', function() {
        // Menghapus bookmark dari daftar ketika tombol hapus diklik
        li.remove();
        localStorage.setItem(title, 'false'); // Update status bookmark di localStorage
    });

    // Menambahkan tombol hapus ke li
    li.appendChild(deleteButton);

    // Menambahkan li ke daftar bookmark
    bookmarkList.appendChild(li);
}

// Menangani tombol bookmark
document.querySelectorAll('.bookmark-button').forEach(function(button) {
    button.addEventListener('click', function() {
        var title = this.dataset.title;

        // Mengecek apakah resep sudah dibookmark
        if (this.textContent === 'Unbookmark') {
            // Jika ya, hapus bookmark
            this.textContent = 'Bookmark';
            localStorage.setItem(title, 'false'); // Update status bookmark di localStorage
        } else {
            // Jika tidak, tambahkan bookmark
            this.textContent = 'Unbookmark';
            localStorage.setItem(title, 'true'); // Update status bookmark di localStorage
        }
    });
});

// Memuat bookmark saat halaman dimuat
window.addEventListener('DOMContentLoaded', (event) => {
    document.querySelectorAll('.bookmark-button').forEach(function(button) {
        var title = button.dataset.title;
        if (localStorage.getItem(title) === 'true') {
            button.textContent = 'Unbookmark';
        }
    });
});
