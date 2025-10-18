# SINI Campus Accommodation System

## 🏨 Sarnath International Nyingma Institute Campus - Room Booking System

**Location**: Varanasi, Uttar Pradesh, India
**Total Rooms**: 28 (26 Double, 2 Triple)
**Purpose**: Free internal accommodation for SINI members
**Peak Season**: January

---

## 📚 Documentation Guide

### Start Here

**New to this project?** → Read `SINI_DEPLOYMENT_STEPS.md`
This is your complete step-by-step guide from zero to deployed system (estimated time: 60 minutes).

### All Documentation Files

| File | Purpose | When to Use |
|------|---------|-------------|
| **`SINI_DEPLOYMENT_STEPS.md`** ⭐ | Complete deployment walkthrough | **START HERE** - Follow this step-by-step |
| `SINI_CONFIG.md` | Detailed SINI-specific configuration | Reference during setup |
| `sini_rooms_import.csv` | All 28 rooms ready to import | Use during room setup |
| `DEPLOYMENT_QUICKSTART.md` | Fast deployment checklist | Quick reference |
| `NORTHFLANK_DEPLOYMENT.md` | General Northflank guide | Technical reference |
| `.env.example` | Environment variables template | Configure before deployment |

### Technical Files

| File | Purpose |
|------|---------|
| `Dockerfile` | Container configuration (PHP 8.1 + Apache) |
| `docker-compose.yml` | Local testing setup |
| `.dockerignore` | Build optimization |

---

## 🚀 Quick Start (10 Steps)

1. **Push to GitHub** → Commit all files
2. **Create MySQL in Northflank** → Free tier addon
3. **Create Web Service** → Connect GitHub repo
4. **Set Environment Variables** → Database credentials
5. **Deploy** → Wait for build (3-5 min)
6. **Install QloApps** → Follow wizard
7. **Configure Hotel** → SINI Campus details
8. **Add Room Types** → Double & Triple
9. **Add 28 Rooms** → Use CSV or manual entry
10. **Set Private Rooms** → Block staff rooms

**Total Time**: ~60 minutes
**Cost**: FREE (using Northflank free tier)

---

## 🏢 Room Layout

### Monk's House Block (10 rooms)
**All Double Rooms**

- **Ground Floor**: 301, 302, 303, 304, 305
- **First Floor**: 306, 307, 308, 309, 310

### Staff's Block (18 rooms)

- **Ground Floor**: 101-108
  - Double: 101, 102, 103, 105, 106, 107, 108
  - Triple: **104** ⭐

- **First Floor**: 205-214
  - Double: 206, 207, 208, 209, 210, 211, 212, 213, 214
  - Triple: **205** ⭐

**Total**: 26 Double + 2 Triple = **28 Rooms**

---

## ⚙️ System Configuration

### Campus Details
```
Name: Sarnath International Nyingma Institute Campus
Address: INDIA SA 14/52 P-2, Baraipur Sarnath
City: Varanasi
State: Uttar Pradesh
Country: India
Postal Code: 221007
Timezone: Asia/Kolkata (IST)
Currency: INR (Indian Rupee)
```

### Booking Settings
```
Check-in Time: 2:00 PM (14:00)
Check-out Time: 2:00 PM (14:00)
Pricing: FREE (0.00 INR)
Payment: Disabled (no payment processing)
Peak Season: January
```

### Admin Access
```
Admin URL: https://your-northflank-url/admin
Email: (set during installation)
Password: (set during installation)
```

---

## 🎯 Key Features

✅ **Free Accommodation** - No payment processing, simplified booking
✅ **28 Rooms** - Organized by building and floor
✅ **Private Rooms** - Can block staff rooms from booking
✅ **Admin-Managed** - Campus manager controls all bookings
✅ **Peak Season Ready** - Easy scaling for January
✅ **Free Hosting** - Runs on Northflank free tier
✅ **Mobile Friendly** - Works on phones/tablets
✅ **Calendar View** - See availability at a glance

---

## 🔧 Technology Stack

- **Application**: QloApps (Open-source hotel booking system)
- **Backend**: PHP 8.1
- **Web Server**: Apache 2.4
- **Database**: MySQL 8.0
- **Container**: Docker
- **Hosting**: Northflank
- **SSL**: Automatic HTTPS

---

## 📊 Resource Requirements

### Normal Operation (Most of the Year)
- CPU: 0.2 vCPU
- Memory: 512 MB
- Storage: 1 GB
- Database: MySQL 8.0 (free tier)
- **Cost**: FREE

### Peak Season (January)
- CPU: 0.5 vCPU
- Memory: 1 GB
- Storage: 1 GB
- Database: MySQL 8.0 (free tier)
- **Cost**: Minimal (still likely free or very low cost)

**Note**: Scale up in January, scale down after. Total cost for the year should be minimal or free.

---

## 👥 User Roles & Workflow

### Campus Manager (Admin)
**Daily Tasks:**
1. Login to admin panel
2. Check new booking requests (if self-service enabled)
3. Or manually create bookings
4. View room availability calendar
5. Manage cancellations

**Making a Booking:**
1. `Orders` → `Add Order`
2. Enter guest details
3. Select dates
4. Choose available room
5. Save → Done!

### SINI Members (Guests)
**Option A - Self-Service** (if enabled):
1. Visit booking website
2. Select dates
3. Choose available room
4. Submit booking request
5. Wait for confirmation

**Option B - Contact Manager** (simpler):
1. Contact campus manager
2. Provide dates and preferences
3. Manager creates booking
4. Receive confirmation

**Recommendation**: Start with Option B (admin-managed) for simplicity.

---

## 🔒 Security Features

✅ **HTTPS Enabled** - Automatic SSL from Northflank
✅ **Admin Access Control** - Password-protected admin panel
✅ **Install Directory Removal** - Removed after setup
✅ **Environment Variables** - Sensitive data not in code
✅ **Regular Backups** - Database backup recommendations
✅ **Private Rooms** - Staff rooms blocked from public booking

---

## 📅 Maintenance Schedule

### Before January Peak Season
- [ ] Verify all room data is accurate
- [ ] Test booking workflow end-to-end
- [ ] Ensure staff rooms are properly blocked
- [ ] Backup database
- [ ] Scale up Northflank resources (0.5 vCPU, 1 GB RAM)
- [ ] Clear cache and optimize

### During January
- [ ] Monitor resource usage daily
- [ ] Check for booking conflicts
- [ ] Respond to any issues promptly

### After January
- [ ] Scale resources back down
- [ ] Archive old bookings
- [ ] Backup database
- [ ] Review and document lessons learned

### Monthly (Year-Round)
- [ ] Check for QloApps updates
- [ ] Verify backups are working
- [ ] Review room availability settings

---

## 🆘 Common Issues & Solutions

### "Cannot connect to database"
**Solution**: Check environment variables in Northflank service settings. Verify `DB_SERVER`, `DB_USER`, `DB_PASSWORD` match your MySQL addon credentials.

### "Room not showing as available"
**Solution**:
1. Check room status is "Active" in `Rooms` → `Room List`
2. Verify no date restrictions applied
3. Clear cache: `Admin` → `Advanced` → `Performance` → `Clear Cache`

### "Private/staff room appearing in bookings"
**Solution**:
1. Go to `Rooms` → `Room List`
2. Find the staff room
3. Set status to "Disabled" or "Inactive"
4. Or add indefinite date restriction

### "Site is slow during January"
**Solution**:
1. Increase resources in Northflank to 0.5 vCPU, 1 GB RAM
2. Clear cache regularly
3. Disable unused modules

### "Email notifications not working"
**Solution**:
1. Configure SMTP in `Advanced Parameters` → `Email`
2. Or use PHP mail function (simpler but less reliable)
3. Test email sending from admin panel

---

## 📞 Support & Resources

### QloApps Resources
- **Documentation**: https://docs.qloapps.com
- **Forum**: https://forums.qloapps.com
- **Demo**: https://demo.qloapps.com
  - Username: `demo@demo.com`
  - Password: `demodemo`
- **GitHub**: https://github.com/iloha-222/QloApps

### Northflank Resources
- **Documentation**: https://northflank.com/docs
- **Support**: https://northflank.com/support

### This Project
- **Deployment Guide**: `SINI_DEPLOYMENT_STEPS.md`
- **Configuration**: `SINI_CONFIG.md`
- **Room Data**: `sini_rooms_import.csv`

---

## 🔄 Backup & Recovery

### Database Backups

**Automated** (if supported by Northflank):
- Check MySQL addon settings
- Enable automatic backups if available

**Manual Backup**:
```bash
# From Northflank shell or local connection
mysqldump -h <db-host> -u <user> -p<password> qloapps > backup_$(date +%Y%m%d).sql
```

**Backup Schedule**:
- Daily during January
- Weekly during off-peak months
- Before any major changes or updates

### File Backups

Important files to backup:
- Hotel images
- Room images
- Configuration files
- Uploaded documents

Export from admin panel regularly.

### Restore Process

1. Stop the service in Northflank
2. Import database backup
3. Restore uploaded files
4. Restart service
5. Verify all data is present

---

## 📈 Future Enhancements (Optional)

- **Email Notifications**: Automated booking confirmations
- **Self-Service Booking**: Let members book directly
- **Multi-Language**: Add Hindi support
- **Mobile App**: Native app for easier access
- **Reporting**: Usage statistics and analytics
- **Calendar Integration**: Sync with Google Calendar
- **WhatsApp Integration**: Booking confirmations via WhatsApp

---

## ✅ Deployment Checklist

Use this checklist when deploying:

### Pre-Deployment
- [ ] All code committed to GitHub
- [ ] `.env.example` reviewed and understood
- [ ] SINI campus details confirmed
- [ ] Room list verified (28 rooms)
- [ ] Northflank account created
- [ ] Project created in Northflank

### Deployment
- [ ] MySQL addon created
- [ ] Database credentials saved
- [ ] Web service created
- [ ] Environment variables configured
- [ ] Service deployed successfully
- [ ] Build completed without errors

### Installation
- [ ] QloApps installation wizard completed
- [ ] Database connection successful
- [ ] Admin account created
- [ ] Admin credentials saved securely

### Configuration
- [ ] Hotel details added (SINI Campus)
- [ ] Room types created (Double, Triple)
- [ ] All 28 rooms added
- [ ] Booking settings configured (2 PM check-in/out)
- [ ] Payment modules disabled
- [ ] Staff rooms marked as private
- [ ] Test booking created and verified

### Post-Deployment
- [ ] `/install` directory removed
- [ ] SSL/HTTPS verified working
- [ ] Maintenance mode disabled
- [ ] Database backup created
- [ ] Admin panel accessible
- [ ] Booking workflow tested

### Going Live
- [ ] Campus manager trained
- [ ] Documentation shared
- [ ] Backup strategy in place
- [ ] Support contacts documented
- [ ] System ready for use! 🎉

---

## 📝 Version History

- **v1.0** (October 2024) - Initial deployment setup
  - 28 rooms configured
  - SINI-specific customization
  - Northflank deployment ready
  - Admin-managed booking system

---

## 📧 Contact

For questions about this deployment:
- Review documentation in this repository
- Check QloApps documentation: https://docs.qloapps.com
- Visit QloApps forum: https://forums.qloapps.com

---

## 🙏 Acknowledgments

- **QloApps** by Webkul - Open-source hotel booking system
- **Northflank** - Cloud hosting platform
- **SINI Campus** - Sarnath International Nyingma Institute

---

**Ready to deploy?** → Open `SINI_DEPLOYMENT_STEPS.md` and follow the step-by-step guide!

Good luck with your SINI Campus accommodation system! 🏨✨
