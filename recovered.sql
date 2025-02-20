BEGIN;
PRAGMA writable_schema = on;
PRAGMA encoding = 'UTF-8';
PRAGMA page_size = '4096';
PRAGMA auto_vacuum = '0';
PRAGMA user_version = '0';
PRAGMA application_id = '0';
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE "memos" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "content" text NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO sqlite_schema VALUES('table', 'memos_fts', 'memos_fts', 0, 'CREATE VIRTUAL TABLE memos_fts USING fts5(
        content,
        content=''memos'',
        content_rowid=''id''
      )');
CREATE TABLE 'memos_fts_data'(id INTEGER PRIMARY KEY, block BLOB);
CREATE TABLE 'memos_fts_idx'(segid, term, pgno, PRIMARY KEY(segid, term)) WITHOUT ROWID;
CREATE TABLE 'memos_fts_docsize'(id INTEGER PRIMARY KEY, sz BLOB);
CREATE TABLE 'memos_fts_config'(k PRIMARY KEY, v) WITHOUT ROWID;
INSERT OR IGNORE INTO 'schema_migrations'(_rowid_, 'version') VALUES (1, '20250219123840');
INSERT OR IGNORE INTO 'schema_migrations'(_rowid_, 'version') VALUES (2, '20250220023521');
INSERT OR IGNORE INTO 'ar_internal_metadata'(_rowid_, 'key', 'value', 'created_at', 'updated_at') VALUES (1, 'environment', 'development', '2025-02-19 12:40:36.453523', '2025-02-19 12:40:36.453525');
INSERT OR IGNORE INTO 'memos'('id', 'content', 'created_at', 'updated_at') VALUES (40, 'あああ', '2025-02-20 04:51:55.262127', '2025-02-20 04:51:55.262127');
INSERT OR IGNORE INTO 'memos'('id', 'content', 'created_at', 'updated_at') VALUES (41, 'aaaaa', '2025-02-20 04:52:03.476448', '2025-02-20 04:52:03.476448');
INSERT OR IGNORE INTO 'memos_fts_data'('id', 'block') VALUES (1, X'0300');
INSERT OR IGNORE INTO 'memos_fts_data'('id', 'block') VALUES (10, X'00000000000000');
INSERT OR IGNORE INTO 'memos_fts_docsize'('id', 'sz') VALUES (1, X'00');
INSERT OR IGNORE INTO 'memos_fts_docsize'('id', 'sz') VALUES (2, X'00');
INSERT OR IGNORE INTO 'memos_fts_docsize'('id', 'sz') VALUES (3, X'00');
INSERT OR IGNORE INTO 'memos_fts_config'('k', 'v') VALUES ('version', 4);
DELETE FROM sqlite_sequence;
INSERT OR IGNORE INTO 'sqlite_sequence'(_rowid_, 'name', 'seq') VALUES (1, 'memos', 41);
PRAGMA writable_schema = off;
COMMIT;
