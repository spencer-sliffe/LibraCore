
### Project Overview
This Library Management System (LMS) persists catalog items, members, staff accounts, borrowing transactions, reservations, fines, reports and notifications in a relational database. The goal is to streamline daily library operations – from cataloging new acquisitions to auditing overdue fines – while preserving data integrity and performance. citeturn0file0

### Scope  
*Included:* books, magazines, DVDs; membership, borrowing, reservations, fines, internal audit logs.  
*Excluded:* e‑book lending, external recommendation engines, third‑party integrations. citeturn0file0

### Glossary (additions)
| Term | Meaning |
|------|---------|
| **Content‑type** | Generic reference target used by `django_content_type` to support polymorphic reservations |
| **Permission** | Discrete capability that can be granted to either a group or a user |
| **Group** | Role‑oriented collection of permissions to simplify RBAC |

---

## Platform Decision

| Option | Pros | Cons |
|--------|------|------|
| **PostgreSQL 15** (chosen) | ACID compliance, rich constraint & index options, JSONB for potential extensibility, native `SERIAL`/identity columns, ubiquitous hosting, first‑class support in JetBrains DataGrip/PyCharm. | Slightly steeper learning curve vs MySQL for new users |
| MariaDB 10.6 | Familiar MySQL dialect, fast. | Weaker JSON, window‑function support lags, stricter GIS licensing. |
| SQL Server 2022 | Excellent tooling, native temporal tables. | Windows‑centric, weighty footprint, licensing cost. |

PostgreSQL’s feature depth (check constraints, robust indexing strategies, transactional DDL) and seamless integration with DataGrip tipped the balance.

