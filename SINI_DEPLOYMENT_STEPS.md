# SINI Campus - Deployment Steps

## Quick Deployment Guide for Sarnath International Nyingma Institute Campus

### Overview
You're setting up a free accommodation booking system for 28 rooms on SINI Campus in Varanasi, India.

- **28 rooms total**: 26 Double, 2 Triple
- **2 buildings**: Monk's House Block (10 rooms), Staff's Block (18 rooms)
- **FREE accommodation**: No payment processing needed
- **Peak season**: January
- **Admin-managed**: Campus manager handles bookings

---

## Step 1: Push Code to GitHub (5 minutes)

```bash
cd "/Users/lauraneboulenger/my-clients-projects/sini-websites/Hotel Management System"

# Check what's new
git status

# Add all deployment files
git add .

# Commit
git commit -m "Add SINI Campus deployment configuration - 28 rooms ready"

# Push to your repository
git push origin main
```

**Files being pushed:**
- ✅ Dockerfile (PHP + Apache configuration)
- ✅ docker-compose.yml (local testing)
- ✅ .env.example (SINI-specific settings)
- ✅ SINI_CONFIG.md (complete SINI configuration guide)
- ✅ sini_rooms_import.csv (all 28 rooms ready to import)
- ✅ Deployment guides

---

## Step 2: Create Database in Northflank (3 minutes)

1. **Login to Northflank**: https://northflank.com
2. **Go to your project**: "SINI Hotel Management System"
3. **Click "Add Addon"**
4. **Select "MySQL"**
   - Version: MySQL 8.0
   - Plan: Free tier
   - Name: `sini-campus-db`
   - Database name: `qloapps`
5. **Click "Create Addon"**
6. **Save these details** (you'll need them):
   - Host: `_____________`
   - Port: `_____________`
   - Username: `_____________`
   - Password: `_____________`
   - Database: `qloapps`

---

## Step 3: Create Web Service in Northflank (7 minutes)

1. **In your project, click "Add Service"**
2. **Select "Combined Service"** (Build & Deploy)
3. **Configure:**

   **Repository:**
   - Connect GitHub: Select `iloha-222/QloApps`
   - Branch: `main`
   - Build method: Dockerfile
   - Dockerfile path: `Dockerfile`

   **Port:**
   - Container port: `80`
   - Protocol: HTTP
   - Public: ✅ Yes

   **Resources:**
   - CPU: 0.2 vCPU (enough for now, scale to 0.5 in January)
   - Memory: 512 MB (scale to 1 GB in January)
   - Storage: 1 GB

4. **Add Environment Variables:**

Click "Environment Variables" and add:

```
DB_SERVER=<your-mysql-host-from-step-2>
DB_NAME=qloapps
DB_USER=<your-mysql-username-from-step-2>
DB_PASSWORD=<your-mysql-password-from-step-2>
DB_PREFIX=qlo_

HOTEL_NAME=Sarnath International Nyingma Institute Campus
TIMEZONE=Asia/Kolkata
CURRENCY=INR
DEBUG_MODE=0
```

5. **Click "Create Service"**
6. **Wait for build** (3-5 minutes)
   - Check "Build Logs" tab
   - Wait for green checkmark
7. **Copy your public URL** (e.g., `https://sini-campus-xxxxx.northflank.app`)

---

## Step 4: Install QloApps (10 minutes)

1. **Open your Northflank URL** in browser
2. **You'll be redirected to `/install`**

### Installation Wizard Steps:

**Screen 1: Welcome**
- Click "Next"

**Screen 2: License Agreement**
- ✅ Accept license
- Click "Next"

**Screen 3: System Compatibility**
- Should show all green checkmarks ✅
- Click "Next"

**Screen 4: Shop Information**
```
Shop name: SINI Campus Accommodation
Main activity: Hotel (or Guest House)
Country: India
First name: Your first name
Last name: Your last name
Email: your-email@sini.org (or your actual email)
Password: [Create a STRONG password - save this!]
Re-type password: [Same password]
```
- Click "Next"

**Screen 5: System Configuration**
```
Database server address: <paste from Step 2 - DB host>
Database name: qloapps
Database login: <paste from Step 2 - username>
Database password: <paste from Step 2 - password>
Database prefix: qlo_
```
- Click "Test your database connection now!" (should succeed ✅)
- Click "Next"

**Screen 6: Shop Configuration**
```
Shop timezone: Asia/Kolkata
Enable SSL: Yes
```
- Click "Next"

**Screen 7: Installation**
- Wait for installation to complete (2-3 minutes)
- You'll see progress bars
- When done: "Installation complete! ✅"

**Screen 8: Complete**
- You'll be redirected to admin login
- **IMPORTANT**: Delete `/install` directory for security (see Step 7)

---

## Step 5: Login to Admin Panel (1 minute)

1. **Go to**: `https://your-northflank-url/admin`
2. **Login with**:
   - Email: The email you entered in Step 4
   - Password: The password you created in Step 4

---

## Step 6: Configure SINI Campus (20 minutes)

### A. Add Hotel Details

1. **Go to**: `Hotels` → `Add Hotel`
2. **Fill in**:
   ```
   Hotel Name: SINI Campus - Sarnath
   Email: your-campus-email@sini.org
   Phone: Your campus phone number
   Address: INDIA SA 14/52 P-2, Baraipur Sarnath
   City: Varanasi
   State: Uttar Pradesh
   Country: India
   Postal Code: 221007
   Description: Accommodation for Sarnath International Nyingma Institute Campus members
   ```
3. **Upload hotel image** (if you have one)
4. **Click "Save"**

### B. Create Room Types

**Room Type 1: Double Room**

1. **Go to**: `Rooms` → `Room Types` → `Add Room Type`
2. **Fill in**:
   ```
   Name: Double Room
   Short Code: DBL
   Adults: 2
   Children: 0
   Base Price: 0.00 (it's FREE!)
   Description: Standard double occupancy room for SINI members
   ```
3. **Upload room image** (optional)
4. **Status**: Active
5. **Click "Save"**

**Room Type 2: Triple Room**

1. **Click "Add Room Type"** again
2. **Fill in**:
   ```
   Name: Triple Room
   Short Code: TRP
   Adults: 3
   Children: 0
   Base Price: 0.00 (FREE)
   Description: Triple occupancy room for SINI members
   ```
3. **Upload room image** (optional)
4. **Status**: Active
5. **Click "Save"**

### C. Add Your 28 Rooms

**Option 1: Import via CSV** (Faster - if QloApps supports it):
1. Check if QloApps has CSV import feature
2. Use file: `sini_rooms_import.csv`
3. Map columns and import

**Option 2: Add Manually** (More control):

You need to add each room. Here's the template:

**For each room**, go to: `Rooms` → `Add Room`

**Monk's House Block - Ground Floor (5 rooms):**
```
Room 301: Double Room, Ground Floor, Monk's House Block
Room 302: Double Room, Ground Floor, Monk's House Block
Room 303: Double Room, Ground Floor, Monk's House Block
Room 304: Double Room, Ground Floor, Monk's House Block
Room 305: Double Room, Ground Floor, Monk's House Block
```

**Monk's House Block - First Floor (5 rooms):**
```
Room 306: Double Room, First Floor, Monk's House Block
Room 307: Double Room, First Floor, Monk's House Block
Room 308: Double Room, First Floor, Monk's House Block
Room 309: Double Room, First Floor, Monk's House Block
Room 310: Double Room, First Floor, Monk's House Block
```

**Staff's Block - Ground Floor (8 rooms):**
```
Room 101: Double Room, Ground Floor, Staff's Block
Room 102: Double Room, Ground Floor, Staff's Block
Room 103: Double Room, Ground Floor, Staff's Block
Room 104: TRIPLE Room, Ground Floor, Staff's Block ⭐
Room 105: Double Room, Ground Floor, Staff's Block
Room 106: Double Room, Ground Floor, Staff's Block
Room 107: Double Room, Ground Floor, Staff's Block
Room 108: Double Room, Ground Floor, Staff's Block
```

**Staff's Block - First Floor (10 rooms):**
```
Room 205: TRIPLE Room, First Floor, Staff's Block ⭐
Room 206: Double Room, First Floor, Staff's Block
Room 207: Double Room, First Floor, Staff's Block
Room 208: Double Room, First Floor, Staff's Block
Room 209: Double Room, First Floor, Staff's Block
Room 210: Double Room, First Floor, Staff's Block
Room 211: Double Room, First Floor, Staff's Block
Room 212: Double Room, First Floor, Staff's Block
Room 213: Double Room, First Floor, Staff's Block
Room 214: Double Room, First Floor, Staff's Block
```

**Note**: Rooms 104 and 205 are Triple rooms - select "Triple Room" type for these!

### D. Configure Booking Settings

1. **Go to**: `Settings` → `Booking Settings`
2. **Set**:
   ```
   Check-in time: 14:00 (2:00 PM)
   Check-out time: 14:00 (2:00 PM)
   Minimum booking period: 1 day
   Maximum booking period: 30 days (adjust as needed)
   ```
3. **Click "Save"**

### E. Disable Payment Modules (No Payment Needed)

1. **Go to**: `Modules` → `Modules & Services`
2. **Find payment modules**:
   - Bank Wire
   - PayPal
   - Any other payment modules
3. **Disable ALL payment modules**
4. This simplifies booking since it's FREE

### F. Set Up Private Rooms (Staff Only)

For rooms that staff occupy permanently and shouldn't be bookable:

**Method 1: Disable the Room**
1. Go to: `Rooms` → `Room List`
2. Find the staff room (e.g., Room 101)
3. Click "Edit"
4. Status → "Disabled" or "Inactive"
5. Add note: "Staff accommodation - permanent"
6. Save

**Method 2: Block Dates Indefinitely**
1. Go to: `Rooms` → `Date Restrictions`
2. Select the room
3. Add restriction: Today → 10 years in future
4. Reason: "Staff accommodation"
5. Save

**Do this for each staff room you need to block.**

---

## Step 7: Security & Final Steps (5 minutes)

### A. Delete Install Directory

**IMPORTANT for security!**

In Northflank, you have two options:

**Option 1: Via Northflank Shell** (if available):
1. Go to your service
2. Open "Shell" or "Console"
3. Run: `rm -rf /var/www/html/install`

**Option 2: Update Dockerfile** (recommended):
Add this line to Dockerfile before `CMD`:
```dockerfile
RUN rm -rf /var/www/html/install
```
Then rebuild the service.

### B. Verify Settings

1. **Check SSL**: Your site should use `https://`
2. **Test booking**: Create a test booking to verify flow
3. **Check email**: Ensure confirmation emails work (if configured)

### C. Disable Maintenance Mode

1. **Go to**: `Settings` → `Maintenance`
2. **Maintenance mode**: OFF
3. **Click "Save"**

### D. Backup Database

**Important**: Backup before going live!

In Northflank:
1. Check if MySQL addon has automatic backups
2. Or manually export database

---

## Step 8: Test Everything (10 minutes)

### Admin Panel Tests:
- ✅ Can login to admin
- ✅ Can see all 28 rooms in room list
- ✅ Room types (Double, Triple) configured
- ✅ Hotel information complete
- ✅ Booking settings correct (2 PM check-in/out)

### Booking Flow Test:
1. **Create a test booking**:
   - Go to: `Orders` → `Add Order`
   - Select dates (e.g., 3 days from now)
   - Select available room
   - Enter guest details
   - Save
2. **Verify**:
   - Room shows as booked in calendar
   - Booking appears in Orders list
3. **Cancel booking**:
   - Edit order → Change status to "Canceled"
   - Verify room is available again

### Private Room Test:
- ✅ Staff rooms don't appear in booking calendar
- ✅ Or show as "unavailable"

---

## Step 9: Scale for January Peak Season

**When January approaches:**

1. **In Northflank**, go to your service settings
2. **Increase resources**:
   - CPU: 0.5 vCPU (from 0.2)
   - Memory: 1 GB (from 512 MB)
3. **After January**, scale back down

---

## Step 10: Daily Usage

### Making a Booking (Campus Manager):

1. Login: `https://your-url/admin`
2. Go to: `Orders` → `Add Order`
3. Fill in:
   - Guest name, email, phone
   - Check-in date
   - Check-out date
   - Select available room
4. Click "Save"
5. ✅ Booking confirmed!

### Checking Availability:

1. Go to: `Rooms` → `Room Status` or `Calendar`
2. View all rooms and their availability
3. See which rooms are booked/available at a glance

### Canceling a Booking:

1. Go to: `Orders` → `Orders`
2. Find the booking
3. Click "Edit"
4. Change status to "Canceled"
5. Room automatically available

---

## Troubleshooting

### "Can't connect to database"
- Check environment variables in Northflank
- Verify MySQL addon is running
- Ensure DB_SERVER, DB_USER, DB_PASSWORD are correct

### "Room not appearing as available"
- Check room status is "Active"
- Clear cache: `Admin` → `Advanced` → `Performance` → `Clear Cache`

### "Site is slow"
- Increase memory to 1 GB in Northflank
- Clear cache
- Check resource usage

### "Email not sending"
- Configure SMTP in `Advanced Parameters` → `Email`
- Or use PHP mail (simpler, less reliable)

---

## Quick Reference

**Your Deployment Info:**
```
Project: SINI Hotel Management System
Campus: Sarnath International Nyingma Institute Campus
Location: Varanasi, Uttar Pradesh, India
Total Rooms: 28 (26 Double, 2 Triple)
Buildings: Monk's House Block (10), Staff's Block (18)
Peak Season: January
Pricing: FREE (0 INR)
Check-in/out: 2:00 PM
Timezone: Asia/Kolkata
```

**Admin Access:**
- URL: `https://your-northflank-url/admin`
- Email: (what you set in installation)
- Password: (what you set in installation)

**Support:**
- SINI Config Guide: `SINI_CONFIG.md`
- Full Deployment Guide: `NORTHFLANK_DEPLOYMENT.md`
- QloApps Docs: https://docs.qloapps.com
- QloApps Forum: https://forums.qloapps.com

---

## ✅ Done!

Your SINI Campus accommodation booking system is now live!

Campus manager can now:
- View all 28 rooms
- Make bookings for members
- Check availability
- Manage peak January season

**Remember**:
- Mark staff rooms as private/disabled
- Backup database before January
- Scale up resources in January
- Scale down after peak season

Good luck! 🙏
