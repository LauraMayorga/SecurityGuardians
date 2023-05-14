/*
  Warnings:

  - You are about to drop the `info_extra` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `info_extra` to the `repositorios_backlog` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `info_extra` DROP FOREIGN KEY `info_extra_backlog_name_fkey`;

-- AlterTable
ALTER TABLE `repositorios_backlog` ADD COLUMN `info_extra` VARCHAR(191) NOT NULL;

-- DropTable
DROP TABLE `info_extra`;
