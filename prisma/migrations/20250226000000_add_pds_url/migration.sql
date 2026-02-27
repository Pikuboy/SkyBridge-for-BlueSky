-- AlterTable: add pds_url column to SessionRecord
-- Uses ALTER TABLE to preserve existing rows, defaulting to bsky.social
ALTER TABLE "SessionRecord" ADD COLUMN "pds_url" TEXT NOT NULL DEFAULT 'bsky.social';
