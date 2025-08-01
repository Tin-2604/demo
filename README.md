# Monolithic Demo - Pickleball Tournament Management

Ứng dụng quản lý giải đấu Pickleball được xây dựng với Node.js, Express, MySQL và EJS.

## Tính năng

- Đăng ký và đăng nhập người dùng
- Quản lý thông tin VĐV và đội thi đấu
- Upload avatar cho VĐV
- Phân quyền admin và user
- Giao diện responsive

## Cài đặt Local

1. Clone repository:
```bash
git clone <repository-url>
cd monolithic-demo
```

2. Cài đặt dependencies:
```bash
npm install
```

3. Tạo database MySQL và import file `Dump20250731.sql`

4. Tạo file `.env` với các biến môi trường:
```
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=admin
DB_NAME=pickleball
PORT=3000
```

5. Chạy ứng dụng:
```bash
npm start
```

## Deployment trên Railway

Xem hướng dẫn chi tiết trong file `DEPLOYMENT.md`

## Cấu trúc dự án

- `app.js` - File chính của ứng dụng
- `routes/` - Các route handlers
- `views/` - Templates EJS
- `public/` - Static files (CSS, JS, images)
- `models/` - Database models
- `Dump20250731.sql` - Database schema 