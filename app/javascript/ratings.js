// ratings.js
document.addEventListener("DOMContentLoaded", function() {
  const stars = document.querySelectorAll(".star");
  stars.forEach(star => {
    star.addEventListener("click", function() {
      const value = parseInt(this.getAttribute("data-value"));
      stars.forEach((s, index) => {
        if (index < value) {
          s.style.color = "#ffd700"; // Màu vàng khi click
        } else {
          s.style.color = "#ffffff"; // Màu trắng cho những sao còn lại
        }
      });
      // Có thể thêm logic khác ở đây, ví dụ như gửi đánh giá lên server
    });
  });
});