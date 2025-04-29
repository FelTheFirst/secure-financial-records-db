-- Create roles

-- 1. Create roles
CREATE ROLE admin LOGIN PASSWORD 'REPLACE_ME_SECURELY';
COMMENT ON ROLE admin IS 'Administrator role with full privileges.';

CREATE ROLE analyst LOGIN PASSWORD 'REPLACE_ME_SECURELY';
COMMENT ON ROLE analyst IS 'Analyst role with read-only access to financial data.';

CREATE ROLE compliance LOGIN PASSWORD 'REPLACE_ME_SECURELY';
COMMENT ON ROLE compliance IS 'Compliance officer role to access audit logs.';

-- 2. Grant permissions

-- Admin gets full access to all tables
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin;

-- Analyst can only SELECT from accounts and transactions
GRANT SELECT ON accounts, transactions TO analyst;

-- Compliance can only SELECT from audit_log and compliance_checks
GRANT SELECT ON audit_log, compliance_checks TO compliance;
