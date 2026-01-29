BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "tank_configuration" (
    "id" bigserial PRIMARY KEY,
    "maxHeight" double precision NOT NULL,
    "alarmThreshold" double precision NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "tank_reading" (
    "id" bigserial PRIMARY KEY,
    "reading" double precision NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "sensorError" boolean NOT NULL
);


--
-- MIGRATION VERSION FOR flutter_butler_hackathon
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('flutter_butler_hackathon', '20260129063636841', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129063636841', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260109031533194', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260109031533194', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20251208110412389-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110412389-v3-0-0', "timestamp" = now();


COMMIT;
