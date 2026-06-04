# Asset Management System

A comprehensive web-based asset management system for managing organizational assets across multiple projects with admin and user panels.

## Features

- **User Management**: Add, edit, and manage users by department
- **Department Management**: Organize users and assets by departments
- **Project Management**: Track assets for specific projects (Disc, Maverick, etc.)
- **Asset Management**: 
  - Create and track assets with engraving/reference numbers
  - Categorize by asset types and conditions
  - Track vendor information, prices, and purchase dates
- **Asset Assignment**: Assign assets to users
- **Asset Forms**: Print asset assignment forms for users
- **Disposal Management**: Mark assets for disposal with finance approval workflow
- **Vendor Management**: Track vendors and their supplied assets
- **Reporting**: Generate asset reports and forms

## Tech Stack

### Backend
- Node.js with Express.js
- MySQL Database
- JWT Authentication
- RESTful API

### Frontend
- React.js
- Material-UI (MUI)
- Redux for state management
- Axios for API calls

## Project Structure

```
asset-management-system/
├── backend/
│   ├── config/
│   ├── controllers/
│   ├── middleware/
│   ├── routes/
│   ├── models/
│   ├── utils/
│   ├── .env.example
│   ├── server.js
│   └── package.json
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   ├── redux/
│   │   ├── utils/
│   │   ├── App.js
│   │   └── index.js
│   ├── public/
│   └── package.json
├── database/
│   └── schema.sql
└── README.md
```

## Installation

### Prerequisites
- Node.js (v14 or higher)
- MySQL (v5.7 or higher)
- npm or yarn

### Backend Setup

1. Navigate to the backend directory:
   ```bash
   cd backend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Create a `.env` file (copy from `.env.example`):
   ```bash
   cp .env.example .env
   ```

4. Configure your database connection in `.env`

5. Create database and tables:
   ```bash
   mysql -u root -p < ../database/schema.sql
   ```

6. Start the server:
   ```bash
   npm start
   ```

### Frontend Setup

1. Navigate to the frontend directory:
   ```bash
   cd frontend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Start the development server:
   ```bash
   npm start
   ```

## API Documentation

### Authentication Endpoints
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login user
- `POST /api/auth/logout` - Logout user

### User Endpoints
- `GET /api/users` - Get all users
- `POST /api/users` - Create new user
- `GET /api/users/:id` - Get user by ID
- `PUT /api/users/:id` - Update user
- `DELETE /api/users/:id` - Delete user

### Asset Endpoints
- `GET /api/assets` - Get all assets
- `POST /api/assets` - Create new asset
- `GET /api/assets/:id` - Get asset by ID
- `PUT /api/assets/:id` - Update asset
- `DELETE /api/assets/:id` - Delete asset
- `GET /api/assets/project/:projectId` - Get assets by project

### Assignment Endpoints
- `GET /api/assignments` - Get all assignments
- `POST /api/assignments` - Create new assignment
- `GET /api/assignments/user/:userId` - Get assignments for user

### Disposal Endpoints
- `GET /api/disposal` - Get all disposal requests
- `POST /api/disposal` - Create disposal request
- `PUT /api/disposal/:id/approve` - Approve disposal
- `PUT /api/disposal/:id/reject` - Reject disposal

## Database Schema

The system includes the following main tables:
- `users` - User accounts and profiles
- `departments` - Organization departments
- `projects` - Projects/donors
- `asset_types` - Categories of assets
- `asset_conditions` - Condition statuses
- `assets` - Asset inventory
- `vendors` - Vendor information
- `asset_assignments` - User-asset relationships
- `disposal_requests` - Disposal workflow
- `approvals` - Finance approvals

## Role-Based Access

- **Admin**: Full system access, user management, approvals
- **Finance**: Approval of disposal requests
- **Department Head**: Department asset oversight
- **User**: View assigned assets, request forms

## Usage

### Creating an Asset
1. Navigate to Assets Management
2. Click "Add New Asset"
3. Fill in asset details (name, type, condition, project)
4. Add vendor information and price
5. Click "Save"

### Assigning an Asset
1. Go to Asset Assignments
2. Select an asset and user
3. Confirm assignment
4. User can now see the asset in their dashboard

### Requesting Disposal
1. Navigate to Disposal Management
2. Select asset to dispose
3. Provide reason for disposal
4. Submit for finance approval
5. Finance team reviews and approves/rejects

### Printing Asset Form
1. Select assigned asset
2. Click "Print Form"
3. Asset form generates as PDF

## Contributing

1. Create a feature branch (`git checkout -b feature/amazing-feature`)
2. Commit your changes (`git commit -m 'Add amazing feature'`)
3. Push to the branch (`git push origin feature/amazing-feature`)
4. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, email support@example.com or open an issue in the repository.
