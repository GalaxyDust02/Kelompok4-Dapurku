// Mendapatkan data dari HTML
var makanan = Array.from(document.querySelectorAll('#makanan-list li')).map(li => {
  var item = li.textContent;
  var bookmarked = localStorage.getItem(item) === 'true' ? true : false;
  return { name: item, bookmarked: bookmarked };
});
var minuman = Array.from(document.querySelectorAll('#minuman-list li')).map(li => {
  var item = li.textContent;
  var bookmarked = localStorage.getItem(item) === 'true' ? true : false;
  return { name: item, bookmarked: bookmarked };
});

document.querySelector('form').addEventListener('submit', function(e) {
  e.preventDefault();
});

function addBookmarkListeners() {
  // event listeners bookmark
  document.querySelectorAll('.bookmark-button').forEach(function(button) {
      button.addEventListener('click', function() {
          var itemTitle = this.getAttribute('data-title'); // Get title dari item
          // Toogle bookmark status suatu item dari original array
          makanan.forEach(item => {
              if (item.name === itemTitle) {
                  item.bookmarked = !item.bookmarked;
                  localStorage.setItem(itemTitle, item.bookmarked ? 'true' : 'false');
                  this.textContent = item.bookmarked ? 'Unbookmark' : 'Bookmark';
              }
          });
          minuman.forEach(item => {
              if (item.name === itemTitle) {
                  item.bookmarked = !item.bookmarked;
                  localStorage.setItem(itemTitle, item.bookmarked ? 'true' : 'false');
                  this.textContent = item.bookmarked ? 'Unbookmark' : 'Bookmark';
              }
          });
      });
  });
}

// Call the function to add event listeners when the page loads
addBookmarkListeners();

document.querySelector('.form-control').addEventListener('input', function(e) {
  var searchQuery = e.target.value.toLowerCase();

  // Filter makanan and minuman berdasarkan searchQuery
  var filteredMakanan = makanan.filter(function(item) {
    return item.name.toLowerCase().includes(searchQuery);
  });
  var filteredMinuman = minuman.filter(function(item) {
    return item.name.toLowerCase().includes(searchQuery);
  });

  // Update tab content degan data filtered
  document.querySelector('#makanan-list').innerHTML = filteredMakanan.map(item => '<li>' + item.name + '</li>' + '<button class="shareButton">Share Resep</button>' + '<button class="bookmark-button" data-title="' + item.name + '">' + (item.bookmarked ? 'Unbookmark' : 'Bookmark') + '</button>').join('');
  document.querySelector('#minuman-list').innerHTML = filteredMinuman.map(item => '<li>' + item.name + '</li>' + '<button class="shareButton">Share Resep</button>' + '<button class="bookmark-button" data-title="' + item.name + '">' + (item.bookmarked ? 'Unbookmark' : 'Bookmark') + '</button>').join('');

  // Call the function to add event listeners after updating the content
  addBookmarkListeners();

  // event listeners share
  document.querySelectorAll('.shareButton').forEach(function(button) {
      button.addEventListener('click', function() {
          var currentPageLink = window.location.href; // Mendapatkan URL halaman saat ini
          document.getElementById('shareLink').value = currentPageLink; // Mengisi input dengan URL
          document.getElementById('shareModal').style.display = 'block'; // Menampilkan modal
      });
  });

  // // event listeners bookmark
  // document.querySelectorAll('.bookmark-button').forEach(function(button) {
  //     button.addEventListener('click', function() {
  //         var itemTitle = this.getAttribute('data-title'); // mendapatkan title dari item yang dituju
  //         // Toogle bookmark status suatu item dari original array
  //         makanan.forEach(item => {
  //             if (item.name === itemTitle) {
  //                 item.bookmarked = !item.bookmarked;
  //                 localStorage.setItem(itemTitle, item.bookmarked ? 'true' : 'false');
  //                 this.textContent = item.bookmarked ? 'Unbookmark' : 'Bookmark';
  //             }
  //         });
  //         minuman.forEach(item => {
  //             if (item.name === itemTitle) {
  //                 item.bookmarked = !item.bookmarked;
  //                 localStorage.setItem(itemTitle, item.bookmarked ? 'true' : 'false');
  //                 this.textContent = item.bookmarked ? 'Unbookmark' : 'Bookmark';
  //             }
  //         });
  //     });
  // });
});
