# XAMPP Local Hosting Guide - Asset Management System

## 🎯 Complete Setup with XAMPP

This guide will help you run the Asset Management System completely on XAMPP on your local computer.

---

## 📋 Prerequisites

1. **XAMPP** - Download from https://www.apachefriends.org/
2. **Download This Project** - From GitHub as ZIP

---

## 🚀 Step 1: Install XAMPP

1. Go to: https://www.apachefriends.org/
2. Download XAMPP (pick your OS: Windows, Mac, or Linux)
3. Install it (default location is fine)
   - Windows: `C:\xampp`
   - Mac: `/Applications/XAMPP`
   - Linux: `/opt/lampp`

---

## ✅ Step 2: Start XAMPP Services

### **Windows:**
1. Open XAMPP Control Panel
2. Start **Apache** ✓
3. Start **MySQL** ✓

### **Mac/Linux:**
```bash
# Start XAMPP
sudo /Applications/XAMPP/xamppfiles/xampp start

# Or on Linux:
sudo /opt/lampp/lampp start
```

---

## 📥 Step 3: Download Project Files

1. Go to: https://github.com/dsemugabi/asset-management-system
2. Click green **Code** button
3. Click **Download ZIP**
4. Extract the ZIP file

---

## 📂 Step 4: Copy Files to XAMPP

### **Windows:**
1. Go to: `C:\xampp\htdocs`
2. Create a new folder: `asset-management-system`
3. Extract your downloaded project into this folder

**Result:** `C:\xampp\htdocs\asset-management-system\`

### **Mac:**
1. Go to: `/Applications/XAMPP/htdocs`
2. Create folder: `asset-management-system`
3. Extract project into it

### **Linux:**
1. Go to: `/opt/lampp/htdocs`
2. Create folder: `asset-management-system`
3. Extract project into it

---

## 📊 Step 5: Setup Database

### **Option A: Using phpMyAdmin (Easiest)**

1. Open browser and go to: http://localhost/phpmyadmin
2. Click **Databases** tab
3. Create new database:
   - Name: `asset_management_system`
   - Collation: `utf8_general_ci`
   - Click **Create**

4. Select the new database
5. Click **Import** tab
6. Click **Choose File**
7. Navigate to: `asset-management-system/database/schema.sql`
8. Click **Import**

**Done!** Database is ready ✓

### **Option B: Using Command Line**

```bash
# Open MySQL from XAMPP
mysql -u root -p

# Leave password empty (just press Enter)
```

Then paste:
```sql
CREATE DATABASE asset_management_system;
USE asset_management_system;
SOURCE C:/xampp/htdocs/asset-management-system/database/schema.sql;
```

---

## 🔧 Step 6: Configure Backend

1. Navigate to: `asset-management-system/backend/`
2. Find `.env.example` file
3. Copy it and rename to `.env`
4. Open `.env` in a text editor and set:

```
PORT=3001
NODE_ENV=development

DB_HOST=127.0.0.1
DB_USER=root
DB_PASSWORD=
DB_NAME=asset_management_system
DB_PORT=3306

JWT_SECRET=your_super_secret_jwt_key_xampp_local
JWT_EXPIRE=7d

FRONTEND_URL=http://localhost/asset-management-system/frontend
```

---

## 📦 Step 7: Install Backend Dependencies

1. Open **Command Prompt** or **Terminal**
2. Navigate to backend:
   ```bash
   cd C:\xampp\htdocs\asset-management-system\backend
   # Or on Mac/Linux:
   cd /Applications/XAMPP/htdocs/asset-management-system/backend
   ```

3. Install Node modules:
   ```bash
   npm install
   ```

4. Start backend server:
   ```bash
   npm start
   ```

   You should see:
   ```
   Asset Management System API running on port 3001
   ```

✅ **Keep this terminal open!**

---

## 🎨 Step 8: Install Frontend Dependencies

1. Open a **new terminal**
2. Navigate to frontend:
   ```bash
   cd C:\xampp\htdocs\asset-management-system\frontend
   ```

3. Install dependencies:
   ```bash
   npm install
   ```

4. Build for production:
   ```bash
   npm run build
   ```

**This creates a `/build` folder with static files ready for XAMPP**

---

## 🌐 Step 9: Access Your App

### **In Browser:**

Go to: **http://localhost/asset-management-system/frontend/build**

Or if you set up Apache properly: **http://localhost:80**

---

## 🔐 Step 10: Login

Use these credentials:

**Admin:**
- Email: `admin@example.com`
- Password: `password`

**User:**
- Email: `user@example.com`
- Password: `password`

---

## 📋 Complete Folder Structure

```
C:\xampp\htdocs\asset-management-system\
├── backend/
│   ├── controllers/
│   ├── routes/
│   ├── middleware/
│   ├── config/
│   ├── node_modules/         (after npm install)
│   ├── .env                  (your config)
│   ├── server.js
│   └── package.json
├── frontend/
│   ├── src/
│   ├── public/
│   ├── build/                (after npm run build)
│   └── package.json
├── database/
│   └── schema.sql
├── README.md
├── SETUP_GUIDE.md
└── DEPLOYMENT.md
```

---

## ✅ Verification Checklist

- [ ] XAMPP installed
- [ ] Apache started
- [ ] MySQL started
- [ ] Project in htdocs folder
- [ ] Database created
- [ ] .env configured
- [ ] Backend npm install done
- [ ] Backend running (npm start)
- [ ] Frontend npm install done
- [ ] Frontend built (npm run build)
- [ ] Can access http://localhost/asset-management-system/frontend/build
- [ ] Can login with credentials

---

## 🎯 Running the System

### **Every Time You Want to Use It:**

**Terminal 1 - Start Backend:**
```bash
cd C:\xampp\htdocs\asset-management-system\backend
npm start
```

**Terminal 2 - Start XAMPP:**
- Open XAMPP Control Panel
- Start Apache ✓
- Start MySQL ✓

**In Browser:**
- Go to: http://localhost/asset-management-system/frontend/build
- Or: http://localhost:3001 (for API testing)

---

## 🆘 Troubleshooting

### **MySQL not starting?**
- Make sure port 3306 is not in use
- Close other MySQL instances
- Check XAMPP logs

### **Port 3001 already in use?**
Edit `backend/.env`:
```
PORT=3002
```

### **Can't find phpmyadmin?**
Go to: http://localhost/phpmyadmin/

### **npm install fails?**
```bash
npm install --legacy-peer-deps
```

### **Build not creating?**
```bash
cd frontend
rm -rf node_modules
npm install
npm run build
```

### **Can't connect to database?**
Check `.env`:
- `DB_HOST=127.0.0.1` or `localhost`
- `DB_USER=root`
- `DB_PASSWORD=` (empty for XAMPP default)

---

## 📊 Database Management

### **Access phpMyAdmin:**
1. Open: http://localhost/phpmyadmin
2. Username: `root`
3. Password: (leave empty)
4. Click **Go**

### **View Your Data:**
1. Click database: `asset_management_system`
2. See all tables:
   - users
   - assets
   - projects
   - departments
   - vendors
   - asset_assignments
   - disposal_requests
   - And more...

### **Backup Database:**
1. In phpMyAdmin, select database
2. Click **Export**
3. Click **Go**
4. Save SQL file

### **Restore Database:**
1. In phpMyAdmin, select database
2. Click **Import**
3. Choose your SQL file
4. Click **Go**

---

## 🔄 Development Workflow

### **Make Changes to Frontend:**
1. Edit files in `frontend/src/`
2. Run: `npm run build` (in frontend folder)
3. Refresh browser

### **Make Changes to Backend:**
1. Edit files in `backend/`
2. Stop backend (Ctrl+C)
3. Run: `npm start`
4. Refresh browser

### **Add New Assets:**
1. Login as admin
2. Go to Assets
3. Click Add Asset
4. Fill in details
5. Save

---

## 🌐 Access Your App from Other Devices

### **Find Your Computer's IP Address:**

**Windows:**
```bash
ipconfig
# Look for IPv4 Address like: 192.168.x.x
```

**Mac/Linux:**
```bash
ifconfig
# Look for inet address
```

### **Access from Another Computer:**
```
http://192.168.x.x/asset-management-system/frontend/build
```

---

## 💾 Backing Up Everything

### **Backup All Files:**
1. Copy entire folder: `asset-management-system`
2. Save to external drive or USB

### **Backup Database:**
In phpMyAdmin:
1. Select database
2. Export as SQL
3. Save the file

### **Restore Everything:**
1. Copy folder back to htdocs
2. Create database
3. Import SQL backup
4. Start XAMPP and backend

---

## 🎓 Quick Tips

1. **Keep Backend Running** - Terminal must stay open
2. **MySQL Always On** - Via XAMPP Control Panel
3. **Build After Changes** - `npm run build` in frontend
4. **Clear Browser Cache** - If changes don't show
5. **Check Logs** - Terminal shows errors

---

## 📱 Mobile Testing

To test on phone/tablet:

1. Connect phone to same WiFi
2. Find computer IP: `ipconfig`
3. On phone browser: `http://192.168.x.x/asset-management-system/frontend/build`
4. Test responsiveness

---

## 🚀 Next Steps

1. ✅ Get XAMPP working
2. ✅ Setup database
3. ✅ Run backend
4. ✅ Build frontend
5. ✅ Login and test
6. ✅ Create test data
7. ✅ Explore all features

---

## 📞 Need Help?

If something doesn't work:
1. Check terminal for error messages
2. Check XAMPP logs
3. Go to phpMyAdmin and verify database
4. Make sure .env is correct
5. Try restarting XAMPP

---

**Enjoy your local Asset Management System!** 🎉

For more info, see:
- [README.md](./README.md) - Project overview
- [SETUP_GUIDE.md](./SETUP_GUIDE.md) - Detailed setup
- [DEPLOYMENT.md](./DEPLOYMENT.md) - Deploy online
