-- MariaDB dump 10.19  Distrib 10.6.14-MariaDB, for Linux (aarch64)
--
-- Host: mysql    Database: project
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dlzacugnzezkxlalydsfkctvsasjwflegpeu` (`primaryOwnerId`),
  CONSTRAINT `fk_dlzacugnzezkxlalydsfkctvsasjwflegpeu` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vgyqutqyunlzfezskgrrenzcepwohipqqfhp` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ogqcjamqnybmrfspegfdoehdepbvylqzcotl` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_ucyicitlgwpnbpafafrnedlxiddezhpmvzej` (`dateRead`),
  KEY `fk_xrnysbcxchnipylgciybvmtlfxggzoklgaqm` (`pluginId`),
  CONSTRAINT `fk_kzxfitwcvmcjpaifxbdzjiaqljlcryphhyxr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xrnysbcxchnipylgciybvmtlfxggzoklgaqm` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_brkfbtgxlecmcserjjleymgiiimbpjohjyga` (`sessionId`,`volumeId`),
  KEY `idx_hwtrkgupsypfiqmajaoxeunkthfplcvamhdx` (`volumeId`),
  CONSTRAINT `fk_bdnmisokwsgsbejzaxwukvodsuegpijxzwsp` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_noepmzswofyuxuwnsymezmnkoudkwldpgsgd` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `mimeType` varchar(255) DEFAULT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_zjtgixntgzcsyugyhzjvwksyrodvvzawckij` (`filename`,`folderId`),
  KEY `idx_dbwmevjrtkluzfcwyhtrtlictmlcylrqeewi` (`folderId`),
  KEY `idx_sdfzoodcsqczbamuhgautzylorjbqkaigwad` (`volumeId`),
  KEY `fk_bxduuuwrpkejgrbkuxsdvfsxyakduoyiwsdl` (`uploaderId`),
  CONSTRAINT `fk_bxduuuwrpkejgrbkuxsdvfsxyakduoyiwsdl` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ejatckkifylgbbkpiuacdtznnbxxjpdzfvto` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_frmywkltkgybswudccyoxuafindsxijezupy` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_smrrsizzqnfjlnhyvhoryjlqddnalstbremf` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets_sites`
--

DROP TABLE IF EXISTS `assets_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets_sites` (
  `assetId` int NOT NULL,
  `siteId` int NOT NULL,
  `alt` text,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_rnbylqulkyodzffxkrttltwjpidnvvbrrvbv` (`siteId`),
  CONSTRAINT `fk_rcnasvsvqrbbruggmqtzvfzayadgmqikvlml` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rnbylqulkyodzffxkrttltwjpidnvvbrrvbv` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authenticator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `oldTimestamp` int unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_kddjzwgpjkqxxpwzavpyhdwpbhstidkzjokv` (`userId`),
  CONSTRAINT `fk_kddjzwgpjkqxxpwzavpyhdwpbhstidkzjokv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bulkopevents`
--

DROP TABLE IF EXISTS `bulkopevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulkopevents` (
  `key` char(10) NOT NULL,
  `senderClass` varchar(255) NOT NULL,
  `eventName` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`key`,`senderClass`,`eventName`),
  KEY `idx_igbzncdschpbldttdomzflwhxzphpqpuukpe` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fyiseygdluntwsphkclbbafasvxhaieipyct` (`groupId`),
  KEY `fk_avqhfdyajxdcsbapocwjpupekjxhovbyxcnm` (`parentId`),
  CONSTRAINT `fk_anpqkfzlrxwulfbjxlsacbeqpzehdegwsqob` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_avqhfdyajxdcsbapocwjpupekjxhovbyxcnm` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mxtlwxatylchipziungfksqenvwtzzybxvyn` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eteqeftmrxyjgdeftcolwzyhtmefigjxtrgz` (`name`),
  KEY `idx_rrgibyfbatijpbcyvvltfpgohgrpahddxhyy` (`handle`),
  KEY `idx_ivfpqhsfnvebpkaprxxywrfagaexxgdetvuv` (`structureId`),
  KEY `idx_cszmnvoquwajfojfftenefdmqbejwmmkwtsm` (`fieldLayoutId`),
  KEY `idx_tilgzrhbsdaycivnyupmgcwnidmmqktwkvom` (`dateDeleted`),
  CONSTRAINT `fk_ggaotswhillyvesjnneaemnhkwooylllppfw` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_imqqtfmkjalisjiqabzdbsrjsjprlnnysdho` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ifkaszkumcfmongknjgyrpeghmzbdjobegxu` (`groupId`,`siteId`),
  KEY `idx_elziiyjljxatpifpcbnhrgciempkllglqdzd` (`siteId`),
  CONSTRAINT `fk_covovuqhntpbdhpzwtysiqnatjwuzfdcddbj` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_whdzfuubptgxxcvxcqqpdtavnvuigiqiogvk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_kjbxeiffauhtahrfsjcgugswaijpcdqpvloa` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_qjomrgerscbglgosxujylkouaensxanagdam` (`siteId`),
  KEY `fk_mxgrrssjhsqdmtsrhcajonmzxggfgjnnwigg` (`userId`),
  CONSTRAINT `fk_mxgrrssjhsqdmtsrhcajonmzxggfgjnnwigg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_qjomrgerscbglgosxujylkouaensxanagdam` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yuetfbdogoexylboggrpxwbhoukyikngxlla` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_lcjzswtnhhalqeplnbkiuogsvlvsqxpblrgl` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_ezljttrflkcddjvtduykhzcqljishknezkoq` (`siteId`),
  KEY `fk_splqczdwfcojzddhpuuujkzhhrglsqoilnhi` (`fieldId`),
  KEY `fk_cpblaykkvaecxmrpugalxojmykjilkvgckmw` (`userId`),
  CONSTRAINT `fk_cpblaykkvaecxmrpugalxojmykjilkvgckmw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ezljttrflkcddjvtduykhzcqljishknezkoq` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_splqczdwfcojzddhpuuujkzhhrglsqoilnhi` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vexvwqejqtcdsnsvjmjvswxfxkdnhukljvdy` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contentblocks`
--

DROP TABLE IF EXISTS `contentblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pyvbqhimtbrehigizlxvtjkjwgwlfmevzjtq` (`primaryOwnerId`),
  KEY `idx_vazjilvjnllvflripvzqiudmghejieiaetvg` (`fieldId`),
  CONSTRAINT `fk_acfdbelrqedtvqnssalprqqcifbdtogjwgll` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kozamoohjbkvjwqabkbcpfehoaykqinhzfgn` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wppvkbqyhurdyanssmboigptkrrauictwdck` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_sdgsokmhxxfhqnrjzlkthbjcguheyuaythip` (`userId`),
  CONSTRAINT `fk_sdgsokmhxxfhqnrjzlkthbjcguheyuaythip` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zlprgasqatmbgaqvwgrbtmshprplsynowteh` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_ucvyugbrawmcudmruvpahjjxhcsfmyxfzggb` (`creatorId`,`provisional`),
  KEY `idx_ioaxtchtjztqyxienqukuxmxebzsihupjzxu` (`saved`),
  KEY `fk_bphwhpzgotogcnqmqgusljcjextyzxbluoth` (`canonicalId`),
  CONSTRAINT `fk_bphwhpzgotogcnqmqgusljcjextyzxbluoth` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nkvilkfaszcomefrqwmocuqajwhfjbuyveyf` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_osuqxevbcqcfvdndsrfmskwrhkzsimvinona` (`elementId`,`timestamp`,`userId`),
  KEY `fk_uuxlypmiijdvtkesvxtdjohbnqmhofuiklrf` (`userId`),
  KEY `fk_bjajmwevvgnbmdwuzczhieyvdlruztrsycqp` (`siteId`),
  KEY `fk_fodddcduxozqrxuqrodkyzmcvwwcaratwbvi` (`draftId`),
  CONSTRAINT `fk_bjajmwevvgnbmdwuzczhieyvdlruztrsycqp` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_egazbanoqueexwucsskrjjdyjweemuzgmbzs` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fodddcduxozqrxuqrodkyzmcvwwcaratwbvi` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uuxlypmiijdvtkesvxtdjohbnqmhofuiklrf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lvhvubzczaezvjfrjsvbftfljrnjyylanaol` (`dateDeleted`),
  KEY `idx_iwziyqwcshmdmpfwzqpqwdliahzcklffpcin` (`fieldLayoutId`),
  KEY `idx_zwdjphhdqcxvvmvtgjphevarsubfzpcmdiyz` (`type`),
  KEY `idx_evxkhmlbbiytljclbtqzmunwrrshwmzzbcpl` (`enabled`),
  KEY `idx_ofajfewuhyaztatmeahmnqakjwhxyqdhlswo` (`canonicalId`),
  KEY `idx_qnepwjvmoxthgngsrkvzoduufoyzayiqyveu` (`archived`,`dateCreated`),
  KEY `idx_ffwoclyplbdzunxdphbcqushtgjsjsiyvkqy` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_tnrebhrwpiijjiyfscfdixgovnbqekohmqjk` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_ymtrlruplqanllgykyiouzixhwfqrtaghbbr` (`draftId`),
  KEY `fk_zrzlzxcngtkjwpwmgikemwmvuzoachkaxbpw` (`revisionId`),
  CONSTRAINT `fk_iejasxegepoluelmlswfpokglncvkqpjpzyw` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_roocjkmmkamtexavpavzbblmzgjdneqiweht` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ymtrlruplqanllgykyiouzixhwfqrtaghbbr` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zrzlzxcngtkjwpwmgikemwmvuzoachkaxbpw` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_mibkflpuwymgthervqcyjvhqjjnzfhmqddjh` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_owners`
--

DROP TABLE IF EXISTS `elements_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_owners` (
  `elementId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `fk_genvpvsrwcwwdvriixrgyvhgzpnjkqmhyofh` (`ownerId`),
  CONSTRAINT `fk_erlbbhwexapimmrfrpapcommihocwaytfdcb` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_genvpvsrwcwwdvriixrgyvhgzpnjkqmhyofh` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wcrgmetoqklnutygvaqzbpovmjudoeuncgla` (`elementId`,`siteId`),
  KEY `idx_tzztnnwltbcteyzvwqoqdnccqjepfmkzqbpc` (`siteId`),
  KEY `idx_hngfiveydygdarejlpbqagcuphldayqixmpx` (`title`,`siteId`),
  KEY `idx_dotgktuvnowavaibqlpipslzzjqfpilcdraz` (`slug`,`siteId`),
  KEY `idx_rjppmuydzsysvewscvjcafyrvglcroovgtyn` (`enabled`),
  KEY `idx_pdpxgbmdoadzvlkmsutadfdagunhxnfccpks` (`uri`,`siteId`),
  CONSTRAINT `fk_oamltdpslcyoldhvendedvqkbhkpsgtarfze` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xmutdamfiqjlbgrjfgzbbzozgzuvkcuzojnk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `status` enum('live','pending','expired') NOT NULL DEFAULT 'live',
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `deletedWithSection` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_nsklovyhraolmelthrdgvydxsvjfkzmitjrl` (`postDate`),
  KEY `idx_kseoklfcgfqwrwlxdthnrukcmiuhvrhsrtfj` (`expiryDate`),
  KEY `idx_xeqazvlzfybjpilloycniuzaniyzpazgngmj` (`sectionId`),
  KEY `idx_fefqsadlloqxguxtfmegvnimxcleoiqigsat` (`typeId`),
  KEY `idx_ebdmjwgrnwhhqythhxqczeczosbghecknnoh` (`primaryOwnerId`),
  KEY `idx_bveohtcpyqfeokgrkllihbxbdklqzpkpenmv` (`fieldId`),
  KEY `fk_yiwwwbzxanxpteobdrtyjecxzeqstnhpcgjp` (`parentId`),
  KEY `idx_ayjrtewzimqxehtxugojqkwigwdoawirmdlr` (`status`),
  CONSTRAINT `fk_adhtyvodomufyepeyajokvvgdyucjrrmrvjh` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nwnszxnbrhdlsysdmyateohiszzjihsuoosf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pqeepvpllpezhyiucpgbnqhemabvhefqdeft` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vmumtgiqfvxiynljvfptradxqcpcarekvhfd` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yiwwwbzxanxpteobdrtyjecxzeqstnhpcgjp` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yykapugguvraoyqxcqocuhysblugeneeczje` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries_authors`
--

DROP TABLE IF EXISTS `entries_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries_authors` (
  `entryId` int NOT NULL,
  `authorId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_cqwzcymbvhlfoxshahqvtpoxtxwmdbrbvdyg` (`authorId`),
  KEY `idx_gazryyfsdjwisrzydaxqtckgbxvhsaxqmond` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_ekiaxnzbwxkdmxgrmmchoppwdktlevchylqu` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rbduefisslzrlebbyussljuzcvrzuqztpxdm` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ltarjvkcntzrojiabzskksnhzarocvweayjs` (`fieldLayoutId`),
  KEY `idx_yckfrapwvusxelchxhlgadpuhqmoivrmizsg` (`dateDeleted`),
  CONSTRAINT `fk_pvozoogygpycigtyovuolcebejwlsxyueisk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_amnrmbzpnmtidwmqituufkuajigfflaabzyb` (`dateDeleted`),
  KEY `idx_mxfkumumjtgpbpslcdeqzgjhuqiglztdubtf` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qcwdvziymtprtjjnytcrnjuobpsvqwtiefnp` (`handle`,`context`),
  KEY `idx_kdzssxqctjxnlplfgwfjuaoimabapcpoejck` (`context`),
  KEY `idx_fskiszznoqglbjzgslviwlrxnkbcjjjmpygo` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ywhymagpaztlngbgzmuikwfmxuhjkjtdboro` (`name`),
  KEY `idx_ukygugaclxprdlmfjfmyljtzagxmnazovhsy` (`handle`),
  KEY `idx_xfyrcilwjduydahlapskdmhxjaaookoyzptq` (`fieldLayoutId`),
  KEY `idx_vbkyijspofyiyyqdhbvifvslxtwztyczmfit` (`sortOrder`),
  CONSTRAINT `fk_mcegapacbgvqhduaiomgyabsprtxfiojlttw` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vvxagxqbuqjqvybtpiieixnpnepxhcyntmjr` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jhmlylzhuovroqodtpwfdsqqnzdunkuuvqoy` (`accessToken`),
  UNIQUE KEY `idx_lussysbzxmehyohpkzwzdgjpzaiisdojxadi` (`name`),
  KEY `fk_nkeghcfxfldcdgiubujivkypkwuydwdprtrg` (`schemaId`),
  CONSTRAINT `fk_nkeghcfxfldcdgiubujivkypkwuydwdprtrg` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zjsypogmwtkrygbsjjneawlgkwphqpdebftf` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ktxllkanavwnwfmxbywrclxebhovryvogoow` (`name`),
  KEY `idx_ofwskvxthjejvxhwhiltwmkmmvzgoxrlehsn` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gtwbswcfszihgrvrlxbsacxflczicvucdeoa` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fhqhmgluwdqnhckglwiukmzlfuhoslzzzwiz` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_odmqrashuswapzmtwcsvfdgeapldwdektefi` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_qalordlbeojhesybyxydtsrpfvqotnpnubsk` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recoverycodes`
--

DROP TABLE IF EXISTS `recoverycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recoverycodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `recoveryCodes` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hijzxouqivejtkrsoafiahrfbdcxwfowplql` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_qimqyvtjgvnljthryblteccaeqskfofrxkgx` (`sourceId`),
  KEY `idx_tapbeinmdlexhwmtdvjgpgoegkzyhqhifote` (`targetId`),
  KEY `idx_crwtgmzvhtpqqwftaqnpxbihpbyotkqofpxz` (`sourceSiteId`),
  CONSTRAINT `fk_gmlcobohjimwqsivccrznfvblmvaytffcchh` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ktfcuqykjlykmbndkohdguubywvhjyxigmdt` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_uzedfmzxdwkpkfxuxopewwzbogcvanzldvko` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zvxdsaagzmcpsxwmhyekzsegyytxyujvlmij` (`canonicalId`,`num`),
  KEY `fk_nvcirrcclwyeqewjrbkcenzfclnevnjjwrsk` (`creatorId`),
  CONSTRAINT `fk_dxzubqcgqbeqdnzrcrrfntwwhznuggwlevee` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nvcirrcclwyeqewjrbkcenzfclnevnjjwrsk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_jqoyiipdhmbailcgxsrlvxbjtynuolgeajst` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindexqueue`
--

DROP TABLE IF EXISTS `searchindexqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindexqueue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `reserved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_olqylrjzluntrvdzmsasxiskoefnrtohmjth` (`elementId`,`siteId`,`reserved`),
  CONSTRAINT `fk_jbnrnwwymgduphhkjmbmcsnwnalmoaevbiss` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindexqueue_fields`
--

DROP TABLE IF EXISTS `searchindexqueue_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindexqueue_fields` (
  `jobId` int NOT NULL,
  `fieldHandle` varchar(255) NOT NULL,
  PRIMARY KEY (`jobId`,`fieldHandle`),
  UNIQUE KEY `idx_royumuullnipgbsffpapgkkovawzeufgacvm` (`jobId`,`fieldHandle`),
  CONSTRAINT `fk_dvmkhdpzahmdutslrkypohfhrwvokzqyzebg` FOREIGN KEY (`jobId`) REFERENCES `searchindexqueue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint unsigned DEFAULT NULL,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kiohixgvitbyiywwwizfnbddvanwooxodnzm` (`handle`),
  KEY `idx_vbxshymhefekmwnofegtphfkpyyacvscdoaw` (`name`),
  KEY `idx_xseuublqrcnmtftadjyaojguiwrznljfzkvp` (`structureId`),
  KEY `idx_qlxegfpnxqwsjjurqgpihayamjetrgbsxxxf` (`dateDeleted`),
  CONSTRAINT `fk_fiabmwxbkhhruekkxkmamvmekzfijjhyjkst` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_entrytypes`
--

DROP TABLE IF EXISTS `sections_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_entrytypes` (
  `sectionId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_hcotjmdzyzxfuvgqiktknvirdbniqujhqzrv` (`typeId`),
  CONSTRAINT `fk_hcotjmdzyzxfuvgqiktknvirdbniqujhqzrv` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_umhctdkbzydiqdbullsrnrkqpnxpqhhgouez` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jkionlucfpksmhikjgxvtfrmcncwoaavlyov` (`sectionId`,`siteId`),
  KEY `idx_wmzsciaqolyshjxvvqnwukqjmcrcpytllhlp` (`siteId`),
  CONSTRAINT `fk_mkpeldqlmvtrkyxotvxzwedizironxqvzlsg` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wimudhjtoryrqcahvjyfqacayqdztqzuoovq` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ywfacyckluzhtyqnzongqjqtjuncxsuienmu` (`uid`),
  KEY `idx_myororeynlcqkftumjufyadrcboqhfszqezc` (`token`),
  KEY `idx_zojoktmwmlhxlxjkbxoyldnrwhgxdnhihock` (`dateUpdated`),
  KEY `idx_zdkucqykqnlqkmxgkpgpcxaeltvkpxrabntr` (`userId`),
  CONSTRAINT `fk_atmyoaqjuztijhlrczsloxadmlmzdeureubf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hdyyhmunlvwmwooqzpjdnjpforqmwtaucuqf` (`userId`,`message`),
  CONSTRAINT `fk_vkpabqlgqqehilzcmlieyprxjipfzlfmflhw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nzbpleviqttzgghhwmhbmgtinadzdybrkwdp` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ripvxvxwuyfrlebtnbzumnphbwbkjnatyfas` (`dateDeleted`),
  KEY `idx_tkbwwjxijmmunfrlebzazpnqibirqikmpykr` (`handle`),
  KEY `idx_tvkevnjowiyqorfinlgvoydbrfppgckzjpos` (`sortOrder`),
  KEY `fk_xlxjkufshxrilriqkekjcxpziuekpkajplyk` (`groupId`),
  CONSTRAINT `fk_xlxjkufshxrilriqkekjcxpziuekpkajplyk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sso_identities`
--

DROP TABLE IF EXISTS `sso_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sso_identities` (
  `provider` varchar(255) NOT NULL,
  `identityId` varchar(255) NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`provider`,`identityId`,`userId`),
  KEY `fk_pzojtykkxjtmimvaowwejsnyxtqclirdunyc` (`userId`),
  CONSTRAINT `fk_pzojtykkxjtmimvaowwejsnyxtqclirdunyc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cqiuyjhjeatgglsgltpwbygtdmfvtsovfram` (`structureId`,`elementId`),
  KEY `idx_vuwruouhwmcaquymnilmhszbyqbhrdtwdbxs` (`root`),
  KEY `idx_vwjjrzwyzuguemkxsycnpcrhxglwlpkwgbra` (`lft`),
  KEY `idx_fczdrxvkfrlqrlsaattjzfkahcjiguebvyjm` (`rgt`),
  KEY `idx_wtvguooflxnzmehwnxwrvgjgaducjteepwjw` (`level`),
  KEY `idx_iekqczpzhtptzccxbhhzkcoiaoobiqhbzsho` (`elementId`),
  CONSTRAINT `fk_awfalvgybsrgyilizjmuliywyopdhmdyscbw` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mmcyzfpldywtyuborzookryufjqthhkcosqv` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xhhkaqlrdwjfwbjuykhimblrgsnicnvixgoc` (`key`,`language`),
  KEY `idx_qupouldlnjwrtmxolvhrqbwqlbzunwiekirk` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eltkwrydrkwscaxgnkkxowkkuzfmzyepzfmn` (`name`),
  KEY `idx_akeoiihaifdtffmoigcebbhqgqinduoktsdm` (`handle`),
  KEY `idx_rtwplcugajeddyjauvoywfitpqzymjqdzrio` (`dateDeleted`),
  KEY `fk_bweyqcuwbivkwsqujvrmkmyvnoyyajhsbhmy` (`fieldLayoutId`),
  CONSTRAINT `fk_bweyqcuwbivkwsqujvrmkmyvnoyyajhsbhmy` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_brcfaqzbcghbitbemuvkqtjsjmjgdeyljobw` (`groupId`),
  CONSTRAINT `fk_jqxttzawqtcuzvemrnxcnnqhnzzorwoxrxar` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nhqxnmsnmwsqfakoozxkrgtzmlyjgcaiwblh` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ffemoikxeyflajmjmelpwktxxdnchruzszzk` (`token`),
  KEY `idx_srozewluqlzwfexkmhuokgrcwpdrsmhkkyhw` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qjzfirsqtrdydjmsybvorbedjbcyuuyjwkfe` (`handle`),
  KEY `idx_nisrpjhpocokvgvwutmcwzlwzpctxzerkgis` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zmodyxqeokkuinlbzlihmdufxqohrzdxofvj` (`groupId`,`userId`),
  KEY `idx_srsqnrlljibepnhrqmfuhyxgnhuynhnfehve` (`userId`),
  CONSTRAINT `fk_arpgayuxttgetqonbrmtyyuyuhpmkmorbezl` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gamuybzdxaazxevblcarkmrkfwfrazmkpord` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pfiaaiqzkeyptrydemzitcnmoqgodaaaxsfs` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_piloxguftvucnjlhgheudigyufputsqflpfz` (`permissionId`,`groupId`),
  KEY `idx_orbroffgtdbjdkakowfdzpemztobcgmhkczx` (`groupId`),
  CONSTRAINT `fk_hjntwcdvnucbskxhooausjjheoqbdzosdbkz` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ijkepwqowztiwkpdzqqobfeamzroqfubjuia` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_izrtqydjbyxddeephaktpcdvkkccldfpiivr` (`permissionId`,`userId`),
  KEY `idx_mbgzjeetdenvpsartcgyzmtcoovbkkkwnmnz` (`userId`),
  CONSTRAINT `fk_cjdfstdyiklsgdsnwqxcnkchseehxlypwcis` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fmgnmzrpnphxetmrysymmixtzjowucowvbcw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` json DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_beufovgkgrixdgpmjcceflvaplyllampstwb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `affiliatedSiteId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_bnuckwdhqnizramwmtqckwifrnujzkzzcmwp` (`active`),
  KEY `idx_lvtalmkqgdsgjzabbzngnguamucedpwpibip` (`locked`),
  KEY `idx_mgjcvpnhhapuwmkirqupqufsbeuyftmuevec` (`pending`),
  KEY `idx_mtixoctyqvvmzqthzhywsfevodyhkdqryjsc` (`suspended`),
  KEY `idx_klgortqcgakjrlcbxvjoynfgfagxiszuubnb` (`verificationCode`),
  KEY `idx_lelnkegfognxrlwceytrswemsnhedcdpuotl` (`email`),
  KEY `idx_vyfgybyuvbhiyqoqreivbxmgzluonezqpvkq` (`username`),
  KEY `fk_hstumdfemdyvpuatyrkwhcxdlodnfuwwqchx` (`photoId`),
  KEY `fk_tqvcpyslrlrhzoizgfnnohnruwapxtkjzuuu` (`affiliatedSiteId`),
  CONSTRAINT `fk_hhsaoexujaysemogyckmyfspxjcvdajcjzvm` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hstumdfemdyvpuatyrkwhcxdlodnfuwwqchx` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tqvcpyslrlrhzoizgfnnohnruwapxtkjzuuu` FOREIGN KEY (`affiliatedSiteId`) REFERENCES `sites` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qxpejjertampbxvyxgtcznuzmemjooaukvra` (`name`,`parentId`,`volumeId`),
  KEY `idx_tkfbavbohuxotduxyrwzygkerlemmbejkgli` (`parentId`),
  KEY `idx_pldwvbnwyjousbfgelqeeltotgvlejratubu` (`volumeId`),
  CONSTRAINT `fk_lcrwdbolgppgrezsegldivbztmosiqedxywu` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tnpmngbxddqmoubolobmoztwvlnjhrxvmggz` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hwpifpkyktzxiecvzdlikckbnviinvjapcnf` (`name`),
  KEY `idx_xdfxbhxgdwvffmvjqaryxcpupsbuwzinkesa` (`handle`),
  KEY `idx_uepyoasxkriwiwmekzemkkzgwqgmqfrdypxm` (`fieldLayoutId`),
  KEY `idx_pkxfabsaryyantpccrdgfnrprvklhfsaxetm` (`dateDeleted`),
  CONSTRAINT `fk_enrddxhbpoewqkemdyhfypqoxuxstssajucz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webauthn`
--

DROP TABLE IF EXISTS `webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webauthn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_ffvrdyjvxdapaitndfvnkfhbbfqywjyrzdvs` (`userId`),
  CONSTRAINT `fk_ffvrdyjvxdapaitndfvnkfhbbfqywjyrzdvs` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_prcbyvpxndcjhvgswolvvyvccoeqosfwdxyu` (`userId`),
  CONSTRAINT `fk_wzwfsqnnuysvbdjcwkqfyxtfflzedevguykt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-02 19:13:53
-- MariaDB dump 10.19  Distrib 10.6.14-MariaDB, for Linux (aarch64)
--
-- Host: mysql    Database: project
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES (25,3,5,NULL,'ryan.jpg','image/jpeg','image',NULL,400,400,37416,NULL,NULL,NULL,'2025-08-26 21:31:50','2025-08-26 21:31:50','2025-08-26 21:31:50'),(26,1,1,1,'golden-retriever.jpg','image/jpeg','image',NULL,3840,2880,674288,NULL,0,0,'2025-08-28 06:21:44','2025-08-28 06:21:44','2025-08-28 06:21:44'),(29,1,1,1,'golden-retriever.jpeg','image/jpeg','image',NULL,3000,4500,1247997,NULL,NULL,NULL,'2025-08-28 06:24:32','2025-08-28 06:24:32','2025-08-28 06:24:32'),(35,1,1,1,'mochi.jpg','image/jpeg','image',NULL,2392,2500,419467,NULL,NULL,NULL,'2025-08-31 20:10:15','2025-08-31 20:10:15','2025-08-31 20:10:15'),(37,1,1,1,'poppy.jpeg','image/jpeg','image',NULL,554,554,32177,NULL,NULL,NULL,'2025-08-31 20:10:41','2025-08-31 20:10:41','2025-08-31 20:10:41'),(40,1,1,1,'turbo.jpeg','image/jpeg','image',NULL,554,554,19265,NULL,NULL,NULL,'2025-08-31 20:11:40','2025-08-31 20:11:40','2025-08-31 20:11:40'),(43,1,1,1,'luna.jpeg','image/jpeg','image',NULL,678,452,25254,NULL,NULL,NULL,'2025-08-31 20:12:25','2025-08-31 20:12:25','2025-08-31 20:12:25');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets_sites`
--

LOCK TABLES `assets_sites` WRITE;
/*!40000 ALTER TABLE `assets_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets_sites` VALUES (25,1,NULL),(26,1,NULL),(29,1,NULL),(35,1,NULL),(37,1,NULL),(40,1,NULL),(43,1,NULL);
/*!40000 ALTER TABLE `assets_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `authenticator`
--

LOCK TABLES `authenticator` WRITE;
/*!40000 ALTER TABLE `authenticator` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `authenticator` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `bulkopevents`
--

LOCK TABLES `bulkopevents` WRITE;
/*!40000 ALTER TABLE `bulkopevents` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `bulkopevents` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (1,1,'fieldLayoutId','2025-08-26 21:31:50',0,1),(1,1,'photoId','2025-08-26 21:31:50',0,1),(5,1,'slug','2025-07-26 02:19:19',0,1),(5,1,'title','2025-07-26 02:19:19',0,1),(5,1,'uri','2025-07-26 02:19:19',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (1,1,7,'3509545b-9a30-454e-b562-b40e40b7974e','2025-08-27 04:14:37',0,1),(1,1,7,'a71c6ea8-c78e-4d7c-89b7-2f0ce6dc5bdc','2025-08-27 04:14:37',0,1),(1,1,7,'ce0aa57c-63e6-4f62-ad39-252ee24c0e17','2025-08-27 04:14:37',0,1),(1,1,7,'d8577821-9a6c-4fac-8bba-2e9a1b04b04c','2025-08-27 04:14:37',0,1),(1,1,7,'d911c669-4180-42bc-9682-ebd71c67b30d','2025-08-27 04:14:37',0,1),(1,1,7,'e05bbaef-4bc3-4348-9ea6-729bd63198d4','2025-08-27 04:14:37',0,1),(5,1,8,'51c630ec-b1de-4eb4-a3d3-30b16be38dcb','2025-07-26 02:19:19',0,1),(6,1,7,'3912bf87-a6e5-4ebe-ac6c-bdeab74128f6','2025-07-26 02:19:17',0,1),(6,1,7,'8fe35a49-21a9-4f52-82ce-efcf64b139e7','2025-07-26 02:19:19',0,1),(6,1,7,'b7af6ca8-8362-416e-b1e2-f12f6550c125','2025-07-26 02:19:13',0,1),(7,1,5,'0a444691-aa81-4e8b-b3af-3c1119e2ea77','2025-08-28 06:24:38',0,1),(7,1,7,'7967d421-353a-4321-803c-186bc8dafdf8','2025-08-31 20:09:19',0,1),(7,1,7,'d57c505d-6dcf-4aff-af6c-53a4ab0fc486','2025-08-31 20:09:19',0,1),(7,1,7,'dbdeb7b3-0f32-4819-ae12-8ae63a74f497','2025-08-31 20:09:19',0,1),(7,1,7,'e664588c-e2dd-465e-91a9-87bffa8d767c','2025-08-31 20:09:19',0,1),(7,1,7,'facda6a8-6d50-4687-acdd-8a79356b701c','2025-08-31 20:09:19',0,1),(7,1,7,'fd12bed9-3a23-45ab-b243-4a4c1cc1cbaa','2025-08-31 20:09:19',0,1),(9,1,5,'0a444691-aa81-4e8b-b3af-3c1119e2ea77','2025-08-31 20:10:17',0,1),(9,1,7,'7967d421-353a-4321-803c-186bc8dafdf8','2025-08-31 20:10:17',0,1),(9,1,7,'d57c505d-6dcf-4aff-af6c-53a4ab0fc486','2025-08-31 20:10:17',0,1),(9,1,7,'dbdeb7b3-0f32-4819-ae12-8ae63a74f497','2025-08-31 20:10:17',0,1),(9,1,7,'e664588c-e2dd-465e-91a9-87bffa8d767c','2025-08-31 20:10:17',0,1),(9,1,7,'facda6a8-6d50-4687-acdd-8a79356b701c','2025-08-31 20:10:17',0,1),(9,1,7,'fd12bed9-3a23-45ab-b243-4a4c1cc1cbaa','2025-08-31 20:10:17',0,1),(11,1,5,'0a444691-aa81-4e8b-b3af-3c1119e2ea77','2025-08-31 20:10:57',0,1),(11,1,7,'7967d421-353a-4321-803c-186bc8dafdf8','2025-08-31 20:10:57',0,1),(11,1,7,'d57c505d-6dcf-4aff-af6c-53a4ab0fc486','2025-08-31 20:10:57',0,1),(11,1,7,'dbdeb7b3-0f32-4819-ae12-8ae63a74f497','2025-08-31 20:10:57',0,1),(11,1,7,'e664588c-e2dd-465e-91a9-87bffa8d767c','2025-08-31 20:10:57',0,1),(11,1,7,'facda6a8-6d50-4687-acdd-8a79356b701c','2025-08-31 20:10:57',0,1),(11,1,7,'fd12bed9-3a23-45ab-b243-4a4c1cc1cbaa','2025-08-31 20:10:57',0,1),(13,1,1,'ec3a66a7-84f6-4d7a-85d9-8bcb3b3b531e','2025-07-26 02:58:32',0,1),(13,1,2,'b77c3d63-b216-4288-8a42-20da3df3750a','2025-07-26 02:58:32',0,1),(13,1,3,'0ca1a21c-b29e-4b60-807e-02334f79818b','2025-07-26 02:58:32',0,1),(13,1,4,'9ef533ee-5483-4028-bb5e-1e952b04874c','2025-07-26 02:58:32',0,1),(13,1,5,'0a444691-aa81-4e8b-b3af-3c1119e2ea77','2025-08-31 20:11:56',0,1),(13,1,7,'7967d421-353a-4321-803c-186bc8dafdf8','2025-08-31 20:11:56',0,1),(13,1,7,'d57c505d-6dcf-4aff-af6c-53a4ab0fc486','2025-08-31 20:11:56',0,1),(13,1,7,'dbdeb7b3-0f32-4819-ae12-8ae63a74f497','2025-08-31 20:11:56',0,1),(13,1,7,'e664588c-e2dd-465e-91a9-87bffa8d767c','2025-08-31 20:11:56',0,1),(13,1,7,'facda6a8-6d50-4687-acdd-8a79356b701c','2025-08-31 20:11:56',0,1),(13,1,7,'fd12bed9-3a23-45ab-b243-4a4c1cc1cbaa','2025-08-31 20:11:56',0,1),(13,1,8,'51c630ec-b1de-4eb4-a3d3-30b16be38dcb','2025-07-26 02:58:32',0,1),(15,1,5,'0a444691-aa81-4e8b-b3af-3c1119e2ea77','2025-08-31 20:12:41',0,1),(15,1,7,'7967d421-353a-4321-803c-186bc8dafdf8','2025-08-31 20:12:41',0,1),(15,1,7,'d57c505d-6dcf-4aff-af6c-53a4ab0fc486','2025-08-31 20:12:41',0,1),(15,1,7,'dbdeb7b3-0f32-4819-ae12-8ae63a74f497','2025-08-31 20:12:41',0,1),(15,1,7,'e664588c-e2dd-465e-91a9-87bffa8d767c','2025-08-31 20:12:41',0,1),(15,1,7,'facda6a8-6d50-4687-acdd-8a79356b701c','2025-08-31 20:12:41',0,1),(15,1,7,'fd12bed9-3a23-45ab-b243-4a4c1cc1cbaa','2025-08-31 20:12:41',0,1),(18,1,7,'3912bf87-a6e5-4ebe-ac6c-bdeab74128f6','2025-07-26 02:58:32',0,1),(18,1,7,'7c6fe52d-8e4f-4678-8872-d84bd3fc4e6e','2025-07-26 02:58:32',0,1),(18,1,7,'8f6071b8-a55a-489d-ae97-fc5b9d7b2e7c','2025-07-26 02:58:32',0,1),(18,1,7,'8fe35a49-21a9-4f52-82ce-efcf64b139e7','2025-07-26 02:58:32',0,1),(18,1,7,'a1a7624b-d859-4339-8e40-c4e3b8a0f133','2025-07-26 02:58:32',0,1),(18,1,7,'b3ac931f-c2bc-4008-8e00-983639565f46','2025-07-26 02:58:32',0,1),(18,1,7,'b7af6ca8-8362-416e-b1e2-f12f6550c125','2025-07-26 02:58:32',0,1),(18,1,7,'db610d3d-a13b-4bd5-bd67-7229a0a7866b','2025-07-26 02:58:32',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `contentblocks`
--

LOCK TABLES `contentblocks` WRITE;
/*!40000 ALTER TABLE `contentblocks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `contentblocks` VALUES (6,5,8),(17,7,8),(18,13,8),(20,19,8),(22,21,8);
/*!40000 ALTER TABLE `contentblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `drafts` VALUES (1,NULL,1,0,'First draft',NULL,0,NULL,0),(2,NULL,1,0,'First draft','',0,NULL,1);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES (1,1,1,NULL,'save','2025-08-27 04:14:37'),(1,1,1,NULL,'view','2025-08-27 04:14:34'),(5,1,1,NULL,'save','2025-07-26 02:19:19'),(5,1,1,NULL,'view','2025-08-31 20:12:43'),(7,1,1,NULL,'edit','2025-08-31 20:09:18'),(7,1,1,NULL,'save','2025-08-31 20:09:19'),(7,1,1,NULL,'view','2025-08-31 21:08:09'),(9,1,1,NULL,'edit','2025-08-31 20:10:15'),(9,1,1,NULL,'save','2025-08-31 20:10:17'),(9,1,1,NULL,'view','2025-08-31 20:10:02'),(11,1,1,NULL,'edit','2025-08-31 20:10:55'),(11,1,1,NULL,'save','2025-08-31 20:10:57'),(11,1,1,NULL,'view','2025-08-31 21:25:55'),(13,1,1,NULL,'edit','2025-08-31 20:11:54'),(13,1,1,NULL,'save','2025-08-31 20:11:56'),(13,1,1,NULL,'view','2025-09-01 00:53:12'),(15,1,1,NULL,'edit','2025-08-31 20:12:40'),(15,1,1,NULL,'save','2025-08-31 20:12:41'),(15,1,1,NULL,'view','2025-08-31 20:12:28');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,6,'craft\\elements\\User',1,0,'2025-07-26 00:39:20','2025-08-27 04:14:37',NULL,NULL,NULL,'79ada69d-3a2e-4cb5-a9a1-c883a40bfe78'),(2,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-07-26 01:19:19','2025-08-11 20:43:43',NULL,NULL,NULL,'1ca8165b-bbdc-4c3d-a815-e282ffb306b6'),(3,2,NULL,1,3,'craft\\elements\\Entry',1,0,'2025-07-26 01:19:19','2025-07-26 01:19:20',NULL,NULL,NULL,'c0f55837-5c78-45c3-b53c-4abfad37f7a8'),(4,NULL,1,NULL,1,'craft\\elements\\Entry',1,0,'2025-07-26 01:31:09','2025-07-26 01:31:09',NULL,NULL,NULL,'84753e37-ce91-4d1f-9c62-5b3fe472a8d3'),(5,NULL,2,NULL,1,'craft\\elements\\Entry',1,0,'2025-07-26 02:18:34','2025-08-31 20:12:52',NULL,'2025-08-31 20:12:52',NULL,'87b99e30-fa46-437e-afcb-98aca73ddfe7'),(6,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2025-07-26 02:18:34','2025-07-26 02:19:19',NULL,NULL,NULL,'0d2e8a71-c23b-4ae5-8e38-02b5584b69c4'),(7,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-07-26 02:47:42','2025-08-31 20:09:19',NULL,NULL,NULL,'a3534dfb-7c8e-4c5c-9440-60cb22bff43b'),(8,7,NULL,2,1,'craft\\elements\\Entry',1,0,'2025-07-26 02:47:42','2025-07-26 02:47:42',NULL,NULL,NULL,'b235f20c-6613-476d-bbb0-fc12cc8913e2'),(9,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-07-26 02:47:42','2025-08-31 20:10:17',NULL,NULL,NULL,'27109544-5747-4e81-8943-315563796983'),(10,9,NULL,3,1,'craft\\elements\\Entry',1,0,'2025-07-26 02:47:42','2025-07-26 02:47:42',NULL,NULL,NULL,'ede6a59c-8bc1-4020-8152-4ba459255826'),(11,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-07-26 02:47:42','2025-08-31 20:10:57',NULL,NULL,NULL,'e7f3c151-9740-4d03-961e-ad271763ec2d'),(12,11,NULL,4,1,'craft\\elements\\Entry',1,0,'2025-07-26 02:47:42','2025-07-26 02:47:42',NULL,NULL,NULL,'a9523e49-5728-4ac1-a834-05780267ae18'),(13,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-07-26 02:47:42','2025-08-31 20:11:56',NULL,NULL,NULL,'bc9c124f-1c9e-4a15-aca4-4e3bba24200f'),(14,13,NULL,5,1,'craft\\elements\\Entry',1,0,'2025-07-26 02:47:42','2025-07-26 02:47:42',NULL,NULL,NULL,'36bcae4c-522f-41fa-875a-f11605c8bfa8'),(15,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-07-26 02:47:42','2025-08-31 20:12:41',NULL,NULL,NULL,'b1f42ed2-5640-4f0d-a910-dd737d45dd16'),(16,15,NULL,6,1,'craft\\elements\\Entry',1,0,'2025-07-26 02:47:42','2025-07-26 02:47:42',NULL,NULL,NULL,'899811ee-787e-43b4-a494-69b34eca0ba9'),(17,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2025-07-26 02:47:47','2025-07-26 02:47:47',NULL,NULL,NULL,'9b55f536-5c9d-48ee-815a-305a0a5238f7'),(18,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2025-07-26 02:56:25','2025-07-26 02:58:32',NULL,NULL,NULL,'8c8430a4-9da7-4701-9478-5ec3079ef666'),(19,13,NULL,7,1,'craft\\elements\\Entry',1,0,'2025-07-26 02:56:25','2025-07-26 02:56:25',NULL,NULL,NULL,'5f390421-f101-48ff-9876-be44d7d81ef7'),(20,18,NULL,8,NULL,'craft\\elements\\ContentBlock',1,0,'2025-07-26 02:56:25','2025-07-26 02:56:25',NULL,NULL,NULL,'5d364664-396f-45b6-9b27-7bf1591f1b18'),(21,13,NULL,9,1,'craft\\elements\\Entry',1,0,'2025-07-26 02:58:32','2025-07-26 02:58:32',NULL,NULL,NULL,'688d1e19-7faa-4b04-8fe1-82d21c8eda78'),(22,18,NULL,10,NULL,'craft\\elements\\ContentBlock',1,0,'2025-07-26 02:58:32','2025-07-26 02:58:32',NULL,NULL,NULL,'0da68e73-e35d-4329-ac79-7b228326b7f3'),(24,2,NULL,11,3,'craft\\elements\\Entry',1,0,'2025-08-11 20:43:43','2025-08-11 20:43:43',NULL,NULL,NULL,'43c5e980-3a43-4fb8-b910-403ae86b753e'),(25,NULL,NULL,NULL,8,'craft\\elements\\Asset',1,0,'2025-08-26 21:31:50','2025-08-26 21:31:50',NULL,NULL,NULL,'c71c88bf-3808-4557-8dc0-c6cedf6d9a0b'),(26,NULL,NULL,NULL,5,'craft\\elements\\Asset',1,0,'2025-08-28 06:21:44','2025-08-28 06:52:30',NULL,'2025-08-28 06:52:30',NULL,'5d473b64-8f69-4969-bee9-ff6d5245e848'),(28,7,NULL,12,1,'craft\\elements\\Entry',1,0,'2025-08-28 06:21:46','2025-08-28 06:21:46',NULL,NULL,NULL,'049dc33e-49b6-4fa0-aa24-24fbecdf1bc9'),(29,NULL,NULL,NULL,5,'craft\\elements\\Asset',1,0,'2025-08-28 06:24:32','2025-08-28 06:24:32',NULL,NULL,NULL,'27a7135c-9ce8-4460-bb2f-29a48d10b862'),(31,7,NULL,13,1,'craft\\elements\\Entry',1,0,'2025-08-28 06:24:38','2025-08-28 06:24:38',NULL,NULL,NULL,'814f5491-2a8d-42ae-ab92-08d0141d09fa'),(33,7,NULL,14,1,'craft\\elements\\Entry',1,0,'2025-08-31 20:09:19','2025-08-31 20:09:19',NULL,NULL,NULL,'2c5cf27a-31bf-4691-8a26-e7524228bc18'),(35,NULL,NULL,NULL,5,'craft\\elements\\Asset',1,0,'2025-08-31 20:10:15','2025-08-31 20:10:15',NULL,NULL,NULL,'2d5ec501-af6a-46dd-9255-4f917674a64c'),(36,9,NULL,15,1,'craft\\elements\\Entry',1,0,'2025-08-31 20:10:17','2025-08-31 20:10:17',NULL,NULL,NULL,'05916d81-73ad-4490-8bbe-d7d3b70e6b35'),(37,NULL,NULL,NULL,5,'craft\\elements\\Asset',1,0,'2025-08-31 20:10:41','2025-08-31 20:10:41',NULL,NULL,NULL,'cd061696-6a59-4b1a-9ca3-4504ed48e322'),(39,11,NULL,16,1,'craft\\elements\\Entry',1,0,'2025-08-31 20:10:57','2025-08-31 20:10:57',NULL,NULL,NULL,'88827656-8996-4c5f-a5c0-7eafb6064b11'),(40,NULL,NULL,NULL,5,'craft\\elements\\Asset',1,0,'2025-08-31 20:11:40','2025-08-31 20:11:40',NULL,NULL,NULL,'0ad1a11d-7f67-424f-81c6-1abacfc79566'),(42,13,NULL,17,1,'craft\\elements\\Entry',1,0,'2025-08-31 20:11:56','2025-08-31 20:11:56',NULL,NULL,NULL,'4d8025c1-f4d6-41a8-88ed-92c16288d12f'),(43,NULL,NULL,NULL,5,'craft\\elements\\Asset',1,0,'2025-08-31 20:12:25','2025-08-31 20:12:25',NULL,NULL,NULL,'36b65bb5-2384-43ca-b4f3-e985348be613'),(45,15,NULL,18,1,'craft\\elements\\Entry',1,0,'2025-08-31 20:12:41','2025-08-31 20:12:41',NULL,NULL,NULL,'5f91d777-cb1e-43c4-a1c5-c3abe0459c84');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_bulkops`
--

LOCK TABLES `elements_bulkops` WRITE;
/*!40000 ALTER TABLE `elements_bulkops` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_bulkops` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_owners`
--

LOCK TABLES `elements_owners` WRITE;
/*!40000 ALTER TABLE `elements_owners` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_owners` VALUES (6,5,1),(17,7,1),(18,13,1),(20,19,1),(22,21,1);
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,NULL,'{\"3509545b-9a30-454e-b562-b40e40b7974e\": 4, \"a71c6ea8-c78e-4d7c-89b7-2f0ce6dc5bdc\": 0, \"ce0aa57c-63e6-4f62-ad39-252ee24c0e17\": 4, \"d8577821-9a6c-4fac-8bba-2e9a1b04b04c\": 4, \"d911c669-4180-42bc-9682-ebd71c67b30d\": 4, \"e05bbaef-4bc3-4348-9ea6-729bd63198d4\": 3}',1,'2025-07-26 00:39:20','2025-08-27 04:14:37','4b92b17f-50fe-4c41-b921-9072c0ef1b50'),(2,2,1,'Homepage','homepage','__home__',NULL,1,'2025-07-26 01:19:19','2025-07-26 01:19:19','4dfa0778-c86e-430a-887d-f125a508453e'),(3,3,1,'Homepage','homepage','__home__',NULL,1,'2025-07-26 01:19:20','2025-07-26 01:19:20','d11542d3-5181-4d32-983e-77467e6db021'),(4,4,1,NULL,'__temp_ecjgamvhfvbouwfucidvrqothlikslmrchvv','pawmates/__temp_ecjgamvhfvbouwfucidvrqothlikslmrchvv','{\"0ca1a21c-b29e-4b60-807e-02334f79818b\": false}',1,'2025-07-26 01:31:09','2025-07-26 01:31:09','72f9a307-c19b-4da2-9c81-548013d4521a'),(5,5,1,NULL,'__temp_lbvokvnnytcoozxznyomyopjgsnfaozyiyom','pawmates/__temp_lbvokvnnytcoozxznyomyopjgsnfaozyiyom','{\"0ca1a21c-b29e-4b60-807e-02334f79818b\": false}',1,'2025-07-26 02:18:34','2025-07-26 02:19:19','0ce49f09-c665-4ea9-a4b5-551ecd82df3e'),(6,6,1,NULL,NULL,NULL,'{\"3912bf87-a6e5-4ebe-ac6c-bdeab74128f6\": 0, \"7c6fe52d-8e4f-4678-8872-d84bd3fc4e6e\": 0, \"8f6071b8-a55a-489d-ae97-fc5b9d7b2e7c\": 0, \"8fe35a49-21a9-4f52-82ce-efcf64b139e7\": 0, \"a1a7624b-d859-4339-8e40-c4e3b8a0f133\": 0, \"b3ac931f-c2bc-4008-8e00-983639565f46\": 0, \"b7af6ca8-8362-416e-b1e2-f12f6550c125\": 0, \"db610d3d-a13b-4bd5-bd67-7229a0a7866b\": 0}',1,'2025-07-26 02:18:34','2025-07-26 02:19:19','135643db-ce2f-4d54-8590-73f91409c26b'),(7,7,1,'Maple','maple','pawmates/maple','{\"0a444691-aa81-4e8b-b3af-3c1119e2ea77\": [29], \"0ca1a21c-b29e-4b60-807e-02334f79818b\": true, \"7967d421-353a-4321-803c-186bc8dafdf8\": 9, \"9ef533ee-5483-4028-bb5e-1e952b04874c\": \"A gentle golden retriever who loves cuddles and sunbathing.\", \"b77c3d63-b216-4288-8a42-20da3df3750a\": \"female\", \"d57c505d-6dcf-4aff-af6c-53a4ab0fc486\": 3, \"dbdeb7b3-0f32-4819-ae12-8ae63a74f497\": 3, \"e664588c-e2dd-465e-91a9-87bffa8d767c\": 7, \"ec3a66a7-84f6-4d7a-85d9-8bcb3b3b531e\": 3, \"facda6a8-6d50-4687-acdd-8a79356b701c\": 3, \"fd12bed9-3a23-45ab-b243-4a4c1cc1cbaa\": 7}',1,'2025-07-26 02:47:42','2025-08-31 20:09:19','163dec9b-fa05-4927-86ec-ead38ee8ff3e'),(8,8,1,'Maple','maple','pawmates/maple','{\"0ca1a21c-b29e-4b60-807e-02334f79818b\": true, \"9ef533ee-5483-4028-bb5e-1e952b04874c\": \"A gentle golden retriever who loves cuddles and sunbathing.\", \"b77c3d63-b216-4288-8a42-20da3df3750a\": \"female\", \"ec3a66a7-84f6-4d7a-85d9-8bcb3b3b531e\": 3}',1,'2025-07-26 02:47:42','2025-07-26 02:47:42','16ecd5c9-3fc7-4f73-8f3c-5da4d0669139'),(9,9,1,'Mochi','mochi','pawmates/mochi','{\"0a444691-aa81-4e8b-b3af-3c1119e2ea77\": [35], \"0ca1a21c-b29e-4b60-807e-02334f79818b\": true, \"7967d421-353a-4321-803c-186bc8dafdf8\": 2, \"9ef533ee-5483-4028-bb5e-1e952b04874c\": \"A mischievous cat who prefers high shelves and soft blankets.\", \"b77c3d63-b216-4288-8a42-20da3df3750a\": \"male\", \"d57c505d-6dcf-4aff-af6c-53a4ab0fc486\": 7, \"dbdeb7b3-0f32-4819-ae12-8ae63a74f497\": 8, \"e664588c-e2dd-465e-91a9-87bffa8d767c\": 8, \"ec3a66a7-84f6-4d7a-85d9-8bcb3b3b531e\": 1, \"facda6a8-6d50-4687-acdd-8a79356b701c\": 8, \"fd12bed9-3a23-45ab-b243-4a4c1cc1cbaa\": 1}',1,'2025-07-26 02:47:42','2025-08-31 20:10:17','bc1010d5-37f9-417b-80b3-abecea0932ae'),(10,10,1,'Mochi','mochi','pawmates/mochi','{\"0ca1a21c-b29e-4b60-807e-02334f79818b\": true, \"9ef533ee-5483-4028-bb5e-1e952b04874c\": \"A mischievous cat who prefers high shelves and soft blankets.\", \"b77c3d63-b216-4288-8a42-20da3df3750a\": \"male\", \"ec3a66a7-84f6-4d7a-85d9-8bcb3b3b531e\": 1}',1,'2025-07-26 02:47:42','2025-07-26 02:47:42','a62f6940-3065-4f66-ac5f-16ddd732c3af'),(11,11,1,'Poppy','poppy','pawmates/poppy','{\"0a444691-aa81-4e8b-b3af-3c1119e2ea77\": [37], \"0ca1a21c-b29e-4b60-807e-02334f79818b\": false, \"7967d421-353a-4321-803c-186bc8dafdf8\": 1, \"9ef533ee-5483-4028-bb5e-1e952b04874c\": \"A curious lop-eared bunny who loves kale and quiet mornings.\", \"b77c3d63-b216-4288-8a42-20da3df3750a\": \"female\", \"d57c505d-6dcf-4aff-af6c-53a4ab0fc486\": 1, \"dbdeb7b3-0f32-4819-ae12-8ae63a74f497\": 2, \"e664588c-e2dd-465e-91a9-87bffa8d767c\": 1, \"ec3a66a7-84f6-4d7a-85d9-8bcb3b3b531e\": 2, \"facda6a8-6d50-4687-acdd-8a79356b701c\": 7, \"fd12bed9-3a23-45ab-b243-4a4c1cc1cbaa\": 2}',1,'2025-07-26 02:47:42','2025-08-31 20:10:57','bc414e15-8c5a-4526-9645-71078ec14aa0'),(12,12,1,'Poppy','poppy','pawmates/poppy','{\"0ca1a21c-b29e-4b60-807e-02334f79818b\": false, \"9ef533ee-5483-4028-bb5e-1e952b04874c\": \"A curious lop-eared bunny who loves kale and quiet mornings.\", \"b77c3d63-b216-4288-8a42-20da3df3750a\": \"female\", \"ec3a66a7-84f6-4d7a-85d9-8bcb3b3b531e\": 2}',1,'2025-07-26 02:47:42','2025-07-26 02:47:42','4d22a205-567b-4650-8201-da86968bdd2e'),(13,13,1,'Turbo','turbo','pawmates/turbo','{\"0a444691-aa81-4e8b-b3af-3c1119e2ea77\": [40], \"0ca1a21c-b29e-4b60-807e-02334f79818b\": false, \"7967d421-353a-4321-803c-186bc8dafdf8\": 1, \"9ef533ee-5483-4028-bb5e-1e952b04874c\": \"A speedy little hamster with a love for tunnels and treats.\", \"b77c3d63-b216-4288-8a42-20da3df3750a\": \"male\", \"d57c505d-6dcf-4aff-af6c-53a4ab0fc486\": 1, \"dbdeb7b3-0f32-4819-ae12-8ae63a74f497\": 3, \"e664588c-e2dd-465e-91a9-87bffa8d767c\": 0, \"ec3a66a7-84f6-4d7a-85d9-8bcb3b3b531e\": 1, \"facda6a8-6d50-4687-acdd-8a79356b701c\": 8, \"fd12bed9-3a23-45ab-b243-4a4c1cc1cbaa\": 10}',1,'2025-07-26 02:47:42','2025-08-31 20:11:56','bd3afe6e-2d53-4baf-b44b-9e4541e98421'),(14,14,1,'Turbo','turbo','pawmates/turbo','{\"0ca1a21c-b29e-4b60-807e-02334f79818b\": false, \"9ef533ee-5483-4028-bb5e-1e952b04874c\": \"A speedy little hamster with a love for tunnels and treats.\", \"b77c3d63-b216-4288-8a42-20da3df3750a\": \"male\", \"ec3a66a7-84f6-4d7a-85d9-8bcb3b3b531e\": 1}',1,'2025-07-26 02:47:42','2025-07-26 02:47:42','c52ea4ee-2ef0-48ad-a07e-6b6987ddbead'),(15,15,1,'Luna','luna','pawmates/luna','{\"0a444691-aa81-4e8b-b3af-3c1119e2ea77\": [43], \"0ca1a21c-b29e-4b60-807e-02334f79818b\": true, \"7967d421-353a-4321-803c-186bc8dafdf8\": 1, \"9ef533ee-5483-4028-bb5e-1e952b04874c\": \"A wise and calm husky mix who enjoys snow and soft voices.\", \"b77c3d63-b216-4288-8a42-20da3df3750a\": \"female\", \"d57c505d-6dcf-4aff-af6c-53a4ab0fc486\": 5, \"dbdeb7b3-0f32-4819-ae12-8ae63a74f497\": 8, \"e664588c-e2dd-465e-91a9-87bffa8d767c\": 8, \"ec3a66a7-84f6-4d7a-85d9-8bcb3b3b531e\": 5, \"facda6a8-6d50-4687-acdd-8a79356b701c\": 7, \"fd12bed9-3a23-45ab-b243-4a4c1cc1cbaa\": 2}',1,'2025-07-26 02:47:42','2025-08-31 20:12:41','020b3c0b-09c2-4582-aa79-3e899f9b3724'),(16,16,1,'Luna','luna','pawmates/luna','{\"0ca1a21c-b29e-4b60-807e-02334f79818b\": true, \"9ef533ee-5483-4028-bb5e-1e952b04874c\": \"A wise and calm husky mix who enjoys snow and soft voices.\", \"b77c3d63-b216-4288-8a42-20da3df3750a\": \"female\", \"ec3a66a7-84f6-4d7a-85d9-8bcb3b3b531e\": 5}',1,'2025-07-26 02:47:42','2025-07-26 02:47:42','8692f97c-97ff-4f83-b62d-caaf5003eceb'),(17,17,1,NULL,NULL,NULL,'{\"3912bf87-a6e5-4ebe-ac6c-bdeab74128f6\": 0, \"7c6fe52d-8e4f-4678-8872-d84bd3fc4e6e\": 0, \"8f6071b8-a55a-489d-ae97-fc5b9d7b2e7c\": 0, \"8fe35a49-21a9-4f52-82ce-efcf64b139e7\": 0, \"a1a7624b-d859-4339-8e40-c4e3b8a0f133\": 0, \"b3ac931f-c2bc-4008-8e00-983639565f46\": 0, \"b7af6ca8-8362-416e-b1e2-f12f6550c125\": 0, \"db610d3d-a13b-4bd5-bd67-7229a0a7866b\": 0}',1,'2025-07-26 02:47:47','2025-07-26 02:47:47','4b378283-1d5e-48de-bbbc-342b1eeb9260'),(18,18,1,NULL,NULL,NULL,'{\"3912bf87-a6e5-4ebe-ac6c-bdeab74128f6\": 0, \"7c6fe52d-8e4f-4678-8872-d84bd3fc4e6e\": 0, \"8f6071b8-a55a-489d-ae97-fc5b9d7b2e7c\": 0, \"8fe35a49-21a9-4f52-82ce-efcf64b139e7\": 0, \"a1a7624b-d859-4339-8e40-c4e3b8a0f133\": 0, \"b3ac931f-c2bc-4008-8e00-983639565f46\": 0, \"b7af6ca8-8362-416e-b1e2-f12f6550c125\": 0, \"db610d3d-a13b-4bd5-bd67-7229a0a7866b\": 0}',1,'2025-07-26 02:56:25','2025-07-26 02:56:25','7e074888-36bf-4522-875e-4077cea8fc87'),(19,19,1,'Turbo','turbo','pawmates/turbo','{\"0ca1a21c-b29e-4b60-807e-02334f79818b\": false, \"9ef533ee-5483-4028-bb5e-1e952b04874c\": \"A speedy little hamster with a love for tunnels and treats.\", \"b77c3d63-b216-4288-8a42-20da3df3750a\": \"male\", \"ec3a66a7-84f6-4d7a-85d9-8bcb3b3b531e\": 1}',1,'2025-07-26 02:56:25','2025-07-26 02:56:25','082e198d-8a15-4a90-a6ff-ebc1f709f82e'),(20,20,1,NULL,NULL,NULL,'{\"3912bf87-a6e5-4ebe-ac6c-bdeab74128f6\": 0, \"7c6fe52d-8e4f-4678-8872-d84bd3fc4e6e\": 0, \"8f6071b8-a55a-489d-ae97-fc5b9d7b2e7c\": 0, \"8fe35a49-21a9-4f52-82ce-efcf64b139e7\": 0, \"a1a7624b-d859-4339-8e40-c4e3b8a0f133\": 0, \"b3ac931f-c2bc-4008-8e00-983639565f46\": 0, \"b7af6ca8-8362-416e-b1e2-f12f6550c125\": 0, \"db610d3d-a13b-4bd5-bd67-7229a0a7866b\": 0}',1,'2025-07-26 02:56:25','2025-07-26 02:56:25','085e34c7-13ea-4b15-9124-123078f70fa4'),(21,21,1,'Turbo','turbo','pawmates/turbo','{\"0ca1a21c-b29e-4b60-807e-02334f79818b\": false, \"9ef533ee-5483-4028-bb5e-1e952b04874c\": \"A speedy little hamster with a love for tunnels and treats.\", \"b77c3d63-b216-4288-8a42-20da3df3750a\": \"male\", \"ec3a66a7-84f6-4d7a-85d9-8bcb3b3b531e\": 1}',1,'2025-07-26 02:58:32','2025-07-26 02:58:32','a09f1e5e-9caf-48b2-9709-4eb3f671d967'),(22,22,1,NULL,NULL,NULL,'{\"3912bf87-a6e5-4ebe-ac6c-bdeab74128f6\": 0, \"7c6fe52d-8e4f-4678-8872-d84bd3fc4e6e\": 0, \"8f6071b8-a55a-489d-ae97-fc5b9d7b2e7c\": 0, \"8fe35a49-21a9-4f52-82ce-efcf64b139e7\": 0, \"a1a7624b-d859-4339-8e40-c4e3b8a0f133\": 0, \"b3ac931f-c2bc-4008-8e00-983639565f46\": 0, \"b7af6ca8-8362-416e-b1e2-f12f6550c125\": 0, \"db610d3d-a13b-4bd5-bd67-7229a0a7866b\": 0}',1,'2025-07-26 02:58:32','2025-07-26 02:58:32','3ee5a3a8-2cfa-43aa-b712-0955c2ccca15'),(24,24,1,'Homepage','homepage','__home__',NULL,1,'2025-08-11 20:43:43','2025-08-11 20:43:43','40ebf93a-e4ab-4871-a5f7-c33eefe8dfba'),(25,25,1,'Ryan',NULL,NULL,NULL,1,'2025-08-26 21:31:50','2025-08-26 21:31:50','1ac7b3f3-61d0-4ae6-bc09-fb05ae5d10ee'),(26,26,1,'Golden retriever',NULL,NULL,NULL,1,'2025-08-28 06:21:44','2025-08-28 06:21:44','4d7c05b4-04af-41df-ac15-5b0a038545bb'),(28,28,1,'Maple','maple','pawmates/maple','{\"0a444691-aa81-4e8b-b3af-3c1119e2ea77\": [26], \"0ca1a21c-b29e-4b60-807e-02334f79818b\": true, \"9ef533ee-5483-4028-bb5e-1e952b04874c\": \"A gentle golden retriever who loves cuddles and sunbathing.\", \"b77c3d63-b216-4288-8a42-20da3df3750a\": \"female\", \"ec3a66a7-84f6-4d7a-85d9-8bcb3b3b531e\": 3}',1,'2025-08-28 06:21:46','2025-08-28 06:21:46','45684434-ea11-4739-bbd6-3d65e288b308'),(29,29,1,'Golden retriever',NULL,NULL,NULL,1,'2025-08-28 06:24:32','2025-08-28 06:24:32','47131002-75d0-47dd-a45e-a95fe72add2e'),(31,31,1,'Maple','maple','pawmates/maple','{\"0a444691-aa81-4e8b-b3af-3c1119e2ea77\": [29], \"0ca1a21c-b29e-4b60-807e-02334f79818b\": true, \"9ef533ee-5483-4028-bb5e-1e952b04874c\": \"A gentle golden retriever who loves cuddles and sunbathing.\", \"b77c3d63-b216-4288-8a42-20da3df3750a\": \"female\", \"ec3a66a7-84f6-4d7a-85d9-8bcb3b3b531e\": 3}',1,'2025-08-28 06:24:38','2025-08-28 06:24:38','92192260-21d0-45aa-84f3-eddf316ae9ad'),(33,33,1,'Maple','maple','pawmates/maple','{\"0a444691-aa81-4e8b-b3af-3c1119e2ea77\": [29], \"0ca1a21c-b29e-4b60-807e-02334f79818b\": true, \"7967d421-353a-4321-803c-186bc8dafdf8\": 9, \"9ef533ee-5483-4028-bb5e-1e952b04874c\": \"A gentle golden retriever who loves cuddles and sunbathing.\", \"b77c3d63-b216-4288-8a42-20da3df3750a\": \"female\", \"d57c505d-6dcf-4aff-af6c-53a4ab0fc486\": 3, \"dbdeb7b3-0f32-4819-ae12-8ae63a74f497\": 3, \"e664588c-e2dd-465e-91a9-87bffa8d767c\": 7, \"ec3a66a7-84f6-4d7a-85d9-8bcb3b3b531e\": 3, \"facda6a8-6d50-4687-acdd-8a79356b701c\": 3, \"fd12bed9-3a23-45ab-b243-4a4c1cc1cbaa\": 7}',1,'2025-08-31 20:09:19','2025-08-31 20:09:19','73d89875-2b17-4fb5-9e29-44e9a1eb459f'),(35,35,1,'Mochi',NULL,NULL,NULL,1,'2025-08-31 20:10:15','2025-08-31 20:10:15','60e3f5e0-4ccb-4289-a80a-90b7774d0935'),(36,36,1,'Mochi','mochi','pawmates/mochi','{\"0a444691-aa81-4e8b-b3af-3c1119e2ea77\": [35], \"0ca1a21c-b29e-4b60-807e-02334f79818b\": true, \"7967d421-353a-4321-803c-186bc8dafdf8\": 2, \"9ef533ee-5483-4028-bb5e-1e952b04874c\": \"A mischievous cat who prefers high shelves and soft blankets.\", \"b77c3d63-b216-4288-8a42-20da3df3750a\": \"male\", \"d57c505d-6dcf-4aff-af6c-53a4ab0fc486\": 7, \"dbdeb7b3-0f32-4819-ae12-8ae63a74f497\": 8, \"e664588c-e2dd-465e-91a9-87bffa8d767c\": 8, \"ec3a66a7-84f6-4d7a-85d9-8bcb3b3b531e\": 1, \"facda6a8-6d50-4687-acdd-8a79356b701c\": 8, \"fd12bed9-3a23-45ab-b243-4a4c1cc1cbaa\": 1}',1,'2025-08-31 20:10:17','2025-08-31 20:10:17','072c69e6-098a-44b8-92cc-adbad0d3f56c'),(37,37,1,'Poppy',NULL,NULL,NULL,1,'2025-08-31 20:10:41','2025-08-31 20:10:41','c69c7bd7-23ec-4e03-9f0f-aade01a94078'),(39,39,1,'Poppy','poppy','pawmates/poppy','{\"0a444691-aa81-4e8b-b3af-3c1119e2ea77\": [37], \"0ca1a21c-b29e-4b60-807e-02334f79818b\": false, \"7967d421-353a-4321-803c-186bc8dafdf8\": 1, \"9ef533ee-5483-4028-bb5e-1e952b04874c\": \"A curious lop-eared bunny who loves kale and quiet mornings.\", \"b77c3d63-b216-4288-8a42-20da3df3750a\": \"female\", \"d57c505d-6dcf-4aff-af6c-53a4ab0fc486\": 1, \"dbdeb7b3-0f32-4819-ae12-8ae63a74f497\": 2, \"e664588c-e2dd-465e-91a9-87bffa8d767c\": 1, \"ec3a66a7-84f6-4d7a-85d9-8bcb3b3b531e\": 2, \"facda6a8-6d50-4687-acdd-8a79356b701c\": 7, \"fd12bed9-3a23-45ab-b243-4a4c1cc1cbaa\": 2}',1,'2025-08-31 20:10:57','2025-08-31 20:10:57','1bf113dd-851f-44bf-920c-c495d949045e'),(40,40,1,'Turbo',NULL,NULL,NULL,1,'2025-08-31 20:11:40','2025-08-31 20:11:40','ba15112b-c008-4c0c-bec5-003623e2c76c'),(42,42,1,'Turbo','turbo','pawmates/turbo','{\"0a444691-aa81-4e8b-b3af-3c1119e2ea77\": [40], \"0ca1a21c-b29e-4b60-807e-02334f79818b\": false, \"7967d421-353a-4321-803c-186bc8dafdf8\": 1, \"9ef533ee-5483-4028-bb5e-1e952b04874c\": \"A speedy little hamster with a love for tunnels and treats.\", \"b77c3d63-b216-4288-8a42-20da3df3750a\": \"male\", \"d57c505d-6dcf-4aff-af6c-53a4ab0fc486\": 1, \"dbdeb7b3-0f32-4819-ae12-8ae63a74f497\": 3, \"e664588c-e2dd-465e-91a9-87bffa8d767c\": 0, \"ec3a66a7-84f6-4d7a-85d9-8bcb3b3b531e\": 1, \"facda6a8-6d50-4687-acdd-8a79356b701c\": 8, \"fd12bed9-3a23-45ab-b243-4a4c1cc1cbaa\": 10}',1,'2025-08-31 20:11:56','2025-08-31 20:11:56','dfcf2ea5-e6ff-48d7-9790-bed02b439e34'),(43,43,1,'Luna',NULL,NULL,NULL,1,'2025-08-31 20:12:25','2025-08-31 20:12:25','69a782a6-67e6-4a82-baca-90f93fb87573'),(45,45,1,'Luna','luna','pawmates/luna','{\"0a444691-aa81-4e8b-b3af-3c1119e2ea77\": [43], \"0ca1a21c-b29e-4b60-807e-02334f79818b\": true, \"7967d421-353a-4321-803c-186bc8dafdf8\": 1, \"9ef533ee-5483-4028-bb5e-1e952b04874c\": \"A wise and calm husky mix who enjoys snow and soft voices.\", \"b77c3d63-b216-4288-8a42-20da3df3750a\": \"female\", \"d57c505d-6dcf-4aff-af6c-53a4ab0fc486\": 5, \"dbdeb7b3-0f32-4819-ae12-8ae63a74f497\": 8, \"e664588c-e2dd-465e-91a9-87bffa8d767c\": 8, \"ec3a66a7-84f6-4d7a-85d9-8bcb3b3b531e\": 5, \"facda6a8-6d50-4687-acdd-8a79356b701c\": 7, \"fd12bed9-3a23-45ab-b243-4a4c1cc1cbaa\": 2}',1,'2025-08-31 20:12:41','2025-08-31 20:12:41','2ee295ff-948a-493b-bc6e-9bfd885f2bac');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,2,NULL,NULL,NULL,3,'2025-07-26 01:19:00',NULL,'live',NULL,NULL,'2025-07-26 01:19:19','2025-07-26 01:19:19'),(3,2,NULL,NULL,NULL,3,'2025-07-26 01:19:00',NULL,'live',NULL,NULL,'2025-07-26 01:19:20','2025-07-26 01:19:20'),(4,1,NULL,NULL,NULL,1,'2025-07-26 01:31:09',NULL,'live',NULL,NULL,'2025-07-26 01:31:09','2025-07-26 01:31:09'),(5,1,NULL,NULL,NULL,1,'2025-07-26 02:18:34',NULL,'live',0,0,'2025-07-26 02:18:34','2025-07-26 02:18:34'),(7,1,NULL,NULL,NULL,1,'2025-07-26 02:47:00',NULL,'live',NULL,NULL,'2025-07-26 02:47:42','2025-07-26 02:47:42'),(8,1,NULL,NULL,NULL,1,'2025-07-26 02:47:00',NULL,'live',NULL,NULL,'2025-07-26 02:47:42','2025-07-26 02:47:42'),(9,1,NULL,NULL,NULL,1,'2025-07-26 02:47:00',NULL,'live',NULL,NULL,'2025-07-26 02:47:42','2025-07-26 02:47:42'),(10,1,NULL,NULL,NULL,1,'2025-07-26 02:47:00',NULL,'live',NULL,NULL,'2025-07-26 02:47:42','2025-07-26 02:47:42'),(11,1,NULL,NULL,NULL,1,'2025-07-26 02:47:00',NULL,'live',NULL,NULL,'2025-07-26 02:47:42','2025-07-26 02:47:42'),(12,1,NULL,NULL,NULL,1,'2025-07-26 02:47:00',NULL,'live',NULL,NULL,'2025-07-26 02:47:42','2025-07-26 02:47:42'),(13,1,NULL,NULL,NULL,1,'2025-07-26 02:47:00',NULL,'live',NULL,NULL,'2025-07-26 02:47:42','2025-07-26 02:47:42'),(14,1,NULL,NULL,NULL,1,'2025-07-26 02:47:00',NULL,'live',NULL,NULL,'2025-07-26 02:47:42','2025-07-26 02:47:42'),(15,1,NULL,NULL,NULL,1,'2025-07-26 02:47:00',NULL,'live',NULL,NULL,'2025-07-26 02:47:42','2025-07-26 02:47:42'),(16,1,NULL,NULL,NULL,1,'2025-07-26 02:47:00',NULL,'live',NULL,NULL,'2025-07-26 02:47:42','2025-07-26 02:47:42'),(19,1,NULL,NULL,NULL,1,'2025-07-26 02:47:00',NULL,'live',NULL,NULL,'2025-07-26 02:56:25','2025-07-26 02:56:25'),(21,1,NULL,NULL,NULL,1,'2025-07-26 02:47:00',NULL,'live',NULL,NULL,'2025-07-26 02:58:32','2025-07-26 02:58:32'),(24,2,NULL,NULL,NULL,3,'2025-07-26 01:19:00',NULL,'live',NULL,NULL,'2025-08-11 20:43:43','2025-08-11 20:43:43'),(28,1,NULL,NULL,NULL,1,'2025-07-26 02:47:00',NULL,'live',NULL,NULL,'2025-08-28 06:21:46','2025-08-28 06:21:46'),(31,1,NULL,NULL,NULL,1,'2025-07-26 02:47:00',NULL,'live',NULL,NULL,'2025-08-28 06:24:38','2025-08-28 06:24:38'),(33,1,NULL,NULL,NULL,1,'2025-07-26 02:47:00',NULL,'live',NULL,NULL,'2025-08-31 20:09:19','2025-08-31 20:09:19'),(36,1,NULL,NULL,NULL,1,'2025-07-26 02:47:00',NULL,'live',NULL,NULL,'2025-08-31 20:10:17','2025-08-31 20:10:17'),(39,1,NULL,NULL,NULL,1,'2025-07-26 02:47:00',NULL,'live',NULL,NULL,'2025-08-31 20:10:57','2025-08-31 20:10:57'),(42,1,NULL,NULL,NULL,1,'2025-07-26 02:47:00',NULL,'live',NULL,NULL,'2025-08-31 20:11:56','2025-08-31 20:11:56'),(45,1,NULL,NULL,NULL,1,'2025-07-26 02:47:00',NULL,'live',NULL,NULL,'2025-08-31 20:12:41','2025-08-31 20:12:41');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries_authors` VALUES (4,1,1),(5,1,1),(7,1,1),(8,1,1),(9,1,1),(10,1,1),(11,1,1),(12,1,1),(13,1,1),(14,1,1),(15,1,1),(16,1,1),(19,1,1),(21,1,1),(28,1,1),(31,1,1),(33,1,1),(36,1,1),(39,1,1),(42,1,1),(45,1,1);
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,'Pawmates','pawmates',NULL,'paw','green',1,'site',NULL,NULL,1,'site',NULL,1,'2025-07-26 00:58:08','2025-07-26 00:58:08',NULL,'360356d7-7d36-4cf2-a063-ebf63125cc00'),(2,2,'Page Modules','pageModules',NULL,'block-brick',NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-07-26 01:19:04','2025-07-26 01:19:04',NULL,'20349c5d-8911-4cfc-b49c-7dc36eeb62de'),(3,3,'Page Builder','pageBuilder',NULL,'excavator',NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-07-26 01:19:12','2025-07-26 01:19:12',NULL,'e27725a4-1f5e-4cb7-a977-8aaa9f8146b9');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"befcc8f4-2c45-4b5e-af7b-705c6a8df5f4\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"1a02d34b-3667-4a8f-9b89-2b8dafdba3ee\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": \"Name\", \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-07-26T00:46:42+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"ec3a66a7-84f6-4d7a-85d9-8bcb3b3b531e\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Age\", \"width\": 25, \"handle\": \"age\", \"warning\": null, \"fieldUid\": \"94fc764c-b04d-4b16-8d91-1251539daa79\", \"required\": false, \"dateAdded\": \"2025-07-26T00:58:08+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"b77c3d63-b216-4288-8a42-20da3df3750a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 50, \"handle\": null, \"warning\": null, \"fieldUid\": \"29c24dbb-b55b-4ebb-8124-fcfa3d0be193\", \"required\": false, \"dateAdded\": \"2025-07-26T00:58:08+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"0ca1a21c-b29e-4b60-807e-02334f79818b\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Neutered\", \"width\": 25, \"handle\": \"neutered\", \"warning\": null, \"fieldUid\": \"0a5b2601-741b-4839-913a-3a37631eabd3\", \"required\": false, \"dateAdded\": \"2025-07-26T00:58:08+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"9ef533ee-5483-4028-bb5e-1e952b04874c\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Short Description\", \"width\": 100, \"handle\": \"shortDescription\", \"warning\": null, \"fieldUid\": \"f9c132da-5a84-4041-9cd1-5badb98df027\", \"required\": false, \"dateAdded\": \"2025-07-26T00:58:08+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"0a444691-aa81-4e8b-b3af-3c1119e2ea77\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"83aa7052-99d6-437a-ba10-fa6ac32b58b7\", \"required\": false, \"dateAdded\": \"2025-07-26T00:58:08+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"uid\": \"072cb3d9-594a-4478-8ab6-d48233d5c0ab\", \"type\": \"craft\\\\fieldlayoutelements\\\\Heading\", \"heading\": \"Attributes\", \"dateAdded\": \"2025-07-29T01:54:48+00:00\", \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"7967d421-353a-4321-803c-186bc8dafdf8\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Affection\", \"width\": 50, \"handle\": \"affection\", \"warning\": null, \"fieldUid\": \"ae845a83-cc97-41f2-933f-39acb00facae\", \"required\": false, \"dateAdded\": \"2025-07-29T01:54:48+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"fd12bed9-3a23-45ab-b243-4a4c1cc1cbaa\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Activity Level\", \"width\": 50, \"handle\": \"activityLevel\", \"warning\": null, \"fieldUid\": \"ae845a83-cc97-41f2-933f-39acb00facae\", \"required\": false, \"dateAdded\": \"2025-07-29T01:54:48+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"d57c505d-6dcf-4aff-af6c-53a4ab0fc486\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Body Size\", \"width\": 50, \"handle\": \"bodySize\", \"warning\": null, \"fieldUid\": \"ae845a83-cc97-41f2-933f-39acb00facae\", \"required\": false, \"dateAdded\": \"2025-07-29T01:54:48+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"dbdeb7b3-0f32-4819-ae12-8ae63a74f497\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Hairyness\", \"width\": 50, \"handle\": \"hairyness\", \"warning\": null, \"fieldUid\": \"ae845a83-cc97-41f2-933f-39acb00facae\", \"required\": false, \"dateAdded\": \"2025-07-29T01:54:48+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"e664588c-e2dd-465e-91a9-87bffa8d767c\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Diet\", \"width\": 50, \"handle\": \"diet\", \"warning\": null, \"fieldUid\": \"ae845a83-cc97-41f2-933f-39acb00facae\", \"required\": false, \"dateAdded\": \"2025-07-29T01:54:48+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"facda6a8-6d50-4687-acdd-8a79356b701c\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Attractiveness\", \"width\": 50, \"handle\": \"attractiveness\", \"warning\": null, \"fieldUid\": \"ae845a83-cc97-41f2-933f-39acb00facae\", \"required\": false, \"dateAdded\": \"2025-07-29T01:54:48+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-07-26 00:58:08','2025-08-26 21:23:00',NULL,'83f969c2-af9c-446c-9386-344e61e04697'),(2,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"8d00e075-0c47-4988-8c63-eabf79d94356\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"d8da11d1-5168-4d3b-b609-087d40231e3d\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-07-26T01:17:49+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-07-26 01:19:04','2025-07-26 01:19:04',NULL,'9946751c-cb00-4417-9d6b-f1b7e3a243b9'),(3,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"f8bea537-cacf-4eee-90b8-0e9181567224\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"b0450ba6-9029-4c64-bcfc-5a078d88c74d\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": \"Headline\", \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-07-26T01:12:18+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"5728ca67-d476-43e8-b9d1-17d1c67c909c\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Tagline\", \"width\": 100, \"handle\": \"tagline\", \"warning\": null, \"fieldUid\": \"f9c132da-5a84-4041-9cd1-5badb98df027\", \"required\": false, \"dateAdded\": \"2025-07-26T01:19:12+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"df799f57-8be4-42b5-9572-d393e5f5e057\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"ea52da8a-d461-4389-b35d-295b468d26ec\", \"required\": false, \"dateAdded\": \"2025-07-26T01:19:12+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-07-26 01:19:12','2025-07-26 01:19:12',NULL,'22a24743-ad50-4d6c-8b80-f1e7092bf268'),(4,'craft\\elements\\ContentBlock','{\"tabs\": [{\"uid\": \"4be768da-da9e-457a-a963-81ae7036f378\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"b7af6ca8-8362-416e-b1e2-f12f6550c125\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Affection\", \"width\": 50, \"handle\": \"affection\", \"warning\": null, \"fieldUid\": \"ae845a83-cc97-41f2-933f-39acb00facae\", \"required\": false, \"dateAdded\": \"2025-07-26T02:18:28+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"3912bf87-a6e5-4ebe-ac6c-bdeab74128f6\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Activity Level\", \"width\": 50, \"handle\": \"activityLevel\", \"warning\": null, \"fieldUid\": \"ae845a83-cc97-41f2-933f-39acb00facae\", \"required\": false, \"dateAdded\": \"2025-07-26T02:18:28+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"8fe35a49-21a9-4f52-82ce-efcf64b139e7\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Body Size\", \"width\": 50, \"handle\": \"bodySize\", \"warning\": null, \"fieldUid\": \"ae845a83-cc97-41f2-933f-39acb00facae\", \"required\": false, \"dateAdded\": \"2025-07-26T02:18:28+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"a1a7624b-d859-4339-8e40-c4e3b8a0f133\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Clingyness\", \"width\": 50, \"handle\": \"clingyness\", \"warning\": null, \"fieldUid\": \"ae845a83-cc97-41f2-933f-39acb00facae\", \"required\": false, \"dateAdded\": \"2025-07-26T02:18:28+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"7c6fe52d-8e4f-4678-8872-d84bd3fc4e6e\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Hairyness\", \"width\": 50, \"handle\": \"hairyness\", \"warning\": null, \"fieldUid\": \"ae845a83-cc97-41f2-933f-39acb00facae\", \"required\": false, \"dateAdded\": \"2025-07-26T02:18:28+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"8f6071b8-a55a-489d-ae97-fc5b9d7b2e7c\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Diet\", \"width\": 50, \"handle\": \"diet\", \"warning\": null, \"fieldUid\": \"ae845a83-cc97-41f2-933f-39acb00facae\", \"required\": false, \"dateAdded\": \"2025-07-26T02:18:28+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"b3ac931f-c2bc-4008-8e00-983639565f46\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Vibe\", \"width\": 50, \"handle\": \"vibe\", \"warning\": null, \"fieldUid\": \"ae845a83-cc97-41f2-933f-39acb00facae\", \"required\": false, \"dateAdded\": \"2025-07-26T02:18:28+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"db610d3d-a13b-4bd5-bd67-7229a0a7866b\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Attractiveness\", \"width\": 50, \"handle\": \"attractiveness\", \"warning\": null, \"fieldUid\": \"ae845a83-cc97-41f2-933f-39acb00facae\", \"required\": false, \"dateAdded\": \"2025-07-26T02:18:28+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-07-26 02:18:28','2025-07-26 02:32:13',NULL,'6aa17eeb-8870-4319-9908-c98c0b77981a'),(5,'craft\\elements\\Asset','{\"tabs\": [{\"uid\": \"a5944e34-dc13-486a-8a95-af1997ef6fa0\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"b232111b-f757-4525-880f-9a3496e30501\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2025-07-29T02:22:54+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-07-29 02:24:21','2025-07-29 02:24:21',NULL,'aed645df-ef97-4b8c-900e-4ef6d3401c22'),(6,'craft\\elements\\User','{\"tabs\": [{\"uid\": \"7a37658e-f896-43df-99e4-7c031b5224cb\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"6c6dc067-be84-4ef5-be3b-75c54ff542d9\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\users\\\\UsernameField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2025-08-26T21:22:32+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"a0d978f2-1d25-43e4-b5f9-6e2eeb643683\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\users\\\\FullNameField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": false, \"attribute\": \"fullName\", \"dateAdded\": \"2025-08-26T21:22:32+00:00\", \"inputType\": null, \"requirable\": true, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"id\": null, \"tip\": null, \"uid\": \"a24e070c-ced9-4f15-9181-5dbe2599046f\", \"type\": \"craft\\\\fieldlayoutelements\\\\users\\\\PhotoField\", \"label\": null, \"width\": 100, \"warning\": null, \"dateAdded\": \"2025-08-26T21:22:32+00:00\", \"requirable\": false, \"orientation\": null, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"76e1aeab-d3c3-4661-9d6f-c64023cb215c\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\users\\\\EmailField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2025-08-26T21:22:32+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"uid\": \"29fe64aa-9adc-4168-9a6e-85043e377041\", \"type\": \"craft\\\\fieldlayoutelements\\\\Heading\", \"heading\": \"Pawmate Attributes\", \"dateAdded\": \"2025-08-26T21:26:43+00:00\", \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"3509545b-9a30-454e-b562-b40e40b7974e\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Affection\", \"width\": 100, \"handle\": \"affection\", \"warning\": null, \"fieldUid\": \"ae845a83-cc97-41f2-933f-39acb00facae\", \"required\": false, \"dateAdded\": \"2025-08-26T21:26:43+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"d911c669-4180-42bc-9682-ebd71c67b30d\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Activity Level\", \"width\": 100, \"handle\": \"activityLevel\", \"warning\": null, \"fieldUid\": \"ae845a83-cc97-41f2-933f-39acb00facae\", \"required\": false, \"dateAdded\": \"2025-08-26T21:26:43+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"a71c6ea8-c78e-4d7c-89b7-2f0ce6dc5bdc\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Body Size\", \"width\": 100, \"handle\": \"bodySize\", \"warning\": null, \"fieldUid\": \"ae845a83-cc97-41f2-933f-39acb00facae\", \"required\": false, \"dateAdded\": \"2025-08-26T21:26:43+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"d8577821-9a6c-4fac-8bba-2e9a1b04b04c\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Hairyness\", \"width\": 100, \"handle\": \"hairyness\", \"warning\": null, \"fieldUid\": \"ae845a83-cc97-41f2-933f-39acb00facae\", \"required\": false, \"dateAdded\": \"2025-08-26T21:26:43+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"ce0aa57c-63e6-4f62-ad39-252ee24c0e17\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Diet\", \"width\": 100, \"handle\": \"diet\", \"warning\": null, \"fieldUid\": \"ae845a83-cc97-41f2-933f-39acb00facae\", \"required\": false, \"dateAdded\": \"2025-08-26T21:26:43+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"e05bbaef-4bc3-4348-9ea6-729bd63198d4\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Attractiveness\", \"width\": 100, \"handle\": \"attractiveness\", \"warning\": null, \"fieldUid\": \"ae845a83-cc97-41f2-933f-39acb00facae\", \"required\": false, \"dateAdded\": \"2025-08-26T21:26:43+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-08-26 21:26:43','2025-08-26 21:26:43',NULL,'dac5087b-e800-4c27-82e9-3943b80a8a79'),(7,'craft\\elements\\Asset','{\"tabs\": [{\"uid\": \"bd4ae1d6-801e-4281-a645-e5543211e924\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"14a72957-0b5f-403d-958d-bcd46281965c\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2025-08-26T21:28:38+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-08-26 21:29:59','2025-08-26 21:29:59',NULL,'f52d0964-52ad-44b8-8cfd-ba52b36a7fc5'),(8,'craft\\elements\\Asset','{\"tabs\": [{\"uid\": \"49e5e746-f101-4fd7-ae34-6350c86d16aa\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"3caa7d7f-4385-4527-a119-d6015a8a3b16\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2025-08-26T21:29:00+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-08-26 21:30:07','2025-08-26 21:30:07',NULL,'99c3bc96-3459-4425-9c7d-351687c573b5');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,'Number','number','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Number','{\"decimals\":0,\"defaultValue\":null,\"max\":null,\"min\":0,\"prefix\":null,\"previewCurrency\":null,\"previewFormat\":\"decimal\",\"size\":null,\"step\":null,\"suffix\":null}','2025-07-26 00:49:32','2025-07-26 00:49:32',NULL,'94fc764c-b04d-4b16-8d91-1251539daa79'),(2,'Sex','sex','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"Female\",\"value\":\"female\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"Male\",\"value\":\"male\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"}],\"customOptions\":false}','2025-07-26 00:51:55','2025-07-26 02:40:56',NULL,'29c24dbb-b55b-4ebb-8124-fcfa3d0be193'),(3,'Lightswitch','lightswitch','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":false,\"offLabel\":null,\"onLabel\":null}','2025-07-26 00:54:09','2025-07-26 00:54:09',NULL,'0a5b2601-741b-4839-913a-3a37631eabd3'),(4,'Plain Text','plainText','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2025-07-26 00:55:27','2025-07-26 00:55:27',NULL,'f9c132da-5a84-4041-9cd1-5badb98df027'),(5,'Image','image','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"defaultUploadLocationSource\":\"volume:1f57f4bb-af34-4cda-8fc3-858845ff8aa4\",\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":1,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:1f57f4bb-af34-4cda-8fc3-858845ff8aa4\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSearchInput\":true,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2025-07-26 00:57:03','2025-07-29 02:24:45',NULL,'83aa7052-99d6-437a-ba10-fa6ac32b58b7'),(6,'Page Builder','pageBuilder','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":null,\"defaultIndexViewMode\":\"cards\",\"enableVersioning\":false,\"entryTypes\":[{\"uid\":\"20349c5d-8911-4cfc-b49c-7dc36eeb62de\",\"group\":\"General\"}],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":50,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"cards\"}','2025-07-26 01:19:08','2025-07-26 01:19:08',NULL,'ea52da8a-d461-4389-b35d-295b468d26ec'),(7,'Attribute Slider','attributeSlider','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Range','{\"defaultValue\":0,\"max\":10,\"min\":0,\"step\":1,\"suffix\":null}','2025-07-26 02:07:51','2025-07-26 02:19:39',NULL,'ae845a83-cc97-41f2-933f-39acb00facae'),(8,'Attributes','creatureAttributes','global',NULL,NULL,0,'site',NULL,'craft\\fields\\ContentBlock','{\"fieldLayouts\":{\"6aa17eeb-8870-4319-9908-c98c0b77981a\":{\"tabs\":[{\"name\":\"Content\",\"uid\":\"4be768da-da9e-457a-a963-81ae7036f378\",\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"affection\",\"label\":\"Affection\",\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"dateAdded\":\"2025-07-26T02:18:28+00:00\",\"uid\":\"b7af6ca8-8362-416e-b1e2-f12f6550c125\",\"fieldUid\":\"ae845a83-cc97-41f2-933f-39acb00facae\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"activityLevel\",\"label\":\"Activity Level\",\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"dateAdded\":\"2025-07-26T02:18:28+00:00\",\"uid\":\"3912bf87-a6e5-4ebe-ac6c-bdeab74128f6\",\"fieldUid\":\"ae845a83-cc97-41f2-933f-39acb00facae\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"bodySize\",\"label\":\"Body Size\",\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"dateAdded\":\"2025-07-26T02:18:28+00:00\",\"uid\":\"8fe35a49-21a9-4f52-82ce-efcf64b139e7\",\"fieldUid\":\"ae845a83-cc97-41f2-933f-39acb00facae\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"clingyness\",\"label\":\"Clingyness\",\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"dateAdded\":\"2025-07-26T02:18:28+00:00\",\"uid\":\"a1a7624b-d859-4339-8e40-c4e3b8a0f133\",\"fieldUid\":\"ae845a83-cc97-41f2-933f-39acb00facae\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"hairyness\",\"label\":\"Hairyness\",\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"dateAdded\":\"2025-07-26T02:18:28+00:00\",\"uid\":\"7c6fe52d-8e4f-4678-8872-d84bd3fc4e6e\",\"fieldUid\":\"ae845a83-cc97-41f2-933f-39acb00facae\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"diet\",\"label\":\"Diet\",\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"dateAdded\":\"2025-07-26T02:18:28+00:00\",\"uid\":\"8f6071b8-a55a-489d-ae97-fc5b9d7b2e7c\",\"fieldUid\":\"ae845a83-cc97-41f2-933f-39acb00facae\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"vibe\",\"label\":\"Vibe\",\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"dateAdded\":\"2025-07-26T02:18:28+00:00\",\"uid\":\"b3ac931f-c2bc-4008-8e00-983639565f46\",\"fieldUid\":\"ae845a83-cc97-41f2-933f-39acb00facae\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"attractiveness\",\"label\":\"Attractiveness\",\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"dateAdded\":\"2025-07-26T02:18:28+00:00\",\"uid\":\"db610d3d-a13b-4bd5-bd67-7229a0a7866b\",\"fieldUid\":\"ae845a83-cc97-41f2-933f-39acb00facae\"}]}],\"cardThumbAlignment\":\"end\"}},\"viewMode\":\"grouped\"}','2025-07-26 02:18:28','2025-07-26 02:32:13','2025-07-29 01:49:44','3a76c031-7a44-4150-ba3d-e86334c0718d');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqlschemas` VALUES (1,'Public Schema','[]',1,'2025-08-24 21:37:31','2025-08-24 21:51:41','0f7822f0-84c2-4b34-af33-65e860071604'),(2,'Growlr','[\"sites.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e:read\", \"elements.drafts:read\", \"elements.revisions:read\", \"elements.inactive:read\", \"sections.38f286df-6270-459e-b2a6-8f01c3f86edd:read\", \"sections.f8481c59-9880-41e3-b231-24ae565d2264:read\", \"nestedentryfields.ea52da8a-d461-4389-b35d-295b468d26ec:read\", \"volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4:read\", \"volumes.b25edf3a-f5a9-4b45-a329-9525ef339500:read\", \"volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58:read\", \"usergroups.everyone:read\", \"growlr.all:read\", \"sections.38f286df-6270-459e-b2a6-8f01c3f86edd:save\", \"sections.f8481c59-9880-41e3-b231-24ae565d2264:edit\", \"sections.f8481c59-9880-41e3-b231-24ae565d2264:create\", \"sections.f8481c59-9880-41e3-b231-24ae565d2264:save\", \"sections.f8481c59-9880-41e3-b231-24ae565d2264:delete\", \"nestedentryfields.ea52da8a-d461-4389-b35d-295b468d26ec:edit\", \"nestedentryfields.ea52da8a-d461-4389-b35d-295b468d26ec:create\", \"nestedentryfields.ea52da8a-d461-4389-b35d-295b468d26ec:save\", \"nestedentryfields.ea52da8a-d461-4389-b35d-295b468d26ec:delete\", \"volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4:edit\", \"volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4:create\", \"volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4:save\", \"volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4:delete\", \"volumes.b25edf3a-f5a9-4b45-a329-9525ef339500:edit\", \"volumes.b25edf3a-f5a9-4b45-a329-9525ef339500:create\", \"volumes.b25edf3a-f5a9-4b45-a329-9525ef339500:save\", \"volumes.b25edf3a-f5a9-4b45-a329-9525ef339500:delete\", \"volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58:edit\", \"volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58:create\", \"volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58:save\", \"volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58:delete\"]',0,'2025-08-24 21:51:31','2025-08-30 20:09:40','ac08e26b-a08d-4161-a6a1-42e1fd246954');
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqltokens` VALUES (1,'Growlr','E8x3Rz6mUFFnp1zmfM3bcHiV98H5a5fo',1,NULL,'2025-09-02 19:09:08',2,'2025-08-24 21:38:16','2025-09-02 19:09:08','f6fa13a6-b2f5-4ffe-a42f-615d247f25a3'),(2,'Public Token','__PUBLIC__',0,NULL,NULL,NULL,'2025-08-24 21:38:36','2025-08-24 21:38:36','57135037-e5c0-4cdb-8fee-1a65a319fdf2');
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'5.8.13.2','5.8.0.3',0,'hpvuhpkgpgpd','3@fkrssdqtff','2025-07-26 00:39:20','2025-08-30 20:09:40','1d343fa4-1257-47a1-895c-1bc1a9c048b1');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','6a7cad18-1bca-4107-ade2-2e71922ebb24'),(2,'craft','m221101_115859_create_entries_authors_table','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','e20e287d-d3eb-4ca2-acb2-3b9584978970'),(3,'craft','m221107_112121_add_max_authors_to_sections','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','e2e74fa6-6793-4a98-a6fe-426e9025ec40'),(4,'craft','m221205_082005_translatable_asset_alt_text','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','37508ee6-4faf-408b-841a-5b538ab601ef'),(5,'craft','m230314_110309_add_authenticator_table','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','5ebae17b-b16a-4151-8ef4-6757b3df29d6'),(6,'craft','m230314_111234_add_webauthn_table','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','3d27e736-33ac-4afd-a7d2-24f6a6b08bed'),(7,'craft','m230503_120303_add_recoverycodes_table','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','e3eeb2f1-8bae-467e-82a2-a75369614b70'),(8,'craft','m230511_000000_field_layout_configs','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','93d64ff1-8108-4ced-9861-ceae21b18b68'),(9,'craft','m230511_215903_content_refactor','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','dc3e61d7-b2bd-49ca-8756-661ba8e254ad'),(10,'craft','m230524_000000_add_entry_type_show_slug_field','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','095884b5-5ce7-4320-82d8-fc8da6aa2a23'),(11,'craft','m230524_000001_entry_type_icons','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','4772d3a7-94e1-4922-a8c3-46da34ba76f4'),(12,'craft','m230524_000002_entry_type_colors','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','8735365f-b0a6-4642-af40-015f6ee14477'),(13,'craft','m230524_220029_global_entry_types','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','5d496e9c-9746-45c2-844b-03fa5d3cfab0'),(14,'craft','m230531_123004_add_entry_type_show_status_field','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','edd5920f-80e8-4286-91c0-ba9cac2d159a'),(15,'craft','m230607_102049_add_entrytype_slug_translation_columns','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','768dab8d-c377-411a-8bd2-c808189aef9a'),(16,'craft','m230616_173810_kill_field_groups','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','aa556c43-ee35-495c-aef6-c41b1a40a6c2'),(17,'craft','m230616_183820_remove_field_name_limit','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','59c3108c-ee8d-4728-a1a8-7a99072e5fa4'),(18,'craft','m230617_070415_entrify_matrix_blocks','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','fc9ac93d-d815-4ca9-ab27-4a03017f2cce'),(19,'craft','m230710_162700_element_activity','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','ab611ec3-e0da-4b28-8314-597bf2128473'),(20,'craft','m230820_162023_fix_cache_id_type','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','e539a312-2bf5-4dce-a1ea-6797e864c3f5'),(21,'craft','m230826_094050_fix_session_id_type','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','887659f7-c9ea-43b7-b1d2-678e76cd29f4'),(22,'craft','m230904_190356_address_fields','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','0f0ef62f-3289-4990-9eba-efd4bc43444f'),(23,'craft','m230928_144045_add_subpath_to_volumes','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','8751575a-5ffd-4005-8f66-6ad0f9b2e605'),(24,'craft','m231013_185640_changedfields_amend_primary_key','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','767569cf-4ba3-4ab7-a00e-eeff51e73dab'),(25,'craft','m231213_030600_element_bulk_ops','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','7e80cb7f-057a-4f7b-8664-6b0c817d4d3d'),(26,'craft','m240129_150719_sites_language_amend_length','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','b69369f5-08f3-4c0c-822f-60c6faae07cf'),(27,'craft','m240206_035135_convert_json_columns','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','b856afdd-d5cb-4397-8ddc-df66e82e9260'),(28,'craft','m240207_182452_address_line_3','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','70f558f8-f14f-4497-a275-a6b64e6ee3c3'),(29,'craft','m240302_212719_solo_preview_targets','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','00c43243-395d-4b81-9969-5fc5dfada2b9'),(30,'craft','m240619_091352_add_auth_2fa_timestamp','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','cf45f17a-f1e3-44bc-a32d-645c1a691f08'),(31,'craft','m240723_214330_drop_bulkop_fk','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','0cb718a0-61f5-4817-8044-7824098474ef'),(32,'craft','m240731_053543_soft_delete_fields','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','6cc770af-b0c0-4e2c-bcce-93019511568d'),(33,'craft','m240805_154041_sso_identities','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','4c54045e-b9ec-4621-bc23-a00da236dbc5'),(34,'craft','m240926_202248_track_entries_deleted_with_section','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','4864418f-2494-4341-883f-cb9b5c010149'),(35,'craft','m241120_190905_user_affiliated_sites','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','1299ec26-5fca-4a24-9ae6-acb544a5cff2'),(36,'craft','m241125_122914_add_viewUsers_permission','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','7b0ef8ad-c8b4-46df-b987-1228c64b393c'),(37,'craft','m250119_135304_entry_type_overrides','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','8d17aed9-8bf1-4951-9903-ff83899808b0'),(38,'craft','m250206_135036_search_index_queue','2025-07-26 00:44:22','2025-07-26 00:44:22','2025-07-26 00:44:22','ad70ebbf-77ae-4e23-90a6-0a233c35673d'),(39,'craft','m250207_172349_bulkop_events','2025-07-26 00:44:22','2025-07-26 00:44:22','2025-07-26 00:44:22','c7e9fb21-331c-4fde-b21a-c3ed47c5b1cd'),(40,'craft','m250315_131608_unlimited_authors','2025-07-26 00:44:22','2025-07-26 00:44:22','2025-07-26 00:44:22','6e1d7307-54ac-4ba7-9e0a-02c0639eb660'),(41,'craft','m250403_171253_static_statuses','2025-07-26 00:44:23','2025-07-26 00:44:23','2025-07-26 00:44:23','6243c1b1-b3eb-4bfd-865a-ed3813be6fef'),(42,'craft','m250512_164202_asset_mime_types','2025-07-26 00:44:23','2025-07-26 00:44:23','2025-07-26 00:44:23','15d10fe7-c210-4b58-9636-15c9a1105bd8'),(43,'craft','m250522_090843_add_deleteEntriesForSite_and_deletePeerEntriesForSite_permissions','2025-07-26 00:44:23','2025-07-26 00:44:23','2025-07-26 00:44:23','2710c28c-6a7b-4de9-83e7-3ec8f1850ea3'),(44,'craft','m250531_183058_content_blocks','2025-07-26 00:44:23','2025-07-26 00:44:23','2025-07-26 00:44:23','2e7563ea-79bd-4a34-9740-ab788291a44b'),(45,'craft','m250623_105031_entry_type_descriptions','2025-07-26 00:44:23','2025-07-26 00:44:23','2025-07-26 00:44:23','ba9541da-eb5c-4efd-bbc4-9b25e35ecc3f');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'vite','5.0.1','1.0.0','2025-07-26 00:39:20','2025-07-26 00:39:20','2025-07-26 00:39:20','8f2ed4ff-24fc-410e-92e4-736759a98a0c');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1756584580'),('elementSources.craft\\elements\\Entry.0.key','\"*\"'),('elementSources.craft\\elements\\Entry.0.type','\"native\"'),('elementSources.craft\\elements\\Entry.1.defaultSort.0','\"title\"'),('elementSources.craft\\elements\\Entry.1.defaultSort.1','\"asc\"'),('elementSources.craft\\elements\\Entry.1.defaultViewMode','\"\"'),('elementSources.craft\\elements\\Entry.1.disabled','false'),('elementSources.craft\\elements\\Entry.1.key','\"singles\"'),('elementSources.craft\\elements\\Entry.1.tableAttributes.0','\"status\"'),('elementSources.craft\\elements\\Entry.1.tableAttributes.1','\"link\"'),('elementSources.craft\\elements\\Entry.1.type','\"native\"'),('elementSources.craft\\elements\\Entry.2.heading','\"Creatures\"'),('elementSources.craft\\elements\\Entry.2.key','\"heading:17e86486-65f3-4070-82a3-97dc968c620b\"'),('elementSources.craft\\elements\\Entry.2.type','\"heading\"'),('elementSources.craft\\elements\\Entry.3.defaultSort.0','\"postDate\"'),('elementSources.craft\\elements\\Entry.3.defaultSort.1','\"desc\"'),('elementSources.craft\\elements\\Entry.3.defaultViewMode','\"\"'),('elementSources.craft\\elements\\Entry.3.disabled','false'),('elementSources.craft\\elements\\Entry.3.key','\"section:f8481c59-9880-41e3-b231-24ae565d2264\"'),('elementSources.craft\\elements\\Entry.3.tableAttributes.0','\"status\"'),('elementSources.craft\\elements\\Entry.3.tableAttributes.1','\"postDate\"'),('elementSources.craft\\elements\\Entry.3.tableAttributes.2','\"expiryDate\"'),('elementSources.craft\\elements\\Entry.3.tableAttributes.3','\"link\"'),('elementSources.craft\\elements\\Entry.3.type','\"native\"'),('email.fromEmail','\"ryan@craftquest.io\"'),('email.fromName','\"Craft CMS Vite Tailwind\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.color','null'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.description','null'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.cardThumbAlignment','\"end\"'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elementCondition','null'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.autocapitalize','true'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.autocomplete','false'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.autocorrect','true'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.class','null'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.dateAdded','\"2025-07-26T01:17:49+00:00\"'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.disabled','false'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.elementCondition','null'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.id','null'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.includeInCards','false'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.inputType','null'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.instructions','null'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.label','null'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.max','null'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.min','null'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.name','null'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.orientation','null'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.placeholder','null'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.providesThumbs','false'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.readonly','false'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.required','true'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.size','null'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.step','null'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.tip','null'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.title','null'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.uid','\"d8da11d1-5168-4d3b-b609-087d40231e3d\"'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.userCondition','null'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.warning','null'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.elements.0.width','100'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.name','\"Content\"'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.uid','\"8d00e075-0c47-4988-8c63-eabf79d94356\"'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.fieldLayouts.9946751c-cb00-4417-9d6b-f1b7e3a243b9.tabs.0.userCondition','null'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.handle','\"pageModules\"'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.hasTitleField','true'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.icon','\"block-brick\"'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.name','\"Page Modules\"'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.showSlugField','true'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.showStatusField','true'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.slugTranslationKeyFormat','null'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.slugTranslationMethod','\"site\"'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.titleFormat','null'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.titleTranslationKeyFormat','null'),('entryTypes.20349c5d-8911-4cfc-b49c-7dc36eeb62de.titleTranslationMethod','\"site\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.color','\"green\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.description','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.cardThumbAlignment','\"end\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elementCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.autocapitalize','true'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.autocomplete','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.autocorrect','true'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.class','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.dateAdded','\"2025-07-26T00:46:42+00:00\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.disabled','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.elementCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.id','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.includeInCards','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.inputType','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.instructions','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.label','\"Name\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.max','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.min','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.name','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.orientation','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.placeholder','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.providesThumbs','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.readonly','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.required','true'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.size','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.step','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.tip','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.title','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.uid','\"1a02d34b-3667-4a8f-9b89-2b8dafdba3ee\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.userCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.warning','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.0.width','100'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.1.dateAdded','\"2025-07-26T00:58:08+00:00\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.1.editCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.1.elementCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.1.fieldUid','\"94fc764c-b04d-4b16-8d91-1251539daa79\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.1.handle','\"age\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.1.includeInCards','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.1.instructions','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.1.label','\"Age\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.1.providesThumbs','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.1.required','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.1.tip','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.1.uid','\"ec3a66a7-84f6-4d7a-85d9-8bcb3b3b531e\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.1.userCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.1.warning','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.1.width','25'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.10.dateAdded','\"2025-07-29T01:54:48+00:00\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.10.editCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.10.elementCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.10.fieldUid','\"ae845a83-cc97-41f2-933f-39acb00facae\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.10.handle','\"hairyness\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.10.includeInCards','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.10.instructions','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.10.label','\"Hairyness\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.10.providesThumbs','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.10.required','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.10.tip','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.10.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.10.uid','\"dbdeb7b3-0f32-4819-ae12-8ae63a74f497\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.10.userCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.10.warning','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.10.width','50'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.11.dateAdded','\"2025-07-29T01:54:48+00:00\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.11.editCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.11.elementCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.11.fieldUid','\"ae845a83-cc97-41f2-933f-39acb00facae\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.11.handle','\"diet\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.11.includeInCards','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.11.instructions','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.11.label','\"Diet\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.11.providesThumbs','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.11.required','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.11.tip','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.11.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.11.uid','\"e664588c-e2dd-465e-91a9-87bffa8d767c\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.11.userCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.11.warning','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.11.width','50'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.12.dateAdded','\"2025-07-29T01:54:48+00:00\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.12.editCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.12.elementCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.12.fieldUid','\"ae845a83-cc97-41f2-933f-39acb00facae\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.12.handle','\"attractiveness\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.12.includeInCards','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.12.instructions','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.12.label','\"Attractiveness\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.12.providesThumbs','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.12.required','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.12.tip','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.12.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.12.uid','\"facda6a8-6d50-4687-acdd-8a79356b701c\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.12.userCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.12.warning','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.12.width','50'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.2.dateAdded','\"2025-07-26T00:58:08+00:00\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.2.editCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.2.elementCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.2.fieldUid','\"29c24dbb-b55b-4ebb-8124-fcfa3d0be193\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.2.handle','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.2.includeInCards','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.2.instructions','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.2.label','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.2.providesThumbs','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.2.required','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.2.tip','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.2.uid','\"b77c3d63-b216-4288-8a42-20da3df3750a\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.2.userCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.2.warning','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.2.width','50'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.3.dateAdded','\"2025-07-26T00:58:08+00:00\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.3.editCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.3.elementCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.3.fieldUid','\"0a5b2601-741b-4839-913a-3a37631eabd3\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.3.handle','\"neutered\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.3.includeInCards','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.3.instructions','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.3.label','\"Neutered\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.3.providesThumbs','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.3.required','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.3.tip','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.3.uid','\"0ca1a21c-b29e-4b60-807e-02334f79818b\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.3.userCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.3.warning','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.3.width','25'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.4.dateAdded','\"2025-07-26T00:58:08+00:00\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.4.editCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.4.elementCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.4.fieldUid','\"f9c132da-5a84-4041-9cd1-5badb98df027\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.4.handle','\"shortDescription\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.4.includeInCards','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.4.instructions','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.4.label','\"Short Description\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.4.providesThumbs','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.4.required','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.4.tip','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.4.uid','\"9ef533ee-5483-4028-bb5e-1e952b04874c\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.4.userCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.4.warning','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.4.width','100'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.5.dateAdded','\"2025-07-26T00:58:08+00:00\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.5.editCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.5.elementCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.5.fieldUid','\"83aa7052-99d6-437a-ba10-fa6ac32b58b7\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.5.handle','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.5.includeInCards','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.5.instructions','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.5.label','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.5.providesThumbs','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.5.required','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.5.tip','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.5.uid','\"0a444691-aa81-4e8b-b3af-3c1119e2ea77\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.5.userCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.5.warning','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.5.width','100'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.6.dateAdded','\"2025-07-29T01:54:48+00:00\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.6.elementCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.6.heading','\"Attributes\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.6.type','\"craft\\\\fieldlayoutelements\\\\Heading\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.6.uid','\"072cb3d9-594a-4478-8ab6-d48233d5c0ab\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.6.userCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.7.dateAdded','\"2025-07-29T01:54:48+00:00\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.7.editCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.7.elementCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.7.fieldUid','\"ae845a83-cc97-41f2-933f-39acb00facae\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.7.handle','\"affection\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.7.includeInCards','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.7.instructions','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.7.label','\"Affection\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.7.providesThumbs','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.7.required','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.7.tip','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.7.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.7.uid','\"7967d421-353a-4321-803c-186bc8dafdf8\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.7.userCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.7.warning','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.7.width','50'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.8.dateAdded','\"2025-07-29T01:54:48+00:00\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.8.editCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.8.elementCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.8.fieldUid','\"ae845a83-cc97-41f2-933f-39acb00facae\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.8.handle','\"activityLevel\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.8.includeInCards','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.8.instructions','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.8.label','\"Activity Level\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.8.providesThumbs','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.8.required','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.8.tip','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.8.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.8.uid','\"fd12bed9-3a23-45ab-b243-4a4c1cc1cbaa\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.8.userCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.8.warning','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.8.width','50'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.9.dateAdded','\"2025-07-29T01:54:48+00:00\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.9.editCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.9.elementCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.9.fieldUid','\"ae845a83-cc97-41f2-933f-39acb00facae\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.9.handle','\"bodySize\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.9.includeInCards','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.9.instructions','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.9.label','\"Body Size\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.9.providesThumbs','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.9.required','false'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.9.tip','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.9.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.9.uid','\"d57c505d-6dcf-4aff-af6c-53a4ab0fc486\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.9.userCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.9.warning','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.elements.9.width','50'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.name','\"Content\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.uid','\"befcc8f4-2c45-4b5e-af7b-705c6a8df5f4\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.fieldLayouts.83f969c2-af9c-446c-9386-344e61e04697.tabs.0.userCondition','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.handle','\"pawmates\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.hasTitleField','true'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.icon','\"paw\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.name','\"Pawmates\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.showSlugField','true'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.showStatusField','true'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.slugTranslationKeyFormat','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.slugTranslationMethod','\"site\"'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.titleFormat','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.titleTranslationKeyFormat','null'),('entryTypes.360356d7-7d36-4cf2-a063-ebf63125cc00.titleTranslationMethod','\"site\"'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.color','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.description','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.cardThumbAlignment','\"end\"'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elementCondition','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.autocapitalize','true'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.autocomplete','false'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.autocorrect','true'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.class','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.dateAdded','\"2025-07-26T01:12:18+00:00\"'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.disabled','false'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.elementCondition','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.id','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.includeInCards','false'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.inputType','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.instructions','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.label','\"Headline\"'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.max','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.min','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.name','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.orientation','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.placeholder','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.providesThumbs','false'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.readonly','false'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.required','true'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.size','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.step','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.tip','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.title','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.uid','\"b0450ba6-9029-4c64-bcfc-5a078d88c74d\"'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.userCondition','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.warning','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.0.width','100'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.1.dateAdded','\"2025-07-26T01:19:12+00:00\"'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.1.editCondition','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.1.elementCondition','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.1.fieldUid','\"f9c132da-5a84-4041-9cd1-5badb98df027\"'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.1.handle','\"tagline\"'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.1.includeInCards','false'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.1.instructions','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.1.label','\"Tagline\"'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.1.providesThumbs','false'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.1.required','false'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.1.tip','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.1.uid','\"5728ca67-d476-43e8-b9d1-17d1c67c909c\"'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.1.userCondition','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.1.warning','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.1.width','100'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.2.dateAdded','\"2025-07-26T01:19:12+00:00\"'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.2.editCondition','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.2.elementCondition','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.2.fieldUid','\"ea52da8a-d461-4389-b35d-295b468d26ec\"'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.2.handle','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.2.includeInCards','false'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.2.instructions','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.2.label','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.2.providesThumbs','false'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.2.required','false'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.2.tip','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.2.uid','\"df799f57-8be4-42b5-9572-d393e5f5e057\"'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.2.userCondition','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.2.warning','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.elements.2.width','100'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.name','\"Content\"'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.uid','\"f8bea537-cacf-4eee-90b8-0e9181567224\"'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.fieldLayouts.22a24743-ad50-4d6c-8b80-f1e7092bf268.tabs.0.userCondition','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.handle','\"pageBuilder\"'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.hasTitleField','true'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.icon','\"excavator\"'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.name','\"Page Builder\"'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.showSlugField','true'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.showStatusField','true'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.slugTranslationKeyFormat','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.slugTranslationMethod','\"site\"'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.titleFormat','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.titleTranslationKeyFormat','null'),('entryTypes.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9.titleTranslationMethod','\"site\"'),('fields.0a5b2601-741b-4839-913a-3a37631eabd3.columnSuffix','null'),('fields.0a5b2601-741b-4839-913a-3a37631eabd3.handle','\"lightswitch\"'),('fields.0a5b2601-741b-4839-913a-3a37631eabd3.instructions','null'),('fields.0a5b2601-741b-4839-913a-3a37631eabd3.name','\"Lightswitch\"'),('fields.0a5b2601-741b-4839-913a-3a37631eabd3.searchable','false'),('fields.0a5b2601-741b-4839-913a-3a37631eabd3.settings.default','false'),('fields.0a5b2601-741b-4839-913a-3a37631eabd3.settings.offLabel','null'),('fields.0a5b2601-741b-4839-913a-3a37631eabd3.settings.onLabel','null'),('fields.0a5b2601-741b-4839-913a-3a37631eabd3.translationKeyFormat','null'),('fields.0a5b2601-741b-4839-913a-3a37631eabd3.translationMethod','\"none\"'),('fields.0a5b2601-741b-4839-913a-3a37631eabd3.type','\"craft\\\\fields\\\\Lightswitch\"'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.columnSuffix','null'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.handle','\"sex\"'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.instructions','null'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.name','\"Sex\"'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.searchable','false'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.settings.customOptions','false'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.settings.options.0.__assoc__.0.0','\"label\"'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.settings.options.0.__assoc__.0.1','\"Female\"'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.settings.options.0.__assoc__.1.0','\"value\"'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.settings.options.0.__assoc__.1.1','\"female\"'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.settings.options.0.__assoc__.2.0','\"icon\"'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.settings.options.0.__assoc__.2.1','\"\"'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.settings.options.0.__assoc__.3.0','\"color\"'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.settings.options.0.__assoc__.3.1','\"\"'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.settings.options.0.__assoc__.4.0','\"default\"'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.settings.options.0.__assoc__.4.1','\"\"'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.settings.options.1.__assoc__.0.0','\"label\"'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.settings.options.1.__assoc__.0.1','\"Male\"'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.settings.options.1.__assoc__.1.0','\"value\"'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.settings.options.1.__assoc__.1.1','\"male\"'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.settings.options.1.__assoc__.2.0','\"icon\"'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.settings.options.1.__assoc__.2.1','\"\"'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.settings.options.1.__assoc__.3.0','\"color\"'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.settings.options.1.__assoc__.3.1','\"\"'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.settings.options.1.__assoc__.4.0','\"default\"'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.settings.options.1.__assoc__.4.1','\"\"'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.translationKeyFormat','null'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.translationMethod','\"none\"'),('fields.29c24dbb-b55b-4ebb-8124-fcfa3d0be193.type','\"craft\\\\fields\\\\Dropdown\"'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.columnSuffix','null'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.handle','\"image\"'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.instructions','null'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.name','\"Image\"'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.searchable','false'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.allowedKinds','null'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.allowSelfRelations','false'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.allowSubfolders','false'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.allowUploads','true'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.branchLimit','null'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.defaultPlacement','\"end\"'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.defaultUploadLocationSource','\"volume:1f57f4bb-af34-4cda-8fc3-858845ff8aa4\"'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.defaultUploadLocationSubpath','null'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.maintainHierarchy','false'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.maxRelations','1'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.minRelations','1'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.previewMode','\"full\"'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.restrictedDefaultUploadSubpath','null'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.restrictedLocationSource','\"volume:1f57f4bb-af34-4cda-8fc3-858845ff8aa4\"'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.restrictedLocationSubpath','null'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.restrictFiles','false'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.restrictLocation','false'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.selectionLabel','null'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.showCardsInGrid','false'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.showSearchInput','true'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.showSiteMenu','true'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.showUnpermittedFiles','false'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.showUnpermittedVolumes','false'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.sources','\"*\"'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.targetSiteId','null'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.validateRelatedElements','false'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.settings.viewMode','\"list\"'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.translationKeyFormat','null'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.translationMethod','\"none\"'),('fields.83aa7052-99d6-437a-ba10-fa6ac32b58b7.type','\"craft\\\\fields\\\\Assets\"'),('fields.94fc764c-b04d-4b16-8d91-1251539daa79.columnSuffix','null'),('fields.94fc764c-b04d-4b16-8d91-1251539daa79.handle','\"number\"'),('fields.94fc764c-b04d-4b16-8d91-1251539daa79.instructions','null'),('fields.94fc764c-b04d-4b16-8d91-1251539daa79.name','\"Number\"'),('fields.94fc764c-b04d-4b16-8d91-1251539daa79.searchable','false'),('fields.94fc764c-b04d-4b16-8d91-1251539daa79.settings.decimals','0'),('fields.94fc764c-b04d-4b16-8d91-1251539daa79.settings.defaultValue','null'),('fields.94fc764c-b04d-4b16-8d91-1251539daa79.settings.max','null'),('fields.94fc764c-b04d-4b16-8d91-1251539daa79.settings.min','0'),('fields.94fc764c-b04d-4b16-8d91-1251539daa79.settings.prefix','null'),('fields.94fc764c-b04d-4b16-8d91-1251539daa79.settings.previewCurrency','null'),('fields.94fc764c-b04d-4b16-8d91-1251539daa79.settings.previewFormat','\"decimal\"'),('fields.94fc764c-b04d-4b16-8d91-1251539daa79.settings.size','null'),('fields.94fc764c-b04d-4b16-8d91-1251539daa79.settings.step','null'),('fields.94fc764c-b04d-4b16-8d91-1251539daa79.settings.suffix','null'),('fields.94fc764c-b04d-4b16-8d91-1251539daa79.translationKeyFormat','null'),('fields.94fc764c-b04d-4b16-8d91-1251539daa79.translationMethod','\"none\"'),('fields.94fc764c-b04d-4b16-8d91-1251539daa79.type','\"craft\\\\fields\\\\Number\"'),('fields.ae845a83-cc97-41f2-933f-39acb00facae.columnSuffix','null'),('fields.ae845a83-cc97-41f2-933f-39acb00facae.handle','\"attributeSlider\"'),('fields.ae845a83-cc97-41f2-933f-39acb00facae.instructions','null'),('fields.ae845a83-cc97-41f2-933f-39acb00facae.name','\"Attribute Slider\"'),('fields.ae845a83-cc97-41f2-933f-39acb00facae.searchable','false'),('fields.ae845a83-cc97-41f2-933f-39acb00facae.settings.defaultValue','0'),('fields.ae845a83-cc97-41f2-933f-39acb00facae.settings.max','10'),('fields.ae845a83-cc97-41f2-933f-39acb00facae.settings.min','0'),('fields.ae845a83-cc97-41f2-933f-39acb00facae.settings.step','1'),('fields.ae845a83-cc97-41f2-933f-39acb00facae.settings.suffix','null'),('fields.ae845a83-cc97-41f2-933f-39acb00facae.translationKeyFormat','null'),('fields.ae845a83-cc97-41f2-933f-39acb00facae.translationMethod','\"none\"'),('fields.ae845a83-cc97-41f2-933f-39acb00facae.type','\"craft\\\\fields\\\\Range\"'),('fields.ea52da8a-d461-4389-b35d-295b468d26ec.columnSuffix','null'),('fields.ea52da8a-d461-4389-b35d-295b468d26ec.handle','\"pageBuilder\"'),('fields.ea52da8a-d461-4389-b35d-295b468d26ec.instructions','null'),('fields.ea52da8a-d461-4389-b35d-295b468d26ec.name','\"Page Builder\"'),('fields.ea52da8a-d461-4389-b35d-295b468d26ec.searchable','false'),('fields.ea52da8a-d461-4389-b35d-295b468d26ec.settings.createButtonLabel','null'),('fields.ea52da8a-d461-4389-b35d-295b468d26ec.settings.defaultIndexViewMode','\"cards\"'),('fields.ea52da8a-d461-4389-b35d-295b468d26ec.settings.enableVersioning','false'),('fields.ea52da8a-d461-4389-b35d-295b468d26ec.settings.entryTypes.0.__assoc__.0.0','\"uid\"'),('fields.ea52da8a-d461-4389-b35d-295b468d26ec.settings.entryTypes.0.__assoc__.0.1','\"20349c5d-8911-4cfc-b49c-7dc36eeb62de\"'),('fields.ea52da8a-d461-4389-b35d-295b468d26ec.settings.entryTypes.0.__assoc__.1.0','\"group\"'),('fields.ea52da8a-d461-4389-b35d-295b468d26ec.settings.entryTypes.0.__assoc__.1.1','\"General\"'),('fields.ea52da8a-d461-4389-b35d-295b468d26ec.settings.includeTableView','false'),('fields.ea52da8a-d461-4389-b35d-295b468d26ec.settings.maxEntries','null'),('fields.ea52da8a-d461-4389-b35d-295b468d26ec.settings.minEntries','null'),('fields.ea52da8a-d461-4389-b35d-295b468d26ec.settings.pageSize','50'),('fields.ea52da8a-d461-4389-b35d-295b468d26ec.settings.propagationKeyFormat','null'),('fields.ea52da8a-d461-4389-b35d-295b468d26ec.settings.propagationMethod','\"all\"'),('fields.ea52da8a-d461-4389-b35d-295b468d26ec.settings.showCardsInGrid','false'),('fields.ea52da8a-d461-4389-b35d-295b468d26ec.settings.viewMode','\"cards\"'),('fields.ea52da8a-d461-4389-b35d-295b468d26ec.translationKeyFormat','null'),('fields.ea52da8a-d461-4389-b35d-295b468d26ec.translationMethod','\"site\"'),('fields.ea52da8a-d461-4389-b35d-295b468d26ec.type','\"craft\\\\fields\\\\Matrix\"'),('fields.f9c132da-5a84-4041-9cd1-5badb98df027.columnSuffix','null'),('fields.f9c132da-5a84-4041-9cd1-5badb98df027.handle','\"plainText\"'),('fields.f9c132da-5a84-4041-9cd1-5badb98df027.instructions','null'),('fields.f9c132da-5a84-4041-9cd1-5badb98df027.name','\"Plain Text\"'),('fields.f9c132da-5a84-4041-9cd1-5badb98df027.searchable','false'),('fields.f9c132da-5a84-4041-9cd1-5badb98df027.settings.byteLimit','null'),('fields.f9c132da-5a84-4041-9cd1-5badb98df027.settings.charLimit','null'),('fields.f9c132da-5a84-4041-9cd1-5badb98df027.settings.code','false'),('fields.f9c132da-5a84-4041-9cd1-5badb98df027.settings.initialRows','4'),('fields.f9c132da-5a84-4041-9cd1-5badb98df027.settings.multiline','false'),('fields.f9c132da-5a84-4041-9cd1-5badb98df027.settings.placeholder','null'),('fields.f9c132da-5a84-4041-9cd1-5badb98df027.settings.uiMode','\"normal\"'),('fields.f9c132da-5a84-4041-9cd1-5badb98df027.translationKeyFormat','null'),('fields.f9c132da-5a84-4041-9cd1-5badb98df027.translationMethod','\"none\"'),('fields.f9c132da-5a84-4041-9cd1-5badb98df027.type','\"craft\\\\fields\\\\PlainText\"'),('fs.local.hasUrls','true'),('fs.local.name','\"Local\"'),('fs.local.settings.path','\"$CRAFT_ASSET_BASE_PATH\"'),('fs.local.type','\"craft\\\\fs\\\\Local\"'),('fs.local.url','\"$CRAFT_ASSET_BASE_URL\"'),('graphql.publicToken.enabled','false'),('graphql.publicToken.expiryDate','null'),('graphql.schemas.0f7822f0-84c2-4b34-af33-65e860071604.isPublic','true'),('graphql.schemas.0f7822f0-84c2-4b34-af33-65e860071604.name','\"Public Schema\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.isPublic','false'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.name','\"Growlr\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.0','\"sites.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e:read\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.1','\"elements.drafts:read\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.10','\"usergroups.everyone:read\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.11','\"growlr.all:read\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.12','\"sections.38f286df-6270-459e-b2a6-8f01c3f86edd:save\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.13','\"sections.f8481c59-9880-41e3-b231-24ae565d2264:edit\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.14','\"sections.f8481c59-9880-41e3-b231-24ae565d2264:create\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.15','\"sections.f8481c59-9880-41e3-b231-24ae565d2264:save\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.16','\"sections.f8481c59-9880-41e3-b231-24ae565d2264:delete\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.17','\"nestedentryfields.ea52da8a-d461-4389-b35d-295b468d26ec:edit\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.18','\"nestedentryfields.ea52da8a-d461-4389-b35d-295b468d26ec:create\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.19','\"nestedentryfields.ea52da8a-d461-4389-b35d-295b468d26ec:save\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.2','\"elements.revisions:read\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.20','\"nestedentryfields.ea52da8a-d461-4389-b35d-295b468d26ec:delete\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.21','\"volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4:edit\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.22','\"volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4:create\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.23','\"volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4:save\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.24','\"volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4:delete\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.25','\"volumes.b25edf3a-f5a9-4b45-a329-9525ef339500:edit\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.26','\"volumes.b25edf3a-f5a9-4b45-a329-9525ef339500:create\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.27','\"volumes.b25edf3a-f5a9-4b45-a329-9525ef339500:save\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.28','\"volumes.b25edf3a-f5a9-4b45-a329-9525ef339500:delete\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.29','\"volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58:edit\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.3','\"elements.inactive:read\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.30','\"volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58:create\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.31','\"volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58:save\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.32','\"volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58:delete\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.4','\"sections.38f286df-6270-459e-b2a6-8f01c3f86edd:read\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.5','\"sections.f8481c59-9880-41e3-b231-24ae565d2264:read\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.6','\"nestedentryfields.ea52da8a-d461-4389-b35d-295b468d26ec:read\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.7','\"volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4:read\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.8','\"volumes.b25edf3a-f5a9-4b45-a329-9525ef339500:read\"'),('graphql.schemas.ac08e26b-a08d-4161-a6a1-42e1fd246954.scope.9','\"volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58:read\"'),('meta.__names__.0a5b2601-741b-4839-913a-3a37631eabd3','\"Lightswitch\"'),('meta.__names__.0f7822f0-84c2-4b34-af33-65e860071604','\"Public Schema\"'),('meta.__names__.1f57f4bb-af34-4cda-8fc3-858845ff8aa4','\"Animals\"'),('meta.__names__.20349c5d-8911-4cfc-b49c-7dc36eeb62de','\"Page Modules\"'),('meta.__names__.29c24dbb-b55b-4ebb-8124-fcfa3d0be193','\"Sex\"'),('meta.__names__.360356d7-7d36-4cf2-a063-ebf63125cc00','\"Pawmates\"'),('meta.__names__.38f286df-6270-459e-b2a6-8f01c3f86edd','\"Homepage\"'),('meta.__names__.45a00e92-2550-47ce-b789-33064e5da296','\"Craft CMS Vite Tailwind\"'),('meta.__names__.704b861d-3b0b-4a66-bb5b-6e487e11ab58','\"People\"'),('meta.__names__.83aa7052-99d6-437a-ba10-fa6ac32b58b7','\"Image\"'),('meta.__names__.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e','\"Growlr\"'),('meta.__names__.94fc764c-b04d-4b16-8d91-1251539daa79','\"Number\"'),('meta.__names__.ac08e26b-a08d-4161-a6a1-42e1fd246954','\"Growlr\"'),('meta.__names__.ae845a83-cc97-41f2-933f-39acb00facae','\"Attribute Slider\"'),('meta.__names__.b25edf3a-f5a9-4b45-a329-9525ef339500','\"Site\"'),('meta.__names__.e27725a4-1f5e-4cb7-a977-8aaa9f8146b9','\"Page Builder\"'),('meta.__names__.ea52da8a-d461-4389-b35d-295b468d26ec','\"Page Builder\"'),('meta.__names__.f8481c59-9880-41e3-b231-24ae565d2264','\"Pawmates\"'),('meta.__names__.f9c132da-5a84-4041-9cd1-5badb98df027','\"Plain Text\"'),('plugins.vite.edition','\"standard\"'),('plugins.vite.enabled','true'),('plugins.vite.schemaVersion','\"1.0.0\"'),('sections.38f286df-6270-459e-b2a6-8f01c3f86edd.defaultPlacement','\"end\"'),('sections.38f286df-6270-459e-b2a6-8f01c3f86edd.enableVersioning','true'),('sections.38f286df-6270-459e-b2a6-8f01c3f86edd.entryTypes.0.uid','\"e27725a4-1f5e-4cb7-a977-8aaa9f8146b9\"'),('sections.38f286df-6270-459e-b2a6-8f01c3f86edd.handle','\"homepage\"'),('sections.38f286df-6270-459e-b2a6-8f01c3f86edd.maxAuthors','1'),('sections.38f286df-6270-459e-b2a6-8f01c3f86edd.name','\"Homepage\"'),('sections.38f286df-6270-459e-b2a6-8f01c3f86edd.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.38f286df-6270-459e-b2a6-8f01c3f86edd.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.38f286df-6270-459e-b2a6-8f01c3f86edd.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.38f286df-6270-459e-b2a6-8f01c3f86edd.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.38f286df-6270-459e-b2a6-8f01c3f86edd.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.38f286df-6270-459e-b2a6-8f01c3f86edd.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.38f286df-6270-459e-b2a6-8f01c3f86edd.propagationMethod','\"all\"'),('sections.38f286df-6270-459e-b2a6-8f01c3f86edd.siteSettings.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.enabledByDefault','true'),('sections.38f286df-6270-459e-b2a6-8f01c3f86edd.siteSettings.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.hasUrls','true'),('sections.38f286df-6270-459e-b2a6-8f01c3f86edd.siteSettings.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.template','\"index.twig\"'),('sections.38f286df-6270-459e-b2a6-8f01c3f86edd.siteSettings.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.uriFormat','\"__home__\"'),('sections.38f286df-6270-459e-b2a6-8f01c3f86edd.type','\"single\"'),('sections.f8481c59-9880-41e3-b231-24ae565d2264.defaultPlacement','\"end\"'),('sections.f8481c59-9880-41e3-b231-24ae565d2264.enableVersioning','true'),('sections.f8481c59-9880-41e3-b231-24ae565d2264.entryTypes.0.uid','\"360356d7-7d36-4cf2-a063-ebf63125cc00\"'),('sections.f8481c59-9880-41e3-b231-24ae565d2264.handle','\"pawmates\"'),('sections.f8481c59-9880-41e3-b231-24ae565d2264.maxAuthors','1'),('sections.f8481c59-9880-41e3-b231-24ae565d2264.name','\"Pawmates\"'),('sections.f8481c59-9880-41e3-b231-24ae565d2264.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.f8481c59-9880-41e3-b231-24ae565d2264.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.f8481c59-9880-41e3-b231-24ae565d2264.previewTargets.0.__assoc__.1.0','\"refresh\"'),('sections.f8481c59-9880-41e3-b231-24ae565d2264.previewTargets.0.__assoc__.1.1','\"1\"'),('sections.f8481c59-9880-41e3-b231-24ae565d2264.previewTargets.0.__assoc__.2.0','\"urlFormat\"'),('sections.f8481c59-9880-41e3-b231-24ae565d2264.previewTargets.0.__assoc__.2.1','\"{url}\"'),('sections.f8481c59-9880-41e3-b231-24ae565d2264.propagationMethod','\"all\"'),('sections.f8481c59-9880-41e3-b231-24ae565d2264.siteSettings.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.enabledByDefault','true'),('sections.f8481c59-9880-41e3-b231-24ae565d2264.siteSettings.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.hasUrls','true'),('sections.f8481c59-9880-41e3-b231-24ae565d2264.siteSettings.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.template','\"pawmates/_entry.twig\"'),('sections.f8481c59-9880-41e3-b231-24ae565d2264.siteSettings.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.uriFormat','\"pawmates/{slug}\"'),('sections.f8481c59-9880-41e3-b231-24ae565d2264.type','\"channel\"'),('siteGroups.45a00e92-2550-47ce-b789-33064e5da296.name','\"Craft CMS Vite Tailwind\"'),('sites.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.enabled','true'),('sites.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.handle','\"default\"'),('sites.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.hasUrls','true'),('sites.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.language','\"en-US\"'),('sites.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.name','\"Growlr\"'),('sites.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.primary','true'),('sites.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.siteGroup','\"45a00e92-2550-47ce-b789-33064e5da296\"'),('sites.88a82adb-74b9-4d14-b4bf-8e9a26d20d3e.sortOrder','1'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"Growlr\"'),('system.retryDuration','null'),('system.schemaVersion','\"5.8.0.3\"'),('system.timeZone','\"$TZ\"'),('users.allowPublicRegistration','false'),('users.deactivateByDefault','false'),('users.defaultGroup','\"\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.cardThumbAlignment','\"end\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elementCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.autocapitalize','true'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.autocomplete','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.autocorrect','true'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.class','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.dateAdded','\"2025-08-26T21:22:32+00:00\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.disabled','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.elementCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.id','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.includeInCards','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.inputType','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.instructions','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.label','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.max','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.min','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.name','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.orientation','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.placeholder','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.providesThumbs','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.readonly','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.requirable','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.size','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.step','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.tip','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.title','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\users\\\\UsernameField\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.uid','\"6c6dc067-be84-4ef5-be3b-75c54ff542d9\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.userCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.warning','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.0.width','100'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.attribute','\"fullName\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.autocapitalize','true'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.autocomplete','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.autocorrect','true'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.class','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.dateAdded','\"2025-08-26T21:22:32+00:00\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.disabled','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.elementCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.id','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.includeInCards','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.inputType','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.instructions','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.label','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.max','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.min','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.name','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.orientation','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.placeholder','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.providesThumbs','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.readonly','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.requirable','true'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.required','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.size','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.step','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.tip','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.title','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\users\\\\FullNameField\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.uid','\"a0d978f2-1d25-43e4-b5f9-6e2eeb643683\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.userCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.warning','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.1.width','100'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.10.dateAdded','\"2025-08-26T21:26:43+00:00\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.10.editCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.10.elementCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.10.fieldUid','\"ae845a83-cc97-41f2-933f-39acb00facae\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.10.handle','\"attractiveness\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.10.includeInCards','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.10.instructions','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.10.label','\"Attractiveness\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.10.providesThumbs','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.10.required','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.10.tip','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.10.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.10.uid','\"e05bbaef-4bc3-4348-9ea6-729bd63198d4\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.10.userCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.10.warning','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.10.width','100'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.2.dateAdded','\"2025-08-26T21:22:32+00:00\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.2.elementCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.2.id','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.2.includeInCards','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.2.instructions','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.2.label','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.2.orientation','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.2.providesThumbs','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.2.requirable','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.2.tip','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\users\\\\PhotoField\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.2.uid','\"a24e070c-ced9-4f15-9181-5dbe2599046f\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.2.userCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.2.warning','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.2.width','100'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.autocapitalize','true'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.autocomplete','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.autocorrect','true'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.class','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.dateAdded','\"2025-08-26T21:22:32+00:00\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.disabled','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.elementCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.id','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.includeInCards','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.inputType','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.instructions','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.label','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.max','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.min','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.name','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.orientation','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.placeholder','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.providesThumbs','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.readonly','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.requirable','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.size','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.step','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.tip','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.title','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\users\\\\EmailField\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.uid','\"76e1aeab-d3c3-4661-9d6f-c64023cb215c\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.userCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.3.width','100'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.4.dateAdded','\"2025-08-26T21:26:43+00:00\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.4.elementCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.4.heading','\"Pawmate Attributes\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\Heading\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.4.uid','\"29fe64aa-9adc-4168-9a6e-85043e377041\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.4.userCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.5.dateAdded','\"2025-08-26T21:26:43+00:00\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.5.editCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.5.elementCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.5.fieldUid','\"ae845a83-cc97-41f2-933f-39acb00facae\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.5.handle','\"affection\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.5.includeInCards','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.5.instructions','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.5.label','\"Affection\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.5.providesThumbs','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.5.required','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.5.tip','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.5.uid','\"3509545b-9a30-454e-b562-b40e40b7974e\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.5.userCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.5.warning','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.5.width','100'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.6.dateAdded','\"2025-08-26T21:26:43+00:00\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.6.editCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.6.elementCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.6.fieldUid','\"ae845a83-cc97-41f2-933f-39acb00facae\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.6.handle','\"activityLevel\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.6.includeInCards','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.6.instructions','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.6.label','\"Activity Level\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.6.providesThumbs','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.6.required','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.6.tip','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.6.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.6.uid','\"d911c669-4180-42bc-9682-ebd71c67b30d\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.6.userCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.6.warning','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.6.width','100'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.7.dateAdded','\"2025-08-26T21:26:43+00:00\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.7.editCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.7.elementCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.7.fieldUid','\"ae845a83-cc97-41f2-933f-39acb00facae\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.7.handle','\"bodySize\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.7.includeInCards','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.7.instructions','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.7.label','\"Body Size\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.7.providesThumbs','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.7.required','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.7.tip','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.7.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.7.uid','\"a71c6ea8-c78e-4d7c-89b7-2f0ce6dc5bdc\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.7.userCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.7.warning','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.7.width','100'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.8.dateAdded','\"2025-08-26T21:26:43+00:00\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.8.editCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.8.elementCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.8.fieldUid','\"ae845a83-cc97-41f2-933f-39acb00facae\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.8.handle','\"hairyness\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.8.includeInCards','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.8.instructions','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.8.label','\"Hairyness\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.8.providesThumbs','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.8.required','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.8.tip','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.8.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.8.uid','\"d8577821-9a6c-4fac-8bba-2e9a1b04b04c\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.8.userCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.8.warning','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.8.width','100'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.9.dateAdded','\"2025-08-26T21:26:43+00:00\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.9.editCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.9.elementCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.9.fieldUid','\"ae845a83-cc97-41f2-933f-39acb00facae\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.9.handle','\"diet\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.9.includeInCards','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.9.instructions','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.9.label','\"Diet\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.9.providesThumbs','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.9.required','false'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.9.tip','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.9.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.9.uid','\"ce0aa57c-63e6-4f62-ad39-252ee24c0e17\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.9.userCondition','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.9.warning','null'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.elements.9.width','100'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.name','\"Content\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.uid','\"7a37658e-f896-43df-99e4-7c031b5224cb\"'),('users.fieldLayouts.dac5087b-e800-4c27-82e9-3943b80a8a79.tabs.0.userCondition','null'),('users.photoSubpath','null'),('users.photoVolumeUid','\"704b861d-3b0b-4a66-bb5b-6e487e11ab58\"'),('users.require2fa','false'),('users.requireEmailVerification','true'),('users.validateOnPublicRegistration','false'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.altTranslationKeyFormat','null'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.altTranslationMethod','\"none\"'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.cardThumbAlignment','\"end\"'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elementCondition','null'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.autocapitalize','true'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.autocomplete','false'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.autocorrect','true'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.class','null'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.dateAdded','\"2025-07-29T02:22:54+00:00\"'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.disabled','false'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.elementCondition','null'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.id','null'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.includeInCards','false'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.inputType','null'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.instructions','null'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.label','null'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.max','null'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.min','null'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.name','null'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.orientation','null'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.placeholder','null'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.providesThumbs','false'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.readonly','false'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.requirable','false'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.size','null'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.step','null'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.tip','null'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.title','null'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.uid','\"b232111b-f757-4525-880f-9a3496e30501\"'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.userCondition','null'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.warning','null'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.elements.0.width','100'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.name','\"Content\"'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.uid','\"a5944e34-dc13-486a-8a95-af1997ef6fa0\"'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fieldLayouts.aed645df-ef97-4b8c-900e-4ef6d3401c22.tabs.0.userCondition','null'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.fs','\"local\"'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.handle','\"animals\"'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.name','\"Animals\"'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.sortOrder','1'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.subpath','\"animals\"'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.titleTranslationKeyFormat','null'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.titleTranslationMethod','\"site\"'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.transformFs','\"\"'),('volumes.1f57f4bb-af34-4cda-8fc3-858845ff8aa4.transformSubpath','\"\"'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.altTranslationKeyFormat','null'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.altTranslationMethod','\"none\"'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.cardThumbAlignment','\"end\"'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elementCondition','null'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.autocapitalize','true'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.autocomplete','false'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.autocorrect','true'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.class','null'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.dateAdded','\"2025-08-26T21:29:00+00:00\"'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.disabled','false'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.elementCondition','null'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.id','null'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.includeInCards','false'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.inputType','null'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.instructions','null'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.label','null'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.max','null'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.min','null'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.name','null'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.orientation','null'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.placeholder','null'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.providesThumbs','false'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.readonly','false'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.requirable','false'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.size','null'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.step','null'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.tip','null'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.title','null'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.uid','\"3caa7d7f-4385-4527-a119-d6015a8a3b16\"'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.userCondition','null'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.warning','null'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.elements.0.width','100'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.name','\"Content\"'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.uid','\"49e5e746-f101-4fd7-ae34-6350c86d16aa\"'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fieldLayouts.99c3bc96-3459-4425-9c7d-351687c573b5.tabs.0.userCondition','null'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.fs','\"local\"'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.handle','\"people\"'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.name','\"People\"'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.sortOrder','3'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.subpath','\"people\"'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.titleTranslationKeyFormat','null'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.titleTranslationMethod','\"site\"'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.transformFs','\"\"'),('volumes.704b861d-3b0b-4a66-bb5b-6e487e11ab58.transformSubpath','\"\"'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.altTranslationKeyFormat','null'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.altTranslationMethod','\"none\"'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.cardThumbAlignment','\"end\"'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elementCondition','null'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.autocapitalize','true'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.autocomplete','false'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.autocorrect','true'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.class','null'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.dateAdded','\"2025-08-26T21:28:38+00:00\"'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.disabled','false'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.elementCondition','null'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.id','null'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.includeInCards','false'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.inputType','null'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.instructions','null'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.label','null'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.max','null'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.min','null'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.name','null'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.orientation','null'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.placeholder','null'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.providesThumbs','false'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.readonly','false'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.requirable','false'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.size','null'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.step','null'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.tip','null'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.title','null'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.uid','\"14a72957-0b5f-403d-958d-bcd46281965c\"'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.userCondition','null'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.warning','null'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.elements.0.width','100'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.name','\"Content\"'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.uid','\"bd4ae1d6-801e-4281-a645-e5543211e924\"'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fieldLayouts.f52d0964-52ad-44b8-8cfd-ba52b36a7fc5.tabs.0.userCondition','null'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.fs','\"local\"'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.handle','\"site\"'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.name','\"Site\"'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.sortOrder','2'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.subpath','\"site\"'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.titleTranslationKeyFormat','null'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.titleTranslationMethod','\"site\"'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.transformFs','\"\"'),('volumes.b25edf3a-f5a9-4b45-a329-9525ef339500.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `recoverycodes`
--

LOCK TABLES `recoverycodes` WRITE;
/*!40000 ALTER TABLE `recoverycodes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `recoverycodes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES (3,5,28,NULL,26,1,'2025-08-28 06:21:46','2025-08-28 06:21:46','11fb36a6-1e19-4db6-a01f-918f216fec1a'),(6,5,7,NULL,29,1,'2025-08-28 06:24:38','2025-08-28 06:24:38','91896942-564f-4101-828c-6c742c99ad51'),(7,5,31,NULL,29,1,'2025-08-28 06:24:38','2025-08-28 06:24:38','1ee35b38-2775-495f-85d4-525fcf67016f'),(9,5,33,NULL,29,1,'2025-08-31 20:09:19','2025-08-31 20:09:19','3014c8e3-eb5f-45e0-a6de-419e94c35435'),(11,5,9,NULL,35,1,'2025-08-31 20:10:17','2025-08-31 20:10:17','f37956cd-730a-4782-aaba-97b71992efdc'),(12,5,36,NULL,35,1,'2025-08-31 20:10:17','2025-08-31 20:10:17','0757c981-8e6f-41e6-9982-b121c50ebbda'),(14,5,11,NULL,37,1,'2025-08-31 20:10:57','2025-08-31 20:10:57','910c741d-2ea4-45b8-be85-75592dfcdeab'),(15,5,39,NULL,37,1,'2025-08-31 20:10:57','2025-08-31 20:10:57','499a5af2-3c3d-44af-8853-4742a385cfdb'),(17,5,13,NULL,40,1,'2025-08-31 20:11:56','2025-08-31 20:11:56','bdfe2831-a6ac-4fd9-8b77-7ad93b41929e'),(18,5,42,NULL,40,1,'2025-08-31 20:11:56','2025-08-31 20:11:56','e8e12944-370d-4858-9a13-3b730b8ee2b6'),(20,5,15,NULL,43,1,'2025-08-31 20:12:41','2025-08-31 20:12:41','02c4b56e-58df-45f7-8113-c6261c628830'),(21,5,45,NULL,43,1,'2025-08-31 20:12:41','2025-08-31 20:12:41','90665ef8-f8d4-441b-b241-185009201eea');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,2,1,1,NULL),(2,7,1,1,NULL),(3,9,1,1,NULL),(4,11,1,1,NULL),(5,13,1,1,NULL),(6,15,1,1,NULL),(7,13,1,2,NULL),(8,18,1,1,NULL),(9,13,1,3,NULL),(10,18,1,2,NULL),(11,2,1,2,NULL),(12,7,1,2,'Applied “Draft 1”'),(13,7,1,3,'Applied “Draft 1”'),(14,7,1,4,'Applied “Draft 1”'),(15,9,1,2,'Applied “Draft 1”'),(16,11,1,2,'Applied “Draft 1”'),(17,13,1,4,'Applied “Draft 1”'),(18,15,1,2,'Applied “Draft 1”');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' ryan craftquest io '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' homepage '),(2,'title',0,1,' homepage '),(4,'slug',0,1,' temp ecjgamvhfvbouwfucidvrqothlikslmrchvv '),(4,'title',0,1,''),(5,'slug',0,1,' temp lbvokvnnytcoozxznyomyopjgsnfaozyiyom '),(5,'title',0,1,''),(6,'slug',0,1,''),(7,'slug',0,1,' maple '),(7,'title',0,1,' maple '),(9,'slug',0,1,' mochi '),(9,'title',0,1,' mochi '),(11,'slug',0,1,' poppy '),(11,'title',0,1,' poppy '),(13,'slug',0,1,' turbo '),(13,'title',0,1,' turbo '),(15,'slug',0,1,' luna '),(15,'title',0,1,' luna '),(17,'slug',0,1,''),(18,'slug',0,1,''),(25,'alt',0,1,''),(25,'extension',0,1,' jpg '),(25,'filename',0,1,' ryan jpg '),(25,'kind',0,1,' image '),(25,'slug',0,1,''),(25,'title',0,1,' ryan '),(26,'alt',0,1,''),(26,'extension',0,1,' jpg '),(26,'filename',0,1,' golden retriever jpg '),(26,'kind',0,1,' image '),(26,'slug',0,1,''),(26,'title',0,1,' golden retriever '),(29,'alt',0,1,''),(29,'extension',0,1,' jpeg '),(29,'filename',0,1,' golden retriever jpeg '),(29,'kind',0,1,' image '),(29,'slug',0,1,''),(29,'title',0,1,' golden retriever '),(35,'alt',0,1,''),(35,'extension',0,1,' jpg '),(35,'filename',0,1,' mochi jpg '),(35,'kind',0,1,' image '),(35,'slug',0,1,''),(35,'title',0,1,' mochi '),(37,'alt',0,1,''),(37,'extension',0,1,' jpeg '),(37,'filename',0,1,' poppy jpeg '),(37,'kind',0,1,' image '),(37,'slug',0,1,''),(37,'title',0,1,' poppy '),(40,'alt',0,1,''),(40,'extension',0,1,' jpeg '),(40,'filename',0,1,' turbo jpeg '),(40,'kind',0,1,' image '),(40,'slug',0,1,''),(40,'title',0,1,' turbo '),(43,'alt',0,1,''),(43,'extension',0,1,' jpeg '),(43,'filename',0,1,' luna jpeg '),(43,'kind',0,1,' image '),(43,'slug',0,1,''),(43,'title',0,1,' luna ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindexqueue`
--

LOCK TABLES `searchindexqueue` WRITE;
/*!40000 ALTER TABLE `searchindexqueue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `searchindexqueue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindexqueue_fields`
--

LOCK TABLES `searchindexqueue_fields` WRITE;
/*!40000 ALTER TABLE `searchindexqueue_fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `searchindexqueue_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Pawmates','pawmates','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-07-26 00:58:14','2025-07-26 00:58:14',NULL,'f8481c59-9880-41e3-b231-24ae565d2264'),(2,NULL,'Homepage','homepage','single',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-07-26 01:19:19','2025-07-26 01:19:19',NULL,'38f286df-6270-459e-b2a6-8f01c3f86edd');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_entrytypes` VALUES (1,1,1,NULL,NULL,NULL),(2,3,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'pawmates/{slug}','pawmates/_entry.twig',1,'2025-07-26 00:58:14','2025-07-26 00:58:14','8acd611e-a2dd-4991-ac25-bce4680f0957'),(2,2,1,1,'__home__','index.twig',1,'2025-07-26 01:19:19','2025-08-11 20:43:43','025f07aa-5bf6-4715-9807-1b5dabbe82c6');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'Craft CMS Vite Tailwind','2025-07-26 00:39:20','2025-07-26 00:39:20',NULL,'45a00e92-2550-47ce-b789-33064e5da296');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'1','Growlr','default','en-US',1,'$PRIMARY_SITE_URL',1,'2025-07-26 00:39:20','2025-07-26 00:39:20',NULL,'88a82adb-74b9-4d14-b4bf-8e9a26d20d3e');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sso_identities`
--

LOCK TABLES `sso_identities` WRITE;
/*!40000 ALTER TABLE `sso_identities` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sso_identities` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\": \"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,25,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'ryan@craftquest.io','$2y$13$MGWMAyODGGNUxnCDJLFuq.Th9GNORsxur66M3A5Q94mPduTxOuoEO','2025-09-02 19:13:48',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2025-07-26 00:39:20','2025-07-26 00:39:20','2025-09-02 19:13:48');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Animals',NULL,'2025-07-29 02:24:21','2025-08-11 18:41:55','8e55b5e4-47b7-489d-a156-61075f039cc4'),(2,NULL,NULL,'Temporary Uploads',NULL,'2025-07-29 02:24:48','2025-07-29 02:24:48','8d9f5615-08e4-4f37-bf78-8ded9d3a06ff'),(3,2,NULL,'user_1','user_1/','2025-07-29 02:24:48','2025-07-29 02:24:48','5838fee1-35d6-48ad-a2a9-5d2b04bfef26'),(4,NULL,2,'Site','','2025-08-26 21:29:59','2025-08-26 21:29:59','d19405c0-a44c-4e7d-8b2a-d4154644d167'),(5,NULL,3,'People','','2025-08-26 21:30:07','2025-08-26 21:30:07','1785c438-1046-461a-b22a-a5407d3196d6');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,5,'Animals','animals','local','animals','','','site',NULL,'none',NULL,1,'2025-07-29 02:24:21','2025-08-11 18:41:55',NULL,'1f57f4bb-af34-4cda-8fc3-858845ff8aa4'),(2,7,'Site','site','local','site','','','site',NULL,'none',NULL,2,'2025-08-26 21:29:59','2025-08-26 21:29:59',NULL,'b25edf3a-f5a9-4b45-a329-9525ef339500'),(3,8,'People','people','local','people','','','site',NULL,'none',NULL,3,'2025-08-26 21:30:07','2025-08-26 21:30:07',NULL,'704b861d-3b0b-4a66-bb5b-6e487e11ab58');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `webauthn`
--

LOCK TABLES `webauthn` WRITE;
/*!40000 ALTER TABLE `webauthn` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `webauthn` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}',1,'2025-07-26 00:40:01','2025-07-26 00:40:01','1672f658-85e6-4dfa-8110-9685589083a2'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2025-07-26 00:40:01','2025-07-26 00:40:01','936a11d7-820f-46b7-a131-2cc1f875921d'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2025-07-26 00:40:01','2025-07-26 00:40:01','5e973c23-534b-4a86-9f03-272b3b8e5634'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}',1,'2025-07-26 00:40:01','2025-07-26 00:40:01','48052537-52d2-4c5c-b100-22faf23a52fd');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-02 19:13:53
