-- Just a Chit-Chat v7.9 - run ONCE on an existing database (Cloudflare dashboard >
-- Workers & Pages > D1 > your database > Console; paste, then Execute).
-- Fresh installs: schema.sql already includes these columns - do NOT run this file.
-- Safe to deploy the v7.9 Worker first: until this is run, the new notes / reviewed ticks /
-- topic ordering simply say "needs the database update" and everything else works as before.

-- teacher's note to a pupil, shown on that pupil's own result (never to classmates)
ALTER TABLE submissions ADD COLUMN teacher_comment TEXT;
ALTER TABLE submissions ADD COLUMN comment_by TEXT;
ALTER TABLE submissions ADD COLUMN comment_at INTEGER;

-- "I have looked at this" tick used by the Needs-attention queue (teacher-only)
ALTER TABLE submissions ADD COLUMN reviewed_at INTEGER;
ALTER TABLE submissions ADD COLUMN reviewed_by TEXT;

-- teacher-set topic order (NULL = not reordered yet; those keep their created-at order, after the ordered ones)
ALTER TABLE topics ADD COLUMN sort_order INTEGER;
