/*
  Warnings:

  - You are about to drop the column `repositorios_name` on the `info_extra` table. All the data in the column will be lost.
  - Added the required column `backlog_name` to the `info_extra` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `info_extra` DROP FOREIGN KEY `info_extra_repositorios_name_fkey`;

-- AlterTable
ALTER TABLE `info_extra` DROP COLUMN `repositorios_name`,
    ADD COLUMN `backlog_name` VARCHAR(191) NOT NULL;

-- AddForeignKey
ALTER TABLE `info_extra` ADD CONSTRAINT `info_extra_backlog_name_fkey` FOREIGN KEY (`backlog_name`) REFERENCES `backlog`(`backlog_name`) ON DELETE RESTRICT ON UPDATE CASCADE;
