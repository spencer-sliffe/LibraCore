-- sql/01_create_schema.sql
BEGIN;

CREATE TABLE django_content_type (
    id SERIAL PRIMARY KEY,
    app_label VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    UNIQUE (app_label, model)
);

CREATE TABLE auth_user (
    id SERIAL PRIMARY KEY,
    password VARCHAR(128) NOT NULL,
    last_login TIMESTAMP,
    is_superuser BOOLEAN NOT NULL DEFAULT FALSE,
    first_name VARCHAR(150),
    last_name VARCHAR(150),
    email VARCHAR(254) UNIQUE,
    is_staff BOOLEAN NOT NULL DEFAULT FALSE,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    date_joined TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE accounts_user (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES auth_user(id) ON DELETE CASCADE,
    profile_pic VARCHAR(255),
    bio TEXT
);

CREATE TABLE auth_group (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) UNIQUE NOT NULL
);

CREATE TABLE auth_permission (
    id SERIAL PRIMARY KEY,
    content_type_id INTEGER NOT NULL REFERENCES django_content_type(id) ON DELETE CASCADE,
    codename VARCHAR(100) NOT NULL,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE auth_group_permissions (
    group_id INTEGER NOT NULL REFERENCES auth_group(id) ON DELETE CASCADE,
    permission_id INTEGER NOT NULL REFERENCES auth_permission(id) ON DELETE CASCADE,
    PRIMARY KEY (group_id, permission_id)
);

CREATE TABLE auth_user_groups (
    user_id INTEGER NOT NULL REFERENCES auth_user(id) ON DELETE CASCADE,
    group_id INTEGER NOT NULL REFERENCES auth_group(id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, group_id)
);

CREATE TABLE auth_user_user_permissions (
    user_id INTEGER NOT NULL REFERENCES auth_user(id) ON DELETE CASCADE,
    permission_id INTEGER NOT NULL REFERENCES auth_permission(id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, permission_id)
);

CREATE TABLE accounts_user_user_permissions (
    account_user_id INTEGER NOT NULL REFERENCES accounts_user(id) ON DELETE CASCADE,
    permission_id INTEGER NOT NULL REFERENCES auth_permission(id) ON DELETE CASCADE,
    PRIMARY KEY (account_user_id, permission_id)
);

CREATE TABLE accounts_user_groups (
    account_user_id INTEGER NOT NULL REFERENCES accounts_user(id) ON DELETE CASCADE,
    group_id INTEGER NOT NULL REFERENCES auth_group(id) ON DELETE CASCADE,
    PRIMARY KEY (account_user_id, group_id)
);

CREATE TABLE catalog_item (
    id SERIAL PRIMARY KEY,
    item_type VARCHAR(50) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    issue_number INTEGER,
    publication_date DATE,
    title VARCHAR(200) NOT NULL,
    publication_year INTEGER,
    genre VARCHAR(50),
    creator VARCHAR(100),
    item_format VARCHAR(50),
    availability BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE reservations_reservation (
    id SERIAL PRIMARY KEY,
    content_type_id INTEGER NOT NULL REFERENCES django_content_type(id) ON DELETE CASCADE,
    object_id INTEGER NOT NULL,
    timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE loans_reservation (
    id SERIAL PRIMARY KEY,
    member_id INTEGER NOT NULL REFERENCES auth_user(id) ON DELETE CASCADE,
    item_id INTEGER NOT NULL REFERENCES catalog_item(id) ON DELETE CASCADE,
    reservation_id INTEGER REFERENCES reservations_reservation(id) ON DELETE SET NULL,
    request_date DATE NOT NULL DEFAULT CURRENT_DATE,
    due_date DATE,
    status VARCHAR(20) NOT NULL
);

CREATE TABLE loans_borrowingtransaction (
    id SERIAL PRIMARY KEY,
    member_id INTEGER NOT NULL REFERENCES auth_user(id) ON DELETE CASCADE,
    reservation_id INTEGER REFERENCES loans_reservation(id) ON DELETE SET NULL,
    borrow_date DATE NOT NULL DEFAULT CURRENT_DATE,
    return_date DATE
);

CREATE TABLE reports_report (
    id SERIAL PRIMARY KEY,
    created_by_id INTEGER REFERENCES auth_user(id) ON DELETE SET NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE notifications_notification (
    id SERIAL PRIMARY KEY,
    recipient_id INTEGER NOT NULL REFERENCES auth_user(id) ON DELETE CASCADE,
    message TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_read BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE core_auditing (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES auth_user(id) ON DELETE SET NULL,
    action VARCHAR(100) NOT NULL,
    timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE core_systemconfig (
    id SERIAL PRIMARY KEY,
    config_key VARCHAR(100) NOT NULL UNIQUE,
    config_value TEXT NOT NULL
);

COMMIT;
