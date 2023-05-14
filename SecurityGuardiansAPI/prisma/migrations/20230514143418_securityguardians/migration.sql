-- CreateTable
CREATE TABLE `security_guardians` (
    `guardian_name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`guardian_name`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `application_owners` (
    `owner_name` VARCHAR(191) NOT NULL,
    `guardian_name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`owner_name`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `iniciativas` (
    `iniciativas_name` VARCHAR(191) NOT NULL,
    `owner_name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`iniciativas_name`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `repositorios` (
    `repositorios_name` VARCHAR(191) NOT NULL,
    `prioridad` VARCHAR(191) NOT NULL,
    `iniciativas_name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`repositorios_name`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `backlog` (
    `backlog_name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`backlog_name`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `repositorios_backlog` (
    `repositorios_name` VARCHAR(191) NOT NULL,
    `backlog_name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`repositorios_name`, `backlog_name`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `info_extra` (
    `info` VARCHAR(191) NOT NULL,
    `repositorios_name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`info`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `application_owners` ADD CONSTRAINT `application_owners_guardian_name_fkey` FOREIGN KEY (`guardian_name`) REFERENCES `security_guardians`(`guardian_name`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `iniciativas` ADD CONSTRAINT `iniciativas_owner_name_fkey` FOREIGN KEY (`owner_name`) REFERENCES `application_owners`(`owner_name`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `repositorios` ADD CONSTRAINT `repositorios_iniciativas_name_fkey` FOREIGN KEY (`iniciativas_name`) REFERENCES `iniciativas`(`iniciativas_name`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `repositorios_backlog` ADD CONSTRAINT `repositorios_backlog_repositorios_name_fkey` FOREIGN KEY (`repositorios_name`) REFERENCES `repositorios`(`repositorios_name`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `repositorios_backlog` ADD CONSTRAINT `repositorios_backlog_backlog_name_fkey` FOREIGN KEY (`backlog_name`) REFERENCES `backlog`(`backlog_name`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `info_extra` ADD CONSTRAINT `info_extra_repositorios_name_fkey` FOREIGN KEY (`repositorios_name`) REFERENCES `repositorios`(`repositorios_name`) ON DELETE RESTRICT ON UPDATE CASCADE;
