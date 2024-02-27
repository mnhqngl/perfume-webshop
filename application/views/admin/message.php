<!-- message.php -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Message</title>
<style>
.alert {
    position: fixed;
    top: -100px; /* Thay đổi giá trị này tùy thuộc vào vị trí bạn muốn thông báo xuất hiện ban đầu */
    left: 64%;
	width: 70%;
    transform: translateX(-50%);
    transition: top 0.5s ease; /* Thêm hiệu ứng trượt xuống */
    z-index: 1000; /* Đảm bảo thông báo nằm trên các phần tử khác */
}
</style>
</head>
<body>
<div class="row">
    <?php if (isset($message_success) && !empty($message_success)) { ?>
        <div id="successMessage" class="alert bg-success" role="alert" style="padding: 6px;margin-bottom: 0px;">
            <svg class="glyph stroked checkmark"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#stroked-checkmark"></use></svg><?php echo $message_success; ?><a class="remove-mess pull-right"><span class="glyphicon glyphicon-remove"></span></a>
        </div>
    <?php } ?>
    <?php if (isset($message_fail) && !empty($message_fail)) { ?>
        <div id="failMessage" class="alert bg-danger" role="alert" style="padding: 6px;margin-bottom: 0px;">
            <svg class="glyph stroked cancel"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#stroked-cancel"></use></svg><?php echo $message_fail; ?><a class="remove-mess pull-right"><span class="glyphicon glyphicon-remove"></span></a>
        </div>
    <?php } ?>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Hiển thị thông báo trượt xuống
    function showSlideDown(element) {
        element.style.top = '50px'; // Thay đổi vị trí top cho phù hợp
    }

    // Ẩn thông báo trượt lên
    function hideSlideUp(element) {
        element.style.top = '-100px'; // Đẩy thông báo lên khỏi màn hình
    }

    // Tìm tất cả các thông báo và thêm hiệu ứng
    var alertMessages = document.querySelectorAll('.alert');
    alertMessages.forEach(function(alertMessage) {
        showSlideDown(alertMessage); // Hiển thị thông báo khi trang được tải lần đầu
        setTimeout(function() {
            hideSlideUp(alertMessage); // Ẩn thông báo sau một khoảng thời gian
        }, 3000); // Thời gian hiển thị thông báo (3 giây)
    });

    // Xử lý sự kiện khi người dùng nhấn vào nút "Đóng"
    var closeButtons = document.querySelectorAll('.remove-mess');
    closeButtons.forEach(function(closeButton) {
        closeButton.addEventListener('click', function() {
            hideSlideUp(this.parentNode); // Ẩn thông báo chứa nút đã nhấn
        });
    });
});
</script>
</body>
</html>
