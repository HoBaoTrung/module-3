function showVideo(index) {
    // Ẩn tất cả video content
    const videoContents = document.querySelectorAll('.video-content');
    videoContents.forEach(content => {
        content.style.display = 'none';
    });

    // Hiển thị video được chọn
    const selectedVideo = document.getElementById(`video-${index}`);
    selectedVideo.style.display = 'block';

    // Cập nhật trạng thái active cho video item
    const videoItems = document.querySelectorAll('.video-item');
    videoItems.forEach(item => {
        item.classList.remove('active');
    });
    videoItems[index].classList.add('active');
}