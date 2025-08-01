#!/bin/bash

echo "🚀 Bắt đầu quá trình deployment..."

# Kiểm tra xem có git repository chưa
if [ ! -d ".git" ]; then
    echo "📁 Khởi tạo git repository..."
    git init
fi

# Thêm tất cả file
echo "📦 Thêm file vào git..."
git add .

# Commit
echo "💾 Commit changes..."
git commit -m "Prepare for Railway deployment"

# Kiểm tra remote origin
if ! git remote | grep -q origin; then
    echo "⚠️  Chưa có remote origin. Vui lòng thêm remote origin:"
    echo "   git remote add origin https://github.com/Tin-2604/demo.git"
    echo "   Sau đó chạy lại script này."
    exit 1
fi

# Push lên GitHub
echo "⬆️  Push lên GitHub..."
git branch -M main
git push -u origin main

echo "✅ Hoàn thành! Bây giờ bạn có thể:"
echo "1. Truy cập https://railway.app"
echo "2. Tạo project mới"
echo "3. Chọn 'Deploy from GitHub repo'"
echo "4. Chọn repository 'monolithic-demo'"
echo "5. Cấu hình database và biến môi trường" 