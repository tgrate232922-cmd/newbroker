#!/bin/bash
set -e

echo "📦 Installing PHP dependencies..."
composer install --no-interaction --prefer-dist

echo "🔧 Setting up environment..."
if [ ! -f .env ]; then
    cp .env.example .env
    php artisan key:generate
fi

echo "📦 Installing Node dependencies..."
npm install

echo "🗄️ Setting up database..."
# Wait for MySQL to be ready
for i in {1..30}; do
    if mysql -u root -e "SELECT 1" &>/dev/null; then
        break
    fi
    echo "Waiting for MySQL... ($i/30)"
    sleep 1
done

mysql -u root -e "CREATE DATABASE IF NOT EXISTS newbroker;"

# Update .env database settings
sed -i 's/DB_DATABASE=.*/DB_DATABASE=newbroker/' .env
sed -i 's/DB_USERNAME=.*/DB_USERNAME=root/' .env
sed -i 's/DB_PASSWORD=.*/DB_PASSWORD=/' .env
sed -i 's/DB_HOST=.*/DB_HOST=127.0.0.1/' .env

# Import SQL dump if it exists
if [ -f database/dumps/newbroker.sql ]; then
    echo "📥 Importing database dump..."
    mysql -u root newbroker < database/dumps/newbroker.sql
    echo "✅ Database imported from dump!"
else
    echo "⚠️  No SQL dump found at database/dumps/newbroker.sql"
    echo "   You can drag & drop your .sql file into the editor and run:"
    echo "   mysql -u root newbroker < your-file.sql"
    echo ""
    echo "   Running migrations instead..."
    php artisan migrate --force || true
fi

php artisan config:clear

echo ""
echo "✅ Setup complete! Run 'php artisan serve --host=0.0.0.0 --port=8000' to start."
echo ""
