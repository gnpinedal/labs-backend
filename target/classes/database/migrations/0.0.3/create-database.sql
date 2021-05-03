DROP TABLE IF EXISTS "labs"."public"."grade";
DROP TABLE IF EXISTS "labs"."public"."association";
DROP TABLE IF EXISTS "labs"."public"."course";
DROP TABLE IF EXISTS "labs"."public"."user_role";
DROP TABLE IF EXISTS "labs"."public"."user";
DROP TABLE IF EXISTS "labs"."public"."role";
DROP TABLE IF EXISTS "labs"."public"."period";


-- ---------------------------- --
-- Table "labs"."public"."user" --
-- ---------------------------- --
CREATE TABLE IF NOT EXISTS "labs"."public"."user"
(
    "user_id"  SERIAL       NOT NULL,
    "username" VARCHAR(10)  NOT NULL,
    "password" VARCHAR(256) NOT NULL,
    "names"    VARCHAR(100) NOT NULL,
    "surnames" VARCHAR(100) NOT NULL,
    PRIMARY KEY ("user_id")
);


-- ------------------------------ --
-- Table "labs"."public"."course" --
-- ------------------------------ --
CREATE TABLE IF NOT EXISTS "labs"."public"."course"
(
    "course_id"      SERIAL       NOT NULL,
    "course_name"    VARCHAR(100) NOT NULL,
    "duration_hours" INT          NOT NULL,
    PRIMARY KEY ("course_id")
);


-- ---------------------------- --
-- Table "labs"."public"."role" --
-- ---------------------------- --
CREATE TABLE IF NOT EXISTS "labs"."public"."role"
(
    "role_id"   INTEGER     NOT NULL,
    "role_name" VARCHAR(20) NOT NULL,
    PRIMARY KEY ("role_id")
);


-- --------------------------------- --
-- Table "labs"."public"."user_role" --
-- --------------------------------- --
CREATE TABLE IF NOT EXISTS "labs"."public"."user_role"
(
    "user_id" INT NOT NULL,
    "role_id" INT NOT NULL,
    PRIMARY KEY ("user_id", "role_id"),
    CONSTRAINT "fk_user_id"
        FOREIGN KEY ("user_id")
            REFERENCES "labs"."public"."user" ("user_id")
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT "fk_role_id"
        FOREIGN KEY ("role_id")
            REFERENCES "labs"."public"."role" ("role_id")
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);
CREATE INDEX "idx_user_role_user_id" ON "labs"."public"."user" ("user_id" ASC);
CREATE INDEX "idx_user_role_role_id" ON "labs"."public"."role" ("role_id" ASC);


-- ------------------------------ --
-- Table "labs"."public"."period" --
-- ------------------------------ --
CREATE TABLE IF NOT EXISTS "labs"."public"."period"
(
    "period_id"   SERIAL      NOT NULL,
    "period_name" VARCHAR(20) NOT NULL,
    PRIMARY KEY ("period_id")
);


-- ----------------------------------- --
-- Table "labs"."public"."association" --
-- ----------------------------------- --
CREATE TABLE IF NOT EXISTS "labs"."public"."association"
(
    "association_id" SERIAL NOT NULL,
    "user_id"        INT    NOT NULL,
    "role_id"        INT    NOT NULL,
    "course_id"      INT    NOT NULL,
    "period_id"      INT    NOT NULL,
    PRIMARY KEY ("association_id"),
    CONSTRAINT "fk_user_role"
        FOREIGN KEY ("user_id", "role_id")
            REFERENCES "labs"."public"."user_role" ("user_id", "role_id")
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT "fk_course"
        FOREIGN KEY ("course_id")
            REFERENCES "labs"."public"."course" ("course_id")
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT "fk_period"
        FOREIGN KEY ("period_id")
            REFERENCES "labs"."public"."period" ("period_id")
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);
CREATE INDEX "idx_association_user_role_id" ON "labs"."public"."association" ("user_id" ASC, "role_id" ASC);
CREATE INDEX "idx_association_course_id" ON "labs"."public"."association" ("course_id" ASC);
CREATE INDEX "idx_association_period_id" ON "labs"."public"."association" ("period_id" ASC);


-- ----------------------------- --
-- Table "labs"."public"."grade" --
-- ----------------------------- --
CREATE TABLE IF NOT EXISTS "labs"."public"."grade"
(
    "grade_id"       SERIAL  NOT NULL,
    "approved"       BOOLEAN NULL,
    "note"           REAL    NULL,
    "association_id" INT     NOT NULL,
    PRIMARY KEY ("grade_id"),
    CONSTRAINT "fk_association"
        FOREIGN KEY ("association_id")
            REFERENCES "labs"."public"."association" ("association_id")
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);
CREATE UNIQUE INDEX "unq_grade_association" ON "labs"."public"."grade" ("association_id");
CREATE INDEX "idx_grade_association_id" ON "labs"."public"."grade" ("association_id" ASC);