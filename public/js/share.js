// Fungsi untuk membuka modal dan mengisi input dengan URL saat ini
document.querySelectorAll('.shareButton').forEach(function(button) {
    button.addEventListener('click', function() {
        var currentPageLink = window.location.href; // Mendapatkan URL halaman saat ini
        document.getElementById('shareLink').value = currentPageLink; // Mengisi input dengan URL
        document.getElementById('shareModal').style.display = 'block'; // Menampilkan modal
    });
});

// Fungsi untuk menutup modal
function closeModal() {
    document.getElementById('shareModal').style.display = 'none';
}

// Fungsi untuk menyalin link ke clipboard dengan API Clipboard
function copyLink() {
    var copyText = document.getElementById("shareLink").value;
    navigator.clipboard.writeText(copyText).then(() => {
        // Tampilkan pesan bahwa link telah disalin, opsional
        alert("Link disalin: " + copyText);
    }).catch(err => {
        console.error('Gagal menyalin: ', err);
    });
}
