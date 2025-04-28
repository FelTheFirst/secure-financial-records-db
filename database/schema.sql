-- Secure Financial Records Database Schema

-- USERS TABLE: Stores authentication and profile information for customers and employees
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    address TEXT,
    user_role VARCHAR(20) NOT NULL, -- 'customer', 'employee', 'admin', 'auditor'
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ACCOUNTS TABLE: Bank accounts associated with users
CREATE TABLE accounts (
    account_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    account_number VARCHAR(20) UNIQUE NOT NULL, -- Account number should be encrypted at the application layer in production systems
    account_type VARCHAR(20) NOT NULL, -- 'checking', 'savings', 'credit', etc.
    balance NUMERIC(15,2) NOT NULL DEFAULT 0.00,
    currency VARCHAR(10) NOT NULL DEFAULT 'USD',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TRANSACTIONS TABLE: Money movements between accounts
CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    source_account_id INT REFERENCES accounts(account_id) ON DELETE SET NULL,
    destination_account_id INT REFERENCES accounts(account_id) ON DELETE SET NULL,
    amount NUMERIC(15,2) NOT NULL,
    transaction_type VARCHAR(20) NOT NULL, -- 'deposit', 'withdrawal', 'transfer', etc.
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    description TEXT
);

-- AUDIT_LOG TABLE: Security logs of data access and modifications
CREATE TABLE audit_log (
    log_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id) ON DELETE SET NULL,
    action VARCHAR(50) NOT NULL, -- 'SELECT', 'INSERT', 'UPDATE', 'DELETE'
    table_name VARCHAR(50) NOT NULL,
    record_id INT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    description TEXT
);

-- COMPLIANCE_CHECKS TABLE: Mapping of database actions to regulatory requirements
CREATE TABLE compliance_checks (
    check_id SERIAL PRIMARY KEY,
    regulation VARCHAR(50) NOT NULL, -- e.g., 'GLBA', 'FADP'
    description TEXT NOT NULL,
    related_table VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
