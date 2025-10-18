# QloApps Deployment Guide for Northflank

This guide will help you deploy QloApps (SINI Hotel Management System) on Northflank for managing ~20 rooms on campus.

## Overview

QloApps is a free, open-source hotel reservation system. This deployment is optimized for:
- **Small-scale operation**: ~20 rooms
- **Lightweight resources**: Free-tier compatible
- **Seasonal usage**: Peak during one month per year

## Prerequisites

1. ✅ Northflank account (already created)
2. ✅ GitHub repository forked (https://github.com/iloha-222/QloApps)
3. ✅ Project created: "SINI Hotel Management System"

## Deployment Architecture

```
┌─────────────────┐
│   Northflank    │
├─────────────────┤
│  QloApps Web    │ ← PHP 8.1 + Apache
│   (Service)     │
└────────┬────────┘
         │
         ↓
┌─────────────────┐
│  MySQL Database │ ← MySQL 8.0
│    (Addon)      │
└─────────────────┘
```

## Step-by-Step Deployment

### Step 1: Push Your Code to GitHub

```bash
# Navigate to your project directory
cd "/Users/lauraneboulenger/my-clients-projects/sini-websites/Hotel Management System"

# Add all deployment files
git add Dockerfile docker-compose.yml .env.example NORTHFLANK_DEPLOYMENT.md

# Commit the changes
git commit -m "Add Northflank deployment configuration"

# Push to your GitHub repository
git push origin main
```

### Step 2: Create MySQL Database in Northflank

1. **Go to your Northflank project**: "SINI Hotel Management System"
2. **Add a Database Addon**:
   - Click **"Add Addon"**
   - Select **"MySQL"**
   - Choose version: **MySQL 8.0**
   - Plan: **Free tier** (sufficient for 20 rooms)
   - Name: `qloapps-db`
   - Database name: `qloapps`
   - Click **"Create Addon"**

3. **Note the connection details** (you'll need these):
   - Host
   - Port
   - Database name
   - Username
   - Password

### Step 3: Create the Web Service

1. **In your Northflank project, click "Add Service"**
2. **Select "Combined Service" (Build & Deploy)**
3. **Configure the service**:

   **Basic Settings:**
   - Name: `qloapps-web`
   - Repository: Connect your GitHub account and select `iloha-222/QloApps`
   - Branch: `main`
   - Build method: **Dockerfile**
   - Dockerfile path: `Dockerfile`

   **Port Configuration:**
   - Container port: `80`
   - Protocol: `HTTP`
   - Public: ✅ Enable

   **Resources (Free Tier Optimized):**
   - CPU: `0.2 vCPU` (minimum)
   - Memory: `512 MB` (QloApps needs at least 256MB, 512MB recommended)
   - Storage: `1 GB` (for uploaded images and files)

### Step 4: Configure Environment Variables

In your Northflank service settings, add these environment variables:

**Database Connection:**
```
DB_SERVER=<your-mysql-addon-host>
DB_NAME=qloapps
DB_USER=<your-mysql-username>
DB_PASSWORD=<your-mysql-password>
DB_PREFIX=qlo_
```

**Application Settings:**
```
DOMAIN=<your-northflank-url>
PROTOCOL=https
DEBUG_MODE=0
```

**Performance:**
```
PHP_MEMORY_LIMIT=128M
PHP_UPLOAD_MAX_FILESIZE=16M
PHP_MAX_EXECUTION_TIME=500
```

> **Note**: Replace `<your-mysql-addon-host>`, `<your-mysql-username>`, `<your-mysql-password>`, and `<your-northflank-url>` with actual values from Northflank.

### Step 5: Deploy the Service

1. Click **"Create Service"**
2. Northflank will:
   - Clone your repository
   - Build the Docker image
   - Deploy the container
   - Assign a public URL

3. **Monitor the deployment**:
   - Check the "Build Logs" tab
   - Wait for the build to complete (2-5 minutes)
   - Check the "Runtime Logs" to ensure the service started

### Step 6: Install QloApps

1. **Access your deployment**:
   - Go to your service in Northflank
   - Click on the public URL (something like `https://qloapps-web-xxxxx.northflank.app`)

2. **Run the QloApps Installation Wizard**:
   - You'll be redirected to `/install`
   - Select language: **English**
   - Accept the license agreement
   - **System Compatibility Check**: Should pass (our Docker image is configured)

3. **Database Configuration**:
   - Database server: Use the value from `DB_SERVER` env var
   - Database name: `qloapps`
   - Database user: From your MySQL addon
   - Database password: From your MySQL addon
   - Database prefix: `qlo_`
   - Test the connection

4. **Shop Information**:
   - Hotel name: `SINI Campus Hotel`
   - Main activity: `Hotel`
   - Country: Your country
   - Timezone: Select your timezone
   - Admin email: Your email
   - Admin password: Create a secure password (save this!)

5. **Complete Installation**:
   - Click "Next" through the wizard
   - Wait for installation to complete (2-5 minutes)
   - **Important**: The installer will create database tables and configure the system

6. **Post-Installation**:
   - You'll be redirected to the admin panel
   - For security, delete the `/install` directory:
     - In Northflank, you may need to rebuild without the install folder
     - Or add a post-deployment script to remove it

### Step 7: Configure Your Hotel

1. **Login to Admin Panel**:
   - URL: `https://your-url/admin`
   - Use the credentials you created during installation

2. **Add Your Hotel**:
   - Go to **Hotels** → **Add Hotel**
   - Enter hotel details:
     - Name: Your campus hotel name
     - Address
     - Contact information
     - Upload hotel images

3. **Add Room Types**:
   - Go to **Rooms** → **Room Types**
   - Create room categories (e.g., Standard, Deluxe)
   - Set pricing
   - Upload room images

4. **Add Rooms**:
   - Go to **Rooms** → **Add Rooms**
   - Add your ~20 rooms
   - Assign room numbers
   - Link to room types
   - Set availability

5. **Configure Booking Settings**:
   - Go to **Settings** → **Booking Settings**
   - Set check-in/check-out times
   - Configure booking policies
   - Set cancellation rules

## Cost Optimization Tips

### For Free Tier Usage:

1. **Resource Management**:
   - Use the minimum resources during off-peak months
   - Scale up only during your busy month

2. **Database**:
   - Regular cleanup of old bookings
   - Archive past season data

3. **Storage**:
   - Optimize images before upload
   - Keep image sizes small
   - Remove unused themes/modules

4. **Monitoring**:
   - Set up Northflank alerts for resource usage
   - Monitor during peak season

### Scaling for Peak Month:

When your busy month arrives:
1. Go to your service settings
2. Increase resources temporarily:
   - CPU: `0.5 vCPU`
   - Memory: `1 GB`
3. Scale back down after peak season

## Backup Strategy

### Database Backups:

1. **Northflank Automatic Backups**:
   - Check if your MySQL addon includes automated backups
   - If not on free tier, consider manual backups

2. **Manual Backup**:
   ```bash
   # From Northflank shell or local connection
   mysqldump -h <db-host> -u <user> -p<password> qloapps > backup_$(date +%Y%m%d).sql
   ```

3. **Backup Schedule**:
   - Daily during peak month
   - Weekly during off-peak
   - Before any major changes

### File Backups:

- Hotel images
- Configuration files
- Uploaded documents

Export these from the admin panel regularly.

## Troubleshooting

### Installation Issues:

**Problem**: "Cannot connect to database"
- **Solution**: Verify database credentials in environment variables
- Check that MySQL addon is running
- Ensure DB_SERVER points to the correct host

**Problem**: "Permission denied" errors
- **Solution**: The Dockerfile sets correct permissions, but verify:
  - `/config` directory is writable
  - `/cache` directory is writable
  - `/img` directory is writable

### Performance Issues:

**Problem**: Slow loading
- **Solution**:
  - Check resource usage in Northflank
  - Clear QloApps cache: Admin → Advanced → Performance
  - Optimize images

**Problem**: Out of memory errors
- **Solution**: Increase memory allocation to 1GB
- Disable unused modules in QloApps

### Deployment Issues:

**Problem**: Build fails
- **Solution**: Check build logs in Northflank
- Verify Dockerfile is present in repository
- Ensure all required files are committed

**Problem**: Service crashes
- **Solution**: Check runtime logs
- Verify environment variables are set correctly
- Check database connection

## Security Recommendations

1. **After Installation**:
   - Delete or rename the `/install` directory
   - Change default admin credentials
   - Use strong passwords

2. **SSL/HTTPS**:
   - Northflank provides automatic HTTPS
   - Verify your site uses HTTPS
   - Force HTTPS in QloApps settings

3. **Regular Updates**:
   - Keep QloApps updated
   - Monitor GitHub for security patches
   - Subscribe to QloApps security announcements

4. **Access Control**:
   - Limit admin access
   - Use different passwords for DB and admin
   - Enable two-factor authentication if available

## Maintenance

### Regular Tasks:

**Daily** (during peak season):
- Check booking notifications
- Verify email delivery
- Monitor resource usage

**Weekly**:
- Backup database
- Review logs for errors
- Check disk space

**Monthly**:
- Update QloApps if new version available
- Review and archive old bookings
- Check for unused modules

### Seasonal Shutdown (Optional):

If you only need the system for one month:

1. **Before shutdown**:
   - Export all data
   - Backup database
   - Document all settings

2. **Shutdown**:
   - Pause the service in Northflank (if available)
   - Or delete and keep backups

3. **Reactivate**:
   - Restore from backup
   - Verify all settings
   - Test booking flow

## Support Resources

- **QloApps Documentation**: https://docs.qloapps.com
- **QloApps Forum**: https://forums.qloapps.com
- **QloApps Demo**: https://demo.qloapps.com (username: demo@demo.com, password: demodemo)
- **Northflank Documentation**: https://northflank.com/docs
- **GitHub Issues**: https://github.com/iloha-222/QloApps/issues

## Next Steps

1. ✅ Push code to GitHub
2. ✅ Create MySQL addon in Northflank
3. ✅ Create and deploy web service
4. ✅ Complete QloApps installation
5. ✅ Configure hotel and rooms
6. ✅ Test booking flow
7. ✅ Set up backups
8. ✅ Go live!

---

**Questions or Issues?**
- Check the Northflank logs first
- Refer to QloApps documentation
- Check your environment variables
- Verify database connection

Good luck with your SINI Campus Hotel Management System!
