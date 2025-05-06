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

[users] <br>
 ├── user_id (PK) <br>
 ├── username <br> 
 ├── password_hash <br>
 ├── full_name <br>
 ├── email <br>
 ├── phone_number <br>
 ├── address <br>
 ├── user_role <br>
 ├── created_at <br>
 └── updated_at <br>

   ↓ 1-to-Many

[accounts] <br>
 ├── account_id (PK) <br>
 ├── user_id (FK → users.user_id) <br>
 ├── account_number <br>
 ├── account_type <br>
 ├── balance <br>
 ├── currency <br> 
 ├── created_at <br> 
 └── updated_at <br>

  ↓ 1-to-Many (Self-Join via transactions)

[transactions] <br>
 ├── transaction_id (PK) <br>
 ├── source_account_id (FK → accounts.account_id) <br>
 ├── destination_account_id (FK → accounts.account_id) <br>
 ├── amount <br>
 ├── transaction_type <br>
 ├── transaction_date <br>
 └── description <br>

  ↓ 1-to-Many

[audit_log] <br>
 ├── log_id (PK) <br>
 ├── user_id (FK → users.user_id) <br>
 ├── action <br>
 ├── table_name <br>
 ├── record_id <br>
 ├── timestamp <br>
 └── description <br>

no related FK <br>
[compliance_checks] <br>
 ├── check_id (PK) <br>
 ├── regulation <br>
 ├── description <br>
 ├── related_table <br>
 └── created_at <br>

