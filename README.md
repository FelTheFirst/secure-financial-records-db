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
