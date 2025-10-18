# QloApps Deployment Quick Start

## For SINI Campus Hotel Management (~20 rooms)

### 🚀 Quick Deploy to Northflank

#### 1. Push to GitHub (2 minutes)

```bash
cd "/Users/lauraneboulenger/my-clients-projects/sini-websites/Hotel Management System"

# Add all files
git add .

# Commit
git commit -m "Add Northflank deployment configuration for SINI Hotel"

# Push
git push origin main
```

#### 2. In Northflank Dashboard (10 minutes)

**A. Create MySQL Database:**
- Click "Add Addon" → MySQL 8.0
- Name: `qloapps-db`
- Plan: Free tier
- Database: `qloapps`
- Save connection details!

**B. Create Web Service:**
- Click "Add Service" → Combined Service
- Connect GitHub: `iloha-222/QloApps`
- Build: Use Dockerfile
- Port: 80 (HTTP, Public)
- Resources: 0.2 vCPU, 512 MB RAM

**C. Add Environment Variables:**
```
DB_SERVER=<your-db-host>
DB_NAME=qloapps
DB_USER=<your-db-user>
DB_PASSWORD=<your-db-password>
DB_PREFIX=qlo_
PROTOCOL=https
DEBUG_MODE=0
```

- Click "Create Service"

#### 3. Install QloApps (5 minutes)

1. Open your Northflank URL (e.g., `https://qloapps-web-xxxxx.northflank.app`)
2. Follow installation wizard
3. Configure database (use env vars from step 2C)
4. Create admin account
5. Complete setup

#### 4. Configure Hotel (15 minutes)

1. Login to `/admin`
2. Add your hotel details
3. Create room types
4. Add your ~20 rooms
5. Set pricing and availability

### ✅ Done! Your hotel booking system is live.

---

## 📁 Important Files Created

- `Dockerfile` - Container configuration
- `docker-compose.yml` - Local testing
- `.env.example` - Environment variables template
- `.dockerignore` - Build optimization
- `NORTHFLANK_DEPLOYMENT.md` - Complete deployment guide

## 🔧 Local Testing (Optional)

```bash
# Create .env file
cp .env.example .env

# Edit .env with your local settings
nano .env

# Start services
docker-compose up -d

# Access at http://localhost:8080
```

## 📊 Resource Usage (Free Tier)

- **Web Service**: 512 MB RAM, 0.2 vCPU
- **Database**: MySQL 8.0 (free tier)
- **Storage**: ~1 GB
- **Perfect for**: ~20 rooms, seasonal use

## 🆘 Need Help?

See `NORTHFLANK_DEPLOYMENT.md` for:
- Detailed step-by-step instructions
- Troubleshooting guide
- Security recommendations
- Backup strategies
- Scaling for peak season

## 📞 Support

- QloApps Docs: https://docs.qloapps.com
- QloApps Forum: https://forums.qloapps.com
- Demo: https://demo.qloapps.com (demo@demo.com / demodemo)
