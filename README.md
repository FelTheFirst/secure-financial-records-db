# Secure Financial Records Database
PostgreSQL portfolio project to showcase secure database design, encryption, RBAC, and compliance mapping for US and Swiss financial regulations.

## Objective
This project demonstrates the design and implementation of a secure PostgreSQL database for managing sensitive financial records. It highlights encryption standards, role-based access control (RBAC), and compliance with U.S. (GLBA, SOX) and Swiss (FADP, FINMA) regulations. The U.S. and Switzerland were chosen to reflect both the global nature of cybersecurity and my dual citizenship, with a focus on countries that have significant financial sectors. This project bridges theoretical security knowledge with practical database skills relevant to SOC and GRC roles in the financial industry.

## Database Design Overview

The database consists of five core tables:

- **users**: Stores both customers and employees with secure credential and role data.
- **accounts**: Each user can have one or more bank accounts.
- **transactions**: Records money movements between accounts.
- **audit_log**: Tracks security-relevant events like access, modification, and deletions.
- **compliance_checks**: Maps tables/actions to relevant U.S. (GLBA, SOX) and Swiss (FADP, FINMA) regulations.

## Table Relationships

The relationship between the tables is as follows:

[users]
 ├── user_id (PK)
 ├── username
 ├── password_hash
 ├── full_name
 ├── email
 ├── phone_number
 ├── address
 ├── user_role
 ├── created_at
 └── updated_at

   ↓ 1-to-Many

[accounts]
 ├── account_id (PK)
 ├── user_id (FK → users.user_id)
 ├── account_number
 ├── account_type
 ├── balance
 ├── currency
 ├── created_at
 └── updated_at

  ↓ 1-to-Many (Self-Join via transactions)

[transactions]
 ├── transaction_id (PK)
 ├── source_account_id (FK → accounts.account_id)
 ├── destination_account_id (FK → accounts.account_id)
 ├── amount
 ├── transaction_type
 ├── transaction_date
 └── description

  ↓ 1-to-Many

[audit_log]
 ├── log_id (PK)
 ├── user_id (FK → users.user_id)
 ├── action
 ├── table_name
 ├── record_id
 ├── timestamp
 └── description

no related FK <br>
[compliance_checks]
 ├── check_id (PK)
 ├── regulation
 ├── description
 ├── related_table
 └── created_at

