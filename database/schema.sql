-- Asset Management System Database Schema
-- MySQL Database

-- Create Database
CREATE DATABASE IF NOT EXISTS asset_management_system;
USE asset_management_system;

-- 1. Departments Table
CREATE TABLE departments (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL UNIQUE,
  description TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. Projects Table (Disc, Maverick, etc.)
CREATE TABLE projects (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL UNIQUE,
  description TEXT,
  donor_name VARCHAR(100),
  start_date DATE,
  end_date DATE,
  status ENUM('active', 'completed', 'on_hold') DEFAULT 'active',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_name (name),
  INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3. Users Table
CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  phone VARCHAR(20),
  password VARCHAR(255) NOT NULL,
  department_id INT NOT NULL,
  role ENUM('admin', 'finance', 'department_head', 'user') DEFAULT 'user',
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE RESTRICT,
  INDEX idx_email (email),
  INDEX idx_department_id (department_id),
  INDEX idx_role (role)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4. Asset Types Table
CREATE TABLE asset_types (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL UNIQUE,
  description TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 5. Asset Conditions Table
CREATE TABLE asset_conditions (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL UNIQUE,
  description TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 6. Vendors Table
CREATE TABLE vendors (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100),
  phone VARCHAR(20),
  address TEXT,
  city VARCHAR(50),
  country VARCHAR(50),
  contact_person VARCHAR(100),
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_name (name),
  INDEX idx_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 7. Assets Table
CREATE TABLE assets (
  id INT PRIMARY KEY AUTO_INCREMENT,
  asset_name VARCHAR(150) NOT NULL,
  asset_type_id INT NOT NULL,
  asset_condition_id INT NOT NULL,
  project_id INT NOT NULL,
  engraving_number VARCHAR(50) UNIQUE,
  reference_number VARCHAR(50) UNIQUE,
  description TEXT,
  vendor_id INT,
  purchase_price DECIMAL(12, 2),
  purchase_date DATE,
  warranty_expiry DATE,
  serial_number VARCHAR(100),
  location VARCHAR(150),
  status ENUM('available', 'assigned', 'maintenance', 'disposal', 'disposed') DEFAULT 'available',
  created_by INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (asset_type_id) REFERENCES asset_types(id) ON DELETE RESTRICT,
  FOREIGN KEY (asset_condition_id) REFERENCES asset_conditions(id) ON DELETE RESTRICT,
  FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE,
  FOREIGN KEY (vendor_id) REFERENCES vendors(id) ON DELETE SET NULL,
  FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE RESTRICT,
  INDEX idx_asset_name (asset_name),
  INDEX idx_engraving_number (engraving_number),
  INDEX idx_reference_number (reference_number),
  INDEX idx_project_id (project_id),
  INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 8. Asset Assignments Table
CREATE TABLE asset_assignments (
  id INT PRIMARY KEY AUTO_INCREMENT,
  asset_id INT NOT NULL,
  user_id INT NOT NULL,
  assigned_by INT NOT NULL,
  assignment_date DATE NOT NULL,
  return_date DATE,
  notes TEXT,
  status ENUM('active', 'returned', 'lost') DEFAULT 'active',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (asset_id) REFERENCES assets(id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (assigned_by) REFERENCES users(id) ON DELETE RESTRICT,
  INDEX idx_asset_id (asset_id),
  INDEX idx_user_id (user_id),
  INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 9. Disposal Requests Table
CREATE TABLE disposal_requests (
  id INT PRIMARY KEY AUTO_INCREMENT,
  asset_id INT NOT NULL,
  requested_by INT NOT NULL,
  disposal_reason TEXT NOT NULL,
  disposal_date DATE,
  estimated_salvage_value DECIMAL(12, 2),
  status ENUM('pending', 'approved', 'rejected', 'disposed') DEFAULT 'pending',
  approval_notes TEXT,
  approved_by INT,
  approval_date DATE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (asset_id) REFERENCES assets(id) ON DELETE CASCADE,
  FOREIGN KEY (requested_by) REFERENCES users(id) ON DELETE RESTRICT,
  FOREIGN KEY (approved_by) REFERENCES users(id) ON DELETE SET NULL,
  INDEX idx_asset_id (asset_id),
  INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 10. Asset Forms (for tracking printed forms)
CREATE TABLE asset_forms (
  id INT PRIMARY KEY AUTO_INCREMENT,
  assignment_id INT NOT NULL,
  form_number VARCHAR(50) UNIQUE,
  printed_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  printed_by INT NOT NULL,
  form_data JSON,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (assignment_id) REFERENCES asset_assignments(id) ON DELETE CASCADE,
  FOREIGN KEY (printed_by) REFERENCES users(id) ON DELETE RESTRICT,
  INDEX idx_assignment_id (assignment_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 11. Audit Log Table
CREATE TABLE audit_logs (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  action VARCHAR(100) NOT NULL,
  table_name VARCHAR(50) NOT NULL,
  record_id INT,
  old_values JSON,
  new_values JSON,
  ip_address VARCHAR(45),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
  INDEX idx_action (action),
  INDEX idx_table_name (table_name),
  INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert Default Data

-- Insert Asset Conditions
INSERT INTO asset_conditions (name, description) VALUES
('New', 'Brand new, never used'),
('Good', 'Fully functional, minimal wear'),
('Fair', 'Functional, visible wear'),
('Poor', 'Functional but significant wear'),
('Faulty', 'Not functional, needs repair');

-- Insert Asset Types
INSERT INTO asset_types (name, description) VALUES
('Computer', 'Laptops, desktops, and other computing devices'),
('Furniture', 'Office furniture and equipment'),
('Equipment', 'Machinery and technical equipment'),
('Vehicle', 'Cars, vans, and other vehicles'),
('Software License', 'Software licenses and subscriptions'),
('Networking', 'Networking equipment and devices'),
('Other', 'Other miscellaneous assets');

-- Insert Sample Departments
INSERT INTO departments (name, description) VALUES
('Finance', 'Finance and Accounting Department'),
('IT', 'Information Technology Department'),
('HR', 'Human Resources Department'),
('Operations', 'Operations and Logistics'),
('Administration', 'General Administration');

-- Insert Sample Projects
INSERT INTO projects (name, description, donor_name, status) VALUES
('Disc Project', 'Disc donor funded project', 'Disc Foundation', 'active'),
('Maverick Project', 'Maverick initiative project', 'Maverick Inc', 'active'),
('Infrastructure', 'General infrastructure project', 'Internal Fund', 'active');
