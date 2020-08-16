# linux_challenge_1
3.1. Lấy thông tin hệ thống (2d)
Viết shell script info.sh hiển thị các thông tin về hệ thống, bao gồm:
1. Tên máy, tên bản phân phối
2. Phiên bản hệ điều hành
3. Thông tin CPU (tên, 32bit hay 64bit, tốc độ)
4. Thông tin bộ nhớ vật lí (tổng bao nhiêu MB)
5. Thông tin ổ đĩa còn trống bao nhiêu MB
6. Danh sách địa chỉ IP của hệ thống
7. Danh sách user trên hệ thống (sắp xếp theo thứ tự abc)
8. Thông tin các tiến trình đang chạy với quyền root (sắp xếp theo thứ tự abc)
9. Thông tin các port đang mở (sắp xếp theo port tăng dần)
10. Danh sách các thư mục trên hệ thống cho phép other có quyền ghi
11. Danh sách các gói phần mềm (tên gói, phiên bản) được cài trên hệ thống
Ví dụ đầu ra:
[Thong tin he thong]
Ten may: myname
Ten ban phan phoi: Ubuntu 14.04.4
......
3.2. Xử lý file (2d)
Viết shell script checketc.sh đặt lịch chạy định kỳ 30 phút / lần để thực hiện:
1. Kiểm tra thư mục /etc có file nào được tạo mới (so với lần chạy trước) không? Nếu có,
hiển thị thông tin file đó và nếu là file text thì hiển thị 10 dòng đầu tiên của file
2. Kiểm tra thư mục /etc có file nào thay đổi không? Nếu có hiển thị tên file bị thay đổi
3. Thư mục /etc có file nào bị xóa không? Nếu có hiển thị tên file bị xóa
4. Đẩy log ra file /var/log/checketc.log
5. Gửi email cho quản trị viên root@localhost

Ví dụ file /var/log/checketc.log:
[Log checketc - 12:00:00 12/05/2017]
=== Danh sach file tao moi ===
/etc/hackyou
He thong cua ban da bi ma hoa. Chuyen 100bitcon vao
boy_kute_noi_khong_ai_nghe@yahoo.com de giai ma.

/etc/pam.d/test
xxxxxxxxxx

=== Danh sach file sua doi ===
/etc/pam.d/password-auth

=== Danh sach file bi xoa ===
/etc/shadow
3.3. Monitor SSH (2d)
Viết shell script sshmonitor.sh đặt lịch chạy định kỳ 5 phút / lần để thực hiện:
1. List danh sách các phiên đăng nhập mới qua ssh
2. Nếu phát hiện có phiên đăng nhập mới (so với lần chạy trước) thì gửi email cho quản trị
viên root@localhost.
Ví dụ nội dung mail:
User root dang nhap thanh cong vao thoi gian 12:00:00 12/05/2017

Tài liệu tham khảo:
- Google
- Linux LPIC
