# 🚀 Developing with GitHub Codespaces

## Quick Start

1. Click the green **Code** button → **Codespaces** tab → **Create codespace on main**
2. Wait for setup to complete (installs PHP deps, Node deps, creates database)
3. Run: `php artisan serve --host=0.0.0.0 --port=8000`
4. Click "Open in Browser" when prompted

## Importing Your Database

### Option A: Drag & Drop
1. Drag your `.sql` file into the file explorer
2. Run: `mysql -u root newbroker < your-file.sql`

### Option B: Auto-Import
1. Place your `.sql` file at `database/dumps/newbroker.sql`
2. Commit it to the repo
3. Next time you create a Codespace, it imports automatically

## Useful Commands

| Command | What it does |
|---|---|
| `php artisan serve --host=0.0.0.0 --port=8000` | Start the dev server |
| `php artisan migrate` | Run database migrations |
| `mysql -u root newbroker` | Open MySQL console |
| `mysql -u root newbroker < file.sql` | Import SQL file |
| `npm run dev` | Compile frontend assets |
| `npm run watch` | Watch & recompile on changes |
| `php artisan config:clear` | Clear cached config |
| `php artisan cache:clear` | Clear app cache |

## Database Credentials

| Setting | Value |
|---|---|
| Host | `127.0.0.1` |
| Port | `3306` |
| Database | `newbroker` |
| Username | `root` |
| Password | *(empty)* |
