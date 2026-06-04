# Asset Management System - Setup & Deployment Guide

## Prerequisites

- Node.js v14+ and npm
- MySQL 5.7+
- Git
- Postman (optional, for API testing)

## Complete Installation Guide

### 1. Clone the Repository

```bash
git clone https://github.com/dsemugabi/asset-management-system.git
cd asset-management-system
```

### 2. Database Setup

```bash
# Create database and tables
mysql -u root -p < database/schema.sql

# Or manually in MySQL client
CREATE DATABASE asset_management_system;
USE asset_management_system;
# Then paste contents of database/schema.sql
```

### 3. Backend Setup

```bash
cd backend

# Install dependencies
npm install

# Create environment file
cp .env.example .env

# Edit .env with your settings
# DB_HOST=localhost
# DB_USER=root
# DB_PASSWORD=your_password
# DB_NAME=asset_management_system
# JWT_SECRET=your_secret_key

# Start server
npm start
# Server runs on http://localhost:5000
```

### 4. Frontend Setup

```bash
cd ../frontend

# Install dependencies
npm install

# Start development server
npm start
# App opens on http://localhost:3000
```

## 🔑 Default Users (From Database Seed)

After running the SQL script, create users through the API or directly:

**Admin User:**
```
Email: admin@example.com
Password: password
Role: admin
Department: IT
```

**Regular User:**
```
Email: user@example.com
Password: password
Role: user
Department: Finance
```

**Finance User:**
```
Email: finance@example.com
Password: password
Role: finance
Department: Finance
```

## 🚀 API Testing

Use Postman to test endpoints:

1. **Register User**
   - POST: `http://localhost:5000/api/auth/register`
   - Body:
   ```json
   {
     "first_name": "John",
     "last_name": "Doe",
     "email": "john@example.com",
     "password": "password123",
     "department_id": 1
   }
   ```

2. **Login**
   - POST: `http://localhost:5000/api/auth/login`
   - Body:
   ```json
   {
     "email": "admin@example.com",
     "password": "password"
   }
   ```
   - Response will include JWT token

3. **Use Token in Headers**
   - Header: `Authorization: Bearer <token>`

## 📁 Project Structure

```
asset-management-system/
├── backend/
│   ├── config/
│   │   └── database.js
│   ├── controllers/
│   │   ├── authController.js
│   │   ├── userController.js
│   │   ├── assetController.js
│   │   ├── assignmentController.js
│   │   ├── disposalController.js
│   │   ├── departmentController.js
│   │   ├── projectController.js
│   │   └── vendorController.js
│   ├── middleware/
│   │   └── auth.js
│   ├── routes/
│   │   └── [all routes]
│   ├── .env.example
│   ├── server.js
│   └── package.json
├── frontend/
│   ├── src/
│   │   ├── pages/
│   │   │   ├── Admin/
│   │   │   ├── User/
│   │   │   └── LoginPage.js
│   │   ├── components/
│   │   │   └── DashboardLayout.js
│   │   ├── redux/
│   │   │   └── store.js
│   │   ├── App.js
│   │   └── index.js
│   ├── public/
│   │   └── index.html
│   └── package.json
├── database/
│   └── schema.sql
└── README.md
```

## 🔧 Troubleshooting

### MySQL Connection Error
- Verify MySQL is running
- Check credentials in .env
- Ensure database exists

### Port Already in Use
```bash
# Change port in .env (backend)
PORT=5001

# Change port in package.json (frontend)
# Or use: PORT=3001 npm start
```

### JWT Token Expired
- Tokens expire after 7 days by default
- User needs to login again
- Can change expiry in .env: `JWT_EXPIRE=30d`

### CORS Issues
- Frontend and backend must be running
- Check CORS middleware in server.js
- Ensure Authorization header includes "Bearer " prefix

## 📊 Creating Test Data

### 1. Add Department
```bash
POST http://localhost:5000/api/departments
Headers: Authorization: Bearer <token>
Body: {
  "name": "HR",
  "description": "Human Resources"
}
```

### 2. Add User
```bash
POST http://localhost:5000/api/users
Headers: Authorization: Bearer <token>
Body: {
  "first_name": "Jane",
  "last_name": "Smith",
  "email": "jane@example.com",
  "password": "password123",
  "department_id": 1,
  "role": "user"
}
```

### 3. Add Project
```bash
POST http://localhost:5000/api/projects
Headers: Authorization: Bearer <token>
Body: {
  "name": "Disc Project",
  "donor_name": "Disc Foundation",
  "status": "active"
}
```

### 4. Add Vendor
```bash
POST http://localhost:5000/api/vendors
Headers: Authorization: Bearer <token>
Body: {
  "name": "Tech Solutions Ltd",
  "email": "vendor@tech.com",
  "phone": "+256-700-000000",
  "city": "Kampala"
}
```

### 5. Add Asset
```bash
POST http://localhost:5000/api/assets
Headers: Authorization: Bearer <token>
Body: {
  "asset_name": "Dell Laptop",
  "asset_type_id": 1,
  "asset_condition_id": 2,
  "project_id": 1,
  "engraving_number": "DISC-001",
  "reference_number": "REF-001",
  "vendor_id": 1,
  "purchase_price": "1200.00",
  "purchase_date": "2024-01-15",
  "serial_number": "SN123456"
}
```

## 🌐 Production Deployment

### Backend (Node.js)
1. Set environment variables securely
2. Use process manager (PM2):
   ```bash
   npm install -g pm2
   pm2 start server.js
   pm2 save
   ```
3. Use reverse proxy (Nginx/Apache)
4. Enable HTTPS/SSL

### Frontend (React)
1. Build for production:
   ```bash
   npm run build
   ```
2. Deploy build folder to web server
3. Configure routing for SPA

### Database
1. Set strong root password
2. Create separate user account
3. Enable regular backups
4. Use database replication

## 📈 Monitoring & Maintenance

- Check error logs regularly
- Monitor database performance
- Review user access patterns
- Regular data backups
- Update dependencies regularly

## 📚 Additional Resources

- [Express.js Documentation](https://expressjs.com)
- [React Documentation](https://react.dev)
- [MySQL Documentation](https://dev.mysql.com)
- [JWT Documentation](https://jwt.io)

## ✅ Checklist for Going Live

- [ ] Database backed up
- [ ] SSL certificates configured
- [ ] Environment variables set
- [ ] Email notifications configured
- [ ] User roles tested
- [ ] Disposal workflow tested
- [ ] Print functionality tested
- [ ] API endpoints tested
- [ ] Error handling verified
- [ ] Security audit completed
