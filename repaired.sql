/* WARNING: Script requires that SQLITE_DBCONFIG_DEFENSIVE be disabled */
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
INSERT INTO schema_migrations VALUES('20250219123840');
INSERT INTO schema_migrations VALUES('20250220023521');
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO ar_internal_metadata VALUES('environment','development','2025-02-19 12:40:36.453523','2025-02-19 12:40:36.453525');
CREATE TABLE IF NOT EXISTS "memos" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "content" text NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO memos VALUES(40,'あああ','2025-02-20 04:51:55.262127','2025-02-20 04:51:55.262127');
INSERT INTO memos VALUES(41,'aaaaa','2025-02-20 04:52:03.476448','2025-02-20 04:52:03.476448');
PRAGMA writable_schema=ON;
INSERT INTO sqlite_schema(type,name,tbl_name,rootpage,sql)VALUES('table','memos_fts','memos_fts',0,'CREATE VIRTUAL TABLE memos_fts USING fts5(
        content,
        content=''memos'',
        content_rowid=''id''
      )');
CREATE TABLE IF NOT EXISTS 'memos_fts_data'(id INTEGER PRIMARY KEY, block BLOB);
INSERT INTO memos_fts_data VALUES(1,X'0300');
INSERT INTO memos_fts_data VALUES(10,X'00000000000000');
CREATE TABLE IF NOT EXISTS 'memos_fts_idx'(segid, term, pgno, PRIMARY KEY(segid, term)) WITHOUT ROWID;
CREATE TABLE IF NOT EXISTS 'memos_fts_docsize'(id INTEGER PRIMARY KEY, sz BLOB);
INSERT INTO memos_fts_docsize VALUES(1,X'00');
INSERT INTO memos_fts_docsize VALUES(2,X'00');
INSERT INTO memos_fts_docsize VALUES(3,X'00');
CREATE TABLE IF NOT EXISTS 'memos_fts_config'(k PRIMARY KEY, v) WITHOUT ROWID;
INSERT INTO memos_fts_config VALUES('version',4);
INSERT INTO sqlite_sequence VALUES('memos',41);
PRAGMA writable_schema=OFF;
COMMIT;
