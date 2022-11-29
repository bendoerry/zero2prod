-- Add initial admin user
INSERT INTO users (user_id, username, password_hash)
VALUES (
    '1b10e6e5-a5e0-44f8-93a2-17c73df87114',
    'admin',
    '$argon2id$v=19$m=15000,t=2,p=1$OEx/rcq+3ts//WUDzGNl2g$Am8UFBA4w5NJEmAtquGvBmAlu92q/VQcaoL5AyJPfc8'
);
