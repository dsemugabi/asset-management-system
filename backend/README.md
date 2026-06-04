# Asset Management System - Backend

## Setup Instructions

1. **Install Dependencies**
   ```bash
   cd backend
   npm install
   ```

2. **Configure Environment Variables**
   ```bash
   cp .env.example .env
   # Edit .env with your database credentials
   ```

3. **Create Database**
   ```bash
   mysql -u root -p < ../database/schema.sql
   ```

4. **Run Server**
   ```bash
   npm start
   ```
   Or for development with hot reload:
   ```bash
   npm run dev
   ```

## API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login
- `GET /api/auth/current-user` - Get current user info

### Users (Admin Only)
- `GET /api/users` - Get all users
- `GET /api/users/:id` - Get user by ID
- `POST /api/users` - Create user
- `PUT /api/users/:id` - Update user
- `DELETE /api/users/:id` - Delete user
- `GET /api/users/department/:departmentId` - Get users by department

### Assets
- `GET /api/assets` - Get all assets
- `GET /api/assets/:id` - Get asset by ID
- `POST /api/assets` - Create asset
- `PUT /api/assets/:id` - Update asset
- `DELETE /api/assets/:id` - Delete asset
- `GET /api/assets/available` - Get available assets
- `GET /api/assets/project/:projectId` - Get assets by project

### Assignments
- `GET /api/assignments` - Get all assignments
- `GET /api/assignments/:id` - Get assignment by ID
- `POST /api/assignments` - Create assignment
- `GET /api/assignments/user/:userId` - Get user assignments
- `PUT /api/assignments/:assignmentId/return` - Return asset

### Disposal
- `GET /api/disposal` - Get all disposal requests
- `GET /api/disposal/:id` - Get disposal by ID
- `POST /api/disposal` - Request disposal
- `PUT /api/disposal/:id/approve` - Approve disposal (Finance/Admin)
- `PUT /api/disposal/:id/reject` - Reject disposal (Finance/Admin)

### Departments
- `GET /api/departments` - Get all departments
- `POST /api/departments` - Create department
- `PUT /api/departments/:id` - Update department
- `DELETE /api/departments/:id` - Delete department

### Projects
- `GET /api/projects` - Get all projects
- `GET /api/projects/:id` - Get project by ID
- `POST /api/projects` - Create project
- `PUT /api/projects/:id` - Update project
- `DELETE /api/projects/:id` - Delete project

### Vendors
- `GET /api/vendors` - Get all vendors
- `GET /api/vendors/:id` - Get vendor by ID
- `POST /api/vendors` - Create vendor
- `PUT /api/vendors/:id` - Update vendor
- `DELETE /api/vendors/:id` - Delete vendor
