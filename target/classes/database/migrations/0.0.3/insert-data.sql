-- --------- --
-- Role data --
-- --------- --
INSERT INTO "labs"."public"."role" (role_id, role_name)
    VALUES (1, 'Estudiante'), (2, 'Profesor');

-- ----------- --
-- Period data --
-- ----------- --
INSERT INTO "labs"."public"."period" (period_name)
    VALUES ('Periodo 2020-02');
ALTER SEQUENCE period_period_id_seq RESTART WITH 2;

-- --------- --
-- User Data --
-- --------- --
INSERT INTO "labs"."public"."user" (user_id, username, password, "names", surnames)
    VALUES (1, 'hlopezm', '$2a$10$WBrK1hLx2Go/alh38HuQdu4wW4P8pFo.rLcH7oskis9yKut77ZwDO', 'HUMBERTO', 'LÓPEZ MIRANDA'),
        (2, 'spastore', '$2a$10$3Ai.b.v/SJtTEjJeOWgPLeoMhKyEUJb.uuK0tws310LQfKKQuN5JO', 'SALVADOR', 'PASTOR ESPINOZA'),
        (3, 'rperezg', '$2a$10$lBpVDdvg7APyo/ozWmrb0el1y44eTqPv5quwK/Cf8ZcNl/TNzxG6W', 'TOMÁS', 'PÉREZ GIL'),
        (4, 'jmendezs', '$2a$10$MuvQDfRNfbs/q00Q1YzBNeFd28/9QUML.vy1az6FoWYtZcXzuGCcK', 'JONATHAN', 'MÉNDEZ SOSA'),
        (5, 'ntapiaa', '$2a$10$K5LjicrVUsLto0yyiSOxyeRSzPCSwQ424CacXk2LZuKE3guD/IVoK', 'NANCY', 'TAPIA ÁRIAS');
ALTER SEQUENCE user_user_id_seq RESTART WITH 6;

-- -------------- --
-- Role User Data --
-- -------------- --
INSERT INTO "labs"."public"."user_role" (user_id, role_id) VALUES (1, 2);
INSERT INTO "labs"."public"."user_role" (user_id, role_id) VALUES (2, 1);
INSERT INTO "labs"."public"."user_role" (user_id, role_id) VALUES (3, 1);
INSERT INTO "labs"."public"."user_role" (user_id, role_id) VALUES (4, 1);
INSERT INTO "labs"."public"."user_role" (user_id, role_id) VALUES (5, 1);

-- ----------- --
-- Course Data --
-- ----------- --
INSERT INTO "labs"."public"."course" (course_id, course_name, duration_hours) VALUES (1, 'Matemática Aplicada', 100);
INSERT INTO "labs"."public"."course" (course_id, course_name, duration_hours) VALUES (2, 'Ingeniería de Software II', 148);
ALTER SEQUENCE course_course_id_seq RESTART WITH 3;

-- ---------------- --
-- Association Data --
-- ---------------- --
INSERT INTO "labs"."public"."association" (association_id, user_id, role_id, course_id, period_id)
    VALUES (1, 1, 2, 1, 1);
INSERT INTO "labs"."public"."association" (association_id, user_id, role_id, course_id, period_id)
    VALUES (2, 2, 1, 1, 1);
INSERT INTO "labs"."public"."association" (association_id, user_id, role_id, course_id, period_id)
    VALUES (3, 3, 1, 1, 1);
INSERT INTO "labs"."public"."association" (association_id, user_id, role_id, course_id, period_id)
    VALUES (4, 5, 1, 2, 1);
INSERT INTO "labs"."public"."association" (association_id, user_id, role_id, course_id, period_id)
    VALUES (5, 4, 1, 2, 1);
INSERT INTO "labs"."public"."association" (association_id, user_id, role_id, course_id, period_id)
    VALUES (6, 3, 1, 2, 1);