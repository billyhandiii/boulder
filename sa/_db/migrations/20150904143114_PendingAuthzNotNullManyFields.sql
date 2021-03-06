
-- +goose Up
-- SQL in section 'Up' is executed when this migration is applied
ALTER TABLE `pending_authz` MODIFY `identifier` varchar(255) NOT NULL;

ALTER TABLE `pending_authz` DROP FOREIGN KEY `regId_pending_authz`;
ALTER TABLE `pending_authz` MODIFY `registrationID` bigint(20) NOT NULL;
ALTER TABLE `pending_authz` ADD CONSTRAINT `regId_pending_authz` FOREIGN KEY (`registrationID`) REFERENCES `registrations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;


ALTER TABLE `pending_authz` MODIFY `status` varchar(255) NOT NULL;
ALTER TABLE `pending_authz` MODIFY `combinations` varchar(255) NOT NULL;
ALTER TABLE `pending_authz` MODIFY `LockCol` bigint(20) NOT NULL;


-- +goose Down
-- SQL section 'Down' is executed when this migration is rolled back
ALTER TABLE `pending_authz` MODIFY `identifier` varchar(255) DEFAULT NULL;

ALTER TABLE `pending_authz` DROP FOREIGN KEY `regId_pending_authz`;
ALTER TABLE `pending_authz` MODIFY `registrationID` bigint(20) DEFAULT NULL;
ALTER TABLE `pending_authz` ADD CONSTRAINT `regId_pending_authz` FOREIGN KEY (`registrationID`) REFERENCES `registrations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;


ALTER TABLE `pending_authz` MODIFY `status` varchar(255) DEFAULT NULL;
ALTER TABLE `pending_authz` MODIFY `combinations` varchar(255) DEFAULT NULL;
ALTER TABLE `pending_authz` MODIFY `LockCol` bigint(20) DEFAULT NULL;

