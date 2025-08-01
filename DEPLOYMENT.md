# Hướng dẫn Deployment trên Railway

## Bước 1: Tạo Repository trên GitHub

1. **Tạo tài khoản GitHub** (nếu chưa có):
   - Truy cập https://github.com
   - Đăng ký tài khoản mới

2. **Tạo repository mới**:
   - Click "New repository"
   - Đặt tên: `demo`
   - Chọn "Public" hoặc "Private"
   - Không tích vào "Initialize this repository with a README"
   - Click "Create repository"

3. **Push code lên GitHub**:
   ```bash
   # Khởi tạo git repository local
   git init
   
   # Thêm tất cả file
   git add .
   
   # Commit đầu tiên
   git commit -m "Initial commit"
   
       # Thêm remote origin
    git remote add origin https://github.com/Tin-2604/demo.git
   
   # Push lên GitHub
   git branch -M main
   git push -u origin main
   ```

## Bước 2: Tạo tài khoản Railway

1. **Đăng ký Railway**:
   - Truy cập https://railway.app
   - Click "Start a New Project"
   - Đăng nhập bằng GitHub account

2. **Kết nối GitHub**:
   - Railway sẽ yêu cầu quyền truy cập GitHub
   - Cho phép Railway truy cập repositories

## Bước 3: Deploy ứng dụng

1. **Tạo project mới trên Railway**:
   - Click "Deploy from GitHub repo"
   - Chọn repository `demo`
   - Railway sẽ tự động detect Node.js project

2. **Cấu hình biến môi trường**:
   - Trong project dashboard, click "Variables"
   - Thêm các biến môi trường:
     ```
     DB_HOST=your-mysql-host
     DB_USER=your-mysql-user
     DB_PASSWORD=your-mysql-password
     DB_NAME=pickleball
     PORT=3000
     ```

## Bước 4: Cấu hình Database

1. **Tạo MySQL database**:
   - Trong Railway dashboard, click "New"
   - Chọn "Database" → "MySQL"
   - Railway sẽ tạo MySQL instance

2. **Lấy thông tin kết nối**:
   - Click vào MySQL service
   - Copy thông tin kết nối (host, user, password, database)
   - Cập nhật vào biến môi trường

3. **Import database schema**:
   - Sử dụng MySQL client hoặc Railway console
   - Import file `Dump20250731.sql`

## Bước 5: Cấu hình Domain

1. **Tạo custom domain** (tùy chọn):
   - Trong project dashboard, click "Settings"
   - Scroll xuống "Domains"
   - Thêm custom domain nếu có

2. **Lấy URL Railway**:
   - Railway sẽ tự động tạo URL dạng: `https://your-app-name.railway.app`

## Bước 6: Kiểm tra Deployment

1. **Xem logs**:
   - Trong Railway dashboard, click "Deployments"
   - Xem logs để đảm bảo không có lỗi

2. **Test ứng dụng**:
   - Truy cập URL Railway
   - Kiểm tra các tính năng chính

## Troubleshooting

### Lỗi thường gặp:

1. **Database connection failed**:
   - Kiểm tra biến môi trường DB_*
   - Đảm bảo MySQL service đã được tạo

2. **Port binding error**:
   - Đảm bảo sử dụng `process.env.PORT`

3. **Static files not found**:
   - Kiểm tra đường dẫn trong `app.use(express.static('public'))`

4. **Upload directory error**:
   - Railway sử dụng ephemeral filesystem
   - Cần sử dụng cloud storage cho file uploads

### Cập nhật ứng dụng:

```bash
# Sau khi thay đổi code
git add .
git commit -m "Update app"
git push origin main

# Railway sẽ tự động deploy
```

## Lưu ý quan trọng

1. **File uploads**: Railway sử dụng ephemeral filesystem, file uploads sẽ bị mất khi restart. Cần sử dụng cloud storage như AWS S3, Cloudinary.

2. **Database**: Railway MySQL có giới hạn storage, cần monitor usage.

3. **Environment variables**: Không commit file `.env` lên GitHub.

4. **Logs**: Sử dụng Railway logs để debug issues.

5. **Scaling**: Railway có thể scale ứng dụng theo traffic. 