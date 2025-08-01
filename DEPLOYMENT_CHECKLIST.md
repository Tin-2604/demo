# Deployment Checklist

## ✅ Chuẩn bị dự án
- [x] Cập nhật package.json với script start
- [x] Tạo Procfile cho Railway
- [x] Tạo .gitignore
- [x] Cập nhật app.js để sử dụng biến môi trường
- [x] Tạo README.md
- [x] Tạo DEPLOYMENT.md
- [x] Tạo env.example

## 🔄 Bước tiếp theo

### 1. Tạo GitHub Repository
- [x] Tạo tài khoản GitHub (nếu chưa có)
- [x] Tạo repository mới tên "demo"
- [x] Chạy script deploy.sh hoặc thực hiện thủ công:
  ```bash
  git init
  git add .
  git commit -m "Initial commit"
     git remote add origin https://github.com/Tin-2604/demo.git
  git branch -M main
  git push -u origin main
  ```

### 2. Tạo Railway Account
- [ ] Truy cập https://railway.app
- [ ] Đăng ký bằng GitHub account
- [ ] Cho phép Railway truy cập repositories

### 3. Deploy trên Railway
- [ ] Tạo project mới trên Railway
- [ ] Chọn "Deploy from GitHub repo"
- [ ] Chọn repository "demo"
- [ ] Đợi Railway build và deploy

### 4. Cấu hình Database
- [ ] Tạo MySQL service trên Railway
- [ ] Copy thông tin kết nối database
- [ ] Cập nhật biến môi trường:
  - DB_HOST
  - DB_USER
  - DB_PASSWORD
  - DB_NAME
- [ ] Import database schema từ Dump20250731.sql

### 5. Cấu hình Environment Variables
- [ ] Thêm các biến môi trường trong Railway dashboard:
  ```
  DB_HOST=your-mysql-host
  DB_USER=your-mysql-user
  DB_PASSWORD=your-mysql-password
  DB_NAME=pickleball
  PORT=3000
  SESSION_SECRET=your-secret-key
  ```

### 6. Test ứng dụng
- [ ] Truy cập URL Railway
- [ ] Test đăng ký/đăng nhập
- [ ] Test upload file
- [ ] Test các tính năng chính

### 7. Cấu hình Domain (tùy chọn)
- [ ] Thêm custom domain nếu có
- [ ] Cấu hình SSL certificate

## 🚨 Lưu ý quan trọng

### Về File Uploads
- Railway sử dụng ephemeral filesystem
- File uploads sẽ bị mất khi restart
- Cần migrate sang cloud storage (AWS S3, Cloudinary)

### Về Database
- Monitor database usage
- Backup dữ liệu định kỳ
- Railway có giới hạn storage

### Về Security
- Không commit file .env
- Sử dụng strong session secret
- Cập nhật dependencies thường xuyên

## 📞 Hỗ trợ

Nếu gặp vấn đề:
1. Kiểm tra Railway logs
2. Xem DEPLOYMENT.md để troubleshooting
3. Kiểm tra biến môi trường
4. Đảm bảo database đã được import 