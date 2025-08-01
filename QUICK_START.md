# 🚀 Quick Start - Deploy to Railway

## Bước 1: Push lên GitHub
```bash
# Chạy script tự động
./deploy.sh

# Hoặc thực hiện thủ công:
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/Tin-2604/demo.git
git branch -M main
git push -u origin main
```

## Bước 2: Deploy trên Railway
1. Truy cập https://railway.app
2. Đăng nhập bằng GitHub
3. Click "New Project" → "Deploy from GitHub repo"
4. Chọn repository "demo"

## Bước 3: Cấu hình Database
1. Trong Railway dashboard, click "New" → "Database" → "MySQL"
2. Copy thông tin kết nối
3. Thêm biến môi trường trong "Variables":
   ```
   DB_HOST=your-mysql-host
   DB_USER=your-mysql-user
   DB_PASSWORD=your-mysql-password
   DB_NAME=pickleball
   PORT=3000
   SESSION_SECRET=your-secret-key
   ```

## Bước 4: Import Database
1. Sử dụng MySQL client hoặc Railway console
2. Import file `Dump20250731.sql`

## Bước 5: Test
- Truy cập URL Railway được cung cấp
- Test đăng ký/đăng nhập

## ⚠️ Lưu ý
- File uploads sẽ bị mất khi restart (cần cloud storage)
- Xem DEPLOYMENT.md để biết chi tiết
- Xem DEPLOYMENT_CHECKLIST.md để theo dõi tiến độ 