# SINI Campus Configuration Guide

## Sarnath International Nyingma Institute Campus

### Campus Information

**Full Name**: Sarnath International Nyingma Institute Campus
**Address**: INDIA SA 14/52 P-2, Baraipur Sarnath
**City**: Varanasi
**State**: Uttar Pradesh
**Country**: India
**Postal Code**: 221007
**Timezone**: Asia/Kolkata (IST - Indian Standard Time)
**Currency**: INR (Indian Rupee) - *Note: No pricing needed, internal use only*

### Room Inventory

**Total Rooms**: 28

#### Monk's House Block (10 rooms)
- **Ground Floor** (Rooms 301-305)
  - Room 301: Double
  - Room 302: Double
  - Room 303: Double
  - Room 304: Double
  - Room 305: Double

- **First Floor** (Rooms 306-310)
  - Room 306: Double
  - Room 307: Double
  - Room 308: Double
  - Room 309: Double
  - Room 310: Double

#### Staff's Block (18 rooms)
- **Ground Floor** (Rooms 101-108)
  - Room 101: Double
  - Room 102: Double
  - Room 103: Double
  - Room 104: Triple
  - Room 105: Double
  - Room 106: Double
  - Room 107: Double
  - Room 108: Double

- **First Floor** (Rooms 205-214)
  - Room 205: Triple
  - Room 206: Double
  - Room 207: Double
  - Room 208: Double
  - Room 209: Double
  - Room 210: Double
  - Room 211: Double
  - Room 212: Double
  - Room 213: Double
  - Room 214: Double

### Room Types Summary

- **Double Rooms**: 26 rooms
- **Triple Rooms**: 2 rooms (104, 205)

### Booking Settings

**Check-in Time**: 2:00 PM (14:00)
**Check-out Time**: 2:00 PM (14:00)
**Peak Season**: January
**Pricing**: FREE (internal use only, no payment processing needed)
**Booking Type**: Internal organization members only

### Special Requirements

#### Private Rooms (Staff-Only)
- Some rooms need to be marked as "private" and unavailable for booking
- These are reserved for permanent staff
- Should not appear in public booking calendar
- Can be managed through admin panel

**How to set up private rooms in QloApps:**
1. Go to **Admin Panel** → **Rooms** → **Room List**
2. Select the room you want to make private
3. Set **Status** to "Disabled" or "Private"
4. Or adjust **Availability** to block indefinitely
5. Add internal note: "Staff room - not for booking"

### Deployment Mode: Simplified Booking

**Recommended Setup**: **Admin-managed bookings**

Since you mentioned "whatever is simplest," I recommend:

1. **Admin-Managed System** (Simpler):
   - Campus manager handles all bookings through admin panel
   - No public-facing booking form needed
   - Guests contact campus manager directly
   - Manager enters bookings manually
   - **Pros**: More control, simpler setup, no user registration needed
   - **Cons**: Requires manual entry

2. **Self-Service Booking** (Alternative):
   - Members can book directly on website
   - Requires member login/registration
   - Automated confirmation emails
   - **Pros**: Less manual work, 24/7 availability
   - **Cons**: More complex setup, requires email configuration

**My Recommendation**: Start with **Admin-Managed** for simplicity. You can always enable self-service later.

### QloApps Installation Settings

Use these values during the installation wizard:

**Step 1: Language**
- Primary Language: English
- Additional Languages: Hindi (optional)

**Step 2: Database** (from Northflank env vars)
- Database server: `<from DB_SERVER>`
- Database name: `qloapps`
- Database user: `<from Northflank>`
- Database password: `<from Northflank>`
- Database prefix: `qlo_`

**Step 3: Hotel Information**
- Hotel Name: `Sarnath International Nyingma Institute Campus`
- Main Activity: `Hotel` (or `Guest House`)
- Country: `India`
- First Name: Your first name
- Last Name: Your last name
- Email: Your email address
- Password: Create a strong admin password
- Re-type password: Confirm password

**Step 4: Configuration**
- Shop timezone: `Asia/Kolkata`
- Enable SSL: Yes (Northflank provides HTTPS)

### Post-Installation Configuration

#### 1. Basic Settings

**General Settings** (Settings → General):
- Enable SSL: Yes
- Shop name: SINI Campus Accommodation
- Shop email: Your campus email
- Enable multishop: No
- Maintenance mode: On (until fully configured)

#### 2. Localization Settings

**Localization** (Localization → Localization):
- Default language: English
- Default currency: INR (Indian Rupee)
- Timezone: Asia/Kolkata
- Country: India

#### 3. Hotel Setup

**Add Hotel** (Hotels → Add Hotel):
```
Hotel Name: SINI Campus - Sarnath
Address: INDIA SA 14/52 P-2, Baraipur Sarnath
City: Varanasi
State: Uttar Pradesh
Country: India
Postal Code: 221007
Email: your-email@sini.org
Phone: Your phone number
Description: Accommodation for Sarnath International Nyingma Institute Campus members
```

#### 4. Room Types Setup

**Create Room Types** (Rooms → Room Types → Add New):

**Room Type 1: Double Room**
```
Name: Double Room
Short Code: DBL
Base Price: 0 (FREE)
Occupancy: 2 adults
Description: Standard double occupancy room for SINI members
Enable Booking: Yes
Status: Active
```

**Room Type 2: Triple Room**
```
Name: Triple Room
Short Code: TRP
Base Price: 0 (FREE)
Occupancy: 3 adults
Description: Triple occupancy room for SINI members
Enable Booking: Yes
Status: Active
```

#### 5. Add Rooms

Use the CSV import file (`sini_rooms_import.csv`) to bulk import all 28 rooms, or add manually:

**Monk's House Block - Ground Floor:**
- Rooms: 301, 302, 303, 304, 305
- Type: Double Room
- Floor: Ground Floor
- Building: Monk's House Block

**Monk's House Block - First Floor:**
- Rooms: 306, 307, 308, 309, 310
- Type: Double Room
- Floor: First Floor
- Building: Monk's House Block

**Staff's Block - Ground Floor:**
- Rooms: 101, 102, 103, 105, 106, 107, 108
- Type: Double Room
- Floor: Ground Floor
- Building: Staff's Block

- Room: 104
- Type: Triple Room
- Floor: Ground Floor
- Building: Staff's Block

**Staff's Block - First Floor:**
- Rooms: 206, 207, 208, 209, 210, 211, 212, 213, 214
- Type: Double Room
- Floor: First Floor
- Building: Staff's Block

- Room: 205
- Type: Triple Room
- Floor: First Floor
- Building: Staff's Block

#### 6. Booking Settings

**Order Settings** (Settings → Orders):
- Enable guest checkout: No (members only)
- Free order confirmation: Enabled
- Order process type: Standard (not one-page checkout)

**Booking Restrictions** (Settings → Booking):
- Minimum booking days: 1
- Maximum booking days: 30 (adjust as needed)
- Preparation time before arrival: 0 days
- Check-in time: 14:00
- Check-out time: 14:00

#### 7. Disable Payment Modules

Since accommodation is free:

**Modules** (Modules → Modules & Services):
- Disable all payment modules (PayPal, Bank Transfer, etc.)
- Keep only essential modules active
- This simplifies the booking process

#### 8. Email Settings (Optional)

If you want email notifications:

**Email** (Advanced Parameters → Email):
- Configure SMTP settings for your email
- Or use default PHP mail function
- Set up booking confirmation templates

#### 9. Privacy & Access

**Employee Management** (Advanced Parameters → Team):
- Create additional admin accounts if needed
- Set permissions (View Only, Edit, Full Access)
- For campus manager: Full Access

### Marking Rooms as Private (Staff-Only)

**Option 1: Disable Individual Rooms**
1. Go to: **Rooms → Room List**
2. Find the staff room
3. Click **Edit**
4. Set **Status** → "Disabled" or "Inactive"
5. Save

**Option 2: Block Dates Indefinitely**
1. Go to: **Rooms → Room Restrictions**
2. Select the room
3. Add date restriction from today → 10 years ahead
4. Reason: "Staff accommodation"

**Option 3: Create Separate "Staff Only" Room Type**
1. Create room type: "Staff Accommodation"
2. Set visibility to "Admin only"
3. Move staff rooms to this category
4. They won't appear in public booking

### January Peak Season Preparation

**Before January:**
- [ ] Verify all room data is accurate
- [ ] Test booking process
- [ ] Ensure staff rooms are properly blocked
- [ ] Backup database
- [ ] Increase Northflank resources if needed:
  - CPU: 0.5 vCPU (from 0.2)
  - Memory: 1 GB (from 512 MB)

**After January:**
- [ ] Scale resources back down to save costs
- [ ] Archive old bookings
- [ ] Clear cache

### Simplified Workflow for Campus Manager

**Daily Tasks:**
1. Check new booking requests (if self-service enabled)
2. Or manually enter bookings via admin panel

**Making a Booking (Admin):**
1. Login to admin: `https://your-url/admin`
2. Go to: **Orders → Orders**
3. Click **Add New Order**
4. Select dates, room, guest info
5. Save → Booking confirmed

**Checking Availability:**
1. Go to: **Rooms → Room Status**
2. View calendar with all rooms
3. See available/booked status at a glance

**Canceling a Booking:**
1. Go to: **Orders → Orders**
2. Find the booking
3. Change status to "Canceled"
4. Room automatically becomes available

### Maintenance Tasks

**Weekly:**
- Check for booking conflicts
- Verify email notifications working

**Monthly:**
- Review occupancy statistics
- Update room information if needed

**Yearly:**
- Backup all data before January peak
- Review and archive old bookings
- Update QloApps to latest version

### Support & Troubleshooting

**Common Issues:**

1. **Room not showing as available**
   - Check room status is "Active"
   - Verify no date restrictions applied
   - Clear cache: Admin → Performance → Clear Cache

2. **Private room appearing in bookings**
   - Disable the room in Room List
   - Or add indefinite date restriction

3. **Email notifications not working**
   - Check SMTP settings
   - Test email in Advanced Parameters → Email

4. **Slow during January peak**
   - Increase Northflank resources temporarily
   - Clear cache regularly

### Quick Reference

**Admin Login**: `https://your-northflank-url/admin`
**Total Rooms**: 28 (26 Double, 2 Triple)
**Peak Month**: January
**Check-in/out**: 2:00 PM
**Pricing**: FREE (0 INR)
**Currency**: INR
**Timezone**: Asia/Kolkata

---

**Next Steps:**
1. Deploy to Northflank (see `DEPLOYMENT_QUICKSTART.md`)
2. Run QloApps installation (use values above)
3. Import rooms (use `sini_rooms_import.csv`)
4. Mark staff rooms as private
5. Test booking workflow
6. Go live!
