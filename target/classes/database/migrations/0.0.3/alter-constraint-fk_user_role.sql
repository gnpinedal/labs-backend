ALTER TABLE association
    DROP CONSTRAINT fk_user_role,
    ADD CONSTRAINT fk_user_role
        FOREIGN KEY ("user_id", "role_id")
            REFERENCES "labs"."public"."user_role" ("user_id", "role_id")
            ON UPDATE CASCADE
            ON DELETE CASCADE;