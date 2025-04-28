-- sql/02_seed_data.sql
BEGIN;

-- django_content_type
INSERT INTO django_content_type (app_label, model) VALUES
('catalog', 'catalog_item'),
('auth', 'user'),
('loans', 'reservation');

-- auth_user
INSERT INTO auth_user (password, last_login, is_superuser, first_name, last_name, email, is_staff, is_active)
VALUES
('hashed_pw_admin', NOW(), TRUE, 'Admin', 'User', 'admin@library.com', TRUE, TRUE),
('hashed_pw_john', NULL, FALSE, 'John', 'Smith', 'john.smith@example.com', FALSE, TRUE),
('hashed_pw_jane', NULL, FALSE, 'Jane', 'Doe', 'jane.doe@example.com', TRUE, TRUE);

-- accounts_user
INSERT INTO accounts_user (user_id, profile_pic, bio) VALUES
(1, 'https://pics.example.com/admin.jpg', 'Library system administrator.'),
(2, 'https://pics.example.com/john.jpg', 'Avid reader of mystery novels.'),
(3, 'https://pics.example.com/jane.jpg', 'Staff librarian specializing in history collections.');

-- auth_group
INSERT INTO auth_group (name) VALUES ('librarian'), ('member');

-- auth_permission
INSERT INTO auth_permission (content_type_id, codename, name) VALUES
(1, 'add_item', 'Can add catalog item'),
(1, 'delete_item', 'Can delete catalog item'),
(2, 'borrow_item', 'Can borrow catalog item');

-- auth_group_permissions
INSERT INTO auth_group_permissions (group_id, permission_id) VALUES
(1,1),(1,2),(2,3);

-- auth_user_groups
INSERT INTO auth_user_groups (user_id, group_id) VALUES
(3,1),(2,2);

-- catalog_item
INSERT INTO catalog_item (item_type, isbn, publication_date, title, publication_year, genre, creator, item_format)
VALUES
('Book', '9780141439600', '2003-05-30', 'Pride and Prejudice', 1813, 'Classic', 'Jane Austen', 'Hardcover'),
('Book', '9780439023528', '2008-09-14', 'The Hunger Games', 2008, 'Dystopian', 'Suzanne Collins', 'Paperback'),
('Magazine', NULL, '2025-03-01', 'National Geographic March 2025', 2025, 'Science', 'National Geographic Society', 'Magazine'),
('DVD', NULL, '2015-11-01', 'Interstellar', 2014, 'Sci-Fi', 'Christopher Nolan', 'DVD'),
('Book', '9780590353427', '1997-06-26', 'Harry Potter and the Philosopher''s Stone', 1997, 'Fantasy', 'J.K. Rowling', 'Hardcover');

-- reservations_reservation
INSERT INTO reservations_reservation (content_type_id, object_id) VALUES
(1,1),
(1,2);

-- loans_reservation
INSERT INTO loans_reservation (member_id, item_id, reservation_id, request_date, due_date, status)
VALUES
(2,1,1,'2025-04-15','2025-05-15','ACTIVE'),
(2,2,2,'2025-04-20','2025-05-20','ACTIVE');

-- loans_borrowingtransaction
INSERT INTO loans_borrowingtransaction (member_id, reservation_id, borrow_date)
VALUES
(2,1,'2025-04-15');

-- reports_report
INSERT INTO reports_report (created_by_id, title, description) VALUES
(3,'Monthly Circulation Report','Summary of April 2025 borrowing activities.');

-- notifications_notification
INSERT INTO notifications_notification (recipient_id, message) VALUES
(2,'Your book "Pride and Prejudice" is due on 2025-05-15.');

-- core_auditing
INSERT INTO core_auditing (user_id, action) VALUES
(3,'Created new catalog item #5');

-- core_systemconfig
INSERT INTO core_systemconfig (config_key, config_value) VALUES
('loan_period_days','30');

COMMIT;
