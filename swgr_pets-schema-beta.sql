-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: swgr_pets
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bonus_groups`
--

DROP TABLE IF EXISTS `bonus_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bonus_groups` (
  `bg_id` int NOT NULL AUTO_INCREMENT,
  `bg_name` varchar(256) DEFAULT NULL,
  `armor` decimal(3,2) DEFAULT NULL,
  `block_chance` decimal(3,2) DEFAULT NULL,
  `block_rating` decimal(3,2) DEFAULT NULL,
  `dodge` decimal(3,2) DEFAULT NULL,
  `parry` decimal(3,2) DEFAULT NULL,
  `evasion` decimal(3,2) DEFAULT NULL,
  `evasion_rating` decimal(3,2) DEFAULT NULL,
  `dps` decimal(3,2) DEFAULT NULL,
  `crit_hit` decimal(3,2) DEFAULT NULL,
  `strikethrough` decimal(3,2) DEFAULT NULL,
  `strikethrough_rating` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`bg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_damagetype`
--

DROP TABLE IF EXISTS `creature_damagetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_damagetype` (
  `dt_id` int NOT NULL AUTO_INCREMENT,
  `dt_name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`dt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_difficulty`
--

DROP TABLE IF EXISTS `creature_difficulty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_difficulty` (
  `diff_id` int NOT NULL AUTO_INCREMENT,
  `diff_name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`diff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_harvest_resource`
--

DROP TABLE IF EXISTS `creature_harvest_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_harvest_resource` (
  `hr_id` int NOT NULL AUTO_INCREMENT,
  `hr_category` varchar(10) DEFAULT NULL,
  `hr_name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`hr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_planet`
--

DROP TABLE IF EXISTS `creature_planet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_planet` (
  `cp_id` int NOT NULL AUTO_INCREMENT,
  `creature_id` int DEFAULT NULL,
  `planet_id` int DEFAULT NULL,
  PRIMARY KEY (`cp_id`),
  KEY `fk_creatureplanet_planetid_idx` (`planet_id`),
  KEY `fk_creatureplanet_creatureid_idx` (`creature_id`),
  CONSTRAINT `fk_creatureplanet_creatureid` FOREIGN KEY (`creature_id`) REFERENCES `creatures` (`c_id`),
  CONSTRAINT `fk_creatureplanet_planetid` FOREIGN KEY (`planet_id`) REFERENCES `planet_list` (`pl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1772 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_related`
--

DROP TABLE IF EXISTS `creature_related`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_related` (
  `cr_id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `related_id` int DEFAULT NULL,
  PRIMARY KEY (`cr_id`),
  KEY `fk_creaturerelated_parent_idx` (`parent_id`),
  KEY `fk_creaturerelated_related_idx` (`related_id`),
  CONSTRAINT `fk_creaturerelated_parent` FOREIGN KEY (`parent_id`) REFERENCES `creatures` (`c_id`),
  CONSTRAINT `fk_creaturerelated_related` FOREIGN KEY (`related_id`) REFERENCES `creatures` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11673 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creatures`
--

DROP TABLE IF EXISTS `creatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creatures` (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `c_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `c_type_id` int DEFAULT NULL,
  `ExtractableDNA` tinyint DEFAULT NULL,
  `Missions` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Slayer` tinyint DEFAULT NULL,
  `Difficulty_id` int DEFAULT NULL,
  `DamageType_id` int DEFAULT NULL,
  `Deathblow` tinyint DEFAULT NULL,
  `AggressionRange` smallint DEFAULT NULL,
  `AssistRange` smallint DEFAULT NULL,
  `BoneTypeId` int DEFAULT NULL,
  `HideTypeId` int DEFAULT NULL,
  `MeatTypeId` int DEFAULT NULL,
  `MilkTypeId` int DEFAULT NULL,
  `OtherInfo` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `special1` int DEFAULT NULL,
  `special2` int DEFAULT NULL,
  `special3` int DEFAULT NULL,
  `special4` int DEFAULT NULL,
  `special5` int DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  KEY `fk_creatures_type_idx` (`c_type_id`),
  KEY `fk_creatures_Difficulty_idx` (`Difficulty_id`),
  KEY `fk_creatures_DamageType_idx` (`DamageType_id`),
  KEY `fk_creatures_BoneType_idx` (`BoneTypeId`),
  KEY `fk_creatures_HideType_idx` (`HideTypeId`),
  KEY `fk_creatures_MeatType_idx` (`MeatTypeId`),
  KEY `fk_creatures_MilkType_idx` (`MilkTypeId`),
  KEY `fk_creatures_Special1_idx` (`special1`),
  KEY `fk_creatures_Special2_idx` (`special2`),
  KEY `fk_creatures_Special3_idx` (`special3`),
  KEY `fk_creatures_Special4_idx` (`special4`),
  KEY `fk_creatures_Special5_idx` (`special5`),
  CONSTRAINT `fk_creatures_BoneType` FOREIGN KEY (`BoneTypeId`) REFERENCES `creature_harvest_resource` (`hr_id`),
  CONSTRAINT `fk_creatures_DamageType` FOREIGN KEY (`DamageType_id`) REFERENCES `creature_damagetype` (`dt_id`),
  CONSTRAINT `fk_creatures_Difficulty` FOREIGN KEY (`Difficulty_id`) REFERENCES `creature_difficulty` (`diff_id`),
  CONSTRAINT `fk_creatures_HideType` FOREIGN KEY (`HideTypeId`) REFERENCES `creature_harvest_resource` (`hr_id`),
  CONSTRAINT `fk_creatures_MeatType` FOREIGN KEY (`MeatTypeId`) REFERENCES `creature_harvest_resource` (`hr_id`),
  CONSTRAINT `fk_creatures_MilkType` FOREIGN KEY (`MilkTypeId`) REFERENCES `creature_harvest_resource` (`hr_id`),
  CONSTRAINT `fk_creatures_Special1` FOREIGN KEY (`special1`) REFERENCES `specials` (`sp_id`),
  CONSTRAINT `fk_creatures_Special2` FOREIGN KEY (`special2`) REFERENCES `specials` (`sp_id`),
  CONSTRAINT `fk_creatures_Special3` FOREIGN KEY (`special3`) REFERENCES `specials` (`sp_id`),
  CONSTRAINT `fk_creatures_Special4` FOREIGN KEY (`special4`) REFERENCES `specials` (`sp_id`),
  CONSTRAINT `fk_creatures_Special5` FOREIGN KEY (`special5`) REFERENCES `specials` (`sp_id`),
  CONSTRAINT `fk_creatures_type` FOREIGN KEY (`c_type_id`) REFERENCES `master_creature` (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1273 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dna_source`
--

DROP TABLE IF EXISTS `dna_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dna_source` (
  `src_id` int NOT NULL AUTO_INCREMENT,
  `src_name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`src_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `isomerase_colors`
--

DROP TABLE IF EXISTS `isomerase_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `isomerase_colors` (
  `ic_id` int NOT NULL AUTO_INCREMENT,
  `iso_color` varchar(256) NOT NULL,
  PRIMARY KEY (`ic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lyase_colors`
--

DROP TABLE IF EXISTS `lyase_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lyase_colors` (
  `lc_id` int NOT NULL AUTO_INCREMENT,
  `lc_color` varchar(256) NOT NULL,
  PRIMARY KEY (`lc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `master_creature`
--

DROP TABLE IF EXISTS `master_creature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_creature` (
  `m_id` int NOT NULL AUTO_INCREMENT,
  `creature_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `master_specials`
--

DROP TABLE IF EXISTS `master_specials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_specials` (
  `s_id` int NOT NULL AUTO_INCREMENT,
  `sp_name` varchar(256) NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mutation_outcome`
--

DROP TABLE IF EXISTS `mutation_outcome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mutation_outcome` (
  `mut_id` int NOT NULL AUTO_INCREMENT,
  `mut_name` varchar(256) DEFAULT NULL,
  `pet_id` int DEFAULT NULL,
  PRIMARY KEY (`mut_id`),
  KEY `fk_mutationoutcome_pid_idx` (`pet_id`),
  CONSTRAINT `fk_mutationoutcome_pid` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pet_family`
--

DROP TABLE IF EXISTS `pet_family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_family` (
  `f_id` int NOT NULL AUTO_INCREMENT,
  `f_name` varchar(256) NOT NULL,
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pets` (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `p_name_id` int DEFAULT NULL,
  `family_id` int DEFAULT NULL,
  `Supplement` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Mountable` tinyint DEFAULT NULL,
  `Flyer` tinyint DEFAULT NULL,
  `dna_src_id` int DEFAULT NULL,
  `MutationSource1` varchar(45) DEFAULT NULL,
  `MutationSource2` varchar(45) DEFAULT NULL,
  `MissionTermOptions` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `BonusGroup` int DEFAULT NULL,
  `dna_harvest` varchar(1000) DEFAULT NULL,
  `firstmut_outcome_id` int DEFAULT NULL,
  `firstmut_lyase_id` int DEFAULT NULL,
  `firstmut_topiso_id` int DEFAULT NULL,
  `firstmut_botiso_id` int DEFAULT NULL,
  `secmut_outcome_id` int DEFAULT NULL,
  `secmut_lyase_id` int DEFAULT NULL,
  `secmut_topiso_id` int DEFAULT NULL,
  `secmut_botiso_id` int DEFAULT NULL,
  `thirdmut_outcome_id` int DEFAULT NULL,
  `thirdmut_lyase_id` int DEFAULT NULL,
  `thirdmut_topiso_id` int DEFAULT NULL,
  `thirdmut_botiso_id` int DEFAULT NULL,
  `special1` int DEFAULT NULL,
  `special2` int DEFAULT NULL,
  `special3` int DEFAULT NULL,
  `special4` int DEFAULT NULL,
  `special5` int DEFAULT NULL,
  `special6` int DEFAULT NULL,
  `special7` int DEFAULT NULL,
  `pet_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  KEY `fk_p_name_id_idx` (`p_name_id`),
  KEY `fk_family_id_idx` (`family_id`),
  KEY `fk_dnasrc_id_idx` (`dna_src_id`),
  KEY `fk_BonusGroup_idx` (`BonusGroup`),
  KEY `fk_pets_FirstMut_Outcome_idx` (`firstmut_outcome_id`),
  KEY `fk_pets_FirstMut_Lyase_idx` (`firstmut_lyase_id`),
  KEY `fk_pets_FirstMut_TopIso_idx` (`firstmut_topiso_id`),
  KEY `fk_pets_FirstMut_BotIso_idx` (`firstmut_botiso_id`),
  KEY `fk_pets_SecMut_Outcome_idx` (`secmut_outcome_id`),
  KEY `fk_pets_SecMut_Lyase_idx` (`secmut_lyase_id`),
  KEY `fk_pets_SecMut_TopIso_idx` (`secmut_topiso_id`),
  KEY `fk_pets_SecMut_BotIso_idx` (`secmut_botiso_id`),
  KEY `fk_pets_ThirdMut_Outcome_idx` (`thirdmut_outcome_id`),
  KEY `fk_pets_ThirdMut_Lyase_idx` (`thirdmut_lyase_id`),
  KEY `fk_pets_ThirdMut_TopIso_idx` (`thirdmut_topiso_id`),
  KEY `fk_pets_ThirdMut_BotIso_idx` (`thirdmut_botiso_id`),
  KEY `fk_pets_Special1_idx` (`special1`),
  KEY `fk_pets_Special2_idx` (`special2`),
  KEY `fk_pets_Special3_idx` (`special3`),
  KEY `fk_pets_Special4_idx` (`special4`),
  KEY `fk_pets_Special5_idx` (`special5`),
  KEY `fk_pets_Special6_idx` (`special6`),
  KEY `fk_pets_Special7_idx` (`special7`),
  CONSTRAINT `fk_pets_BonusGroup` FOREIGN KEY (`BonusGroup`) REFERENCES `bonus_groups` (`bg_id`),
  CONSTRAINT `fk_pets_dnasrc` FOREIGN KEY (`dna_src_id`) REFERENCES `dna_source` (`src_id`),
  CONSTRAINT `fk_pets_family` FOREIGN KEY (`family_id`) REFERENCES `pet_family` (`f_id`),
  CONSTRAINT `fk_pets_FirstMut_BotIso` FOREIGN KEY (`firstmut_botiso_id`) REFERENCES `isomerase_colors` (`ic_id`),
  CONSTRAINT `fk_pets_FirstMut_Lyase` FOREIGN KEY (`firstmut_lyase_id`) REFERENCES `lyase_colors` (`lc_id`),
  CONSTRAINT `fk_pets_FirstMut_Outcome` FOREIGN KEY (`firstmut_outcome_id`) REFERENCES `mutation_outcome` (`mut_id`),
  CONSTRAINT `fk_pets_FirstMut_TopIso` FOREIGN KEY (`firstmut_topiso_id`) REFERENCES `isomerase_colors` (`ic_id`),
  CONSTRAINT `fk_pets_p_name` FOREIGN KEY (`p_name_id`) REFERENCES `master_creature` (`m_id`),
  CONSTRAINT `fk_pets_SecMut_BotIso` FOREIGN KEY (`secmut_botiso_id`) REFERENCES `isomerase_colors` (`ic_id`),
  CONSTRAINT `fk_pets_SecMut_Lyase` FOREIGN KEY (`secmut_lyase_id`) REFERENCES `lyase_colors` (`lc_id`),
  CONSTRAINT `fk_pets_SecMut_Outcome` FOREIGN KEY (`secmut_outcome_id`) REFERENCES `mutation_outcome` (`mut_id`),
  CONSTRAINT `fk_pets_SecMut_TopIso` FOREIGN KEY (`secmut_topiso_id`) REFERENCES `isomerase_colors` (`ic_id`),
  CONSTRAINT `fk_pets_Special1` FOREIGN KEY (`special1`) REFERENCES `master_specials` (`s_id`),
  CONSTRAINT `fk_pets_Special2` FOREIGN KEY (`special2`) REFERENCES `master_specials` (`s_id`),
  CONSTRAINT `fk_pets_Special3` FOREIGN KEY (`special3`) REFERENCES `master_specials` (`s_id`),
  CONSTRAINT `fk_pets_Special4` FOREIGN KEY (`special4`) REFERENCES `master_specials` (`s_id`),
  CONSTRAINT `fk_pets_Special5` FOREIGN KEY (`special5`) REFERENCES `master_specials` (`s_id`),
  CONSTRAINT `fk_pets_Special6` FOREIGN KEY (`special6`) REFERENCES `master_specials` (`s_id`),
  CONSTRAINT `fk_pets_Special7` FOREIGN KEY (`special7`) REFERENCES `master_specials` (`s_id`),
  CONSTRAINT `fk_pets_ThirdMut_BotIso` FOREIGN KEY (`thirdmut_botiso_id`) REFERENCES `isomerase_colors` (`ic_id`),
  CONSTRAINT `fk_pets_ThirdMut_Lyase` FOREIGN KEY (`thirdmut_lyase_id`) REFERENCES `lyase_colors` (`lc_id`),
  CONSTRAINT `fk_pets_ThirdMut_Outcome` FOREIGN KEY (`thirdmut_outcome_id`) REFERENCES `mutation_outcome` (`mut_id`),
  CONSTRAINT `fk_pets_ThirdMut_TopIso` FOREIGN KEY (`thirdmut_topiso_id`) REFERENCES `isomerase_colors` (`ic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pets_related`
--

DROP TABLE IF EXISTS `pets_related`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pets_related` (
  `pr_id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `related_id` int DEFAULT NULL,
  PRIMARY KEY (`pr_id`),
  KEY `fk_pets_parent_idx` (`parent_id`),
  KEY `fk_pets_related_idx` (`related_id`),
  CONSTRAINT `fk_pets_parent` FOREIGN KEY (`parent_id`) REFERENCES `pets` (`p_id`),
  CONSTRAINT `fk_pets_related` FOREIGN KEY (`related_id`) REFERENCES `creatures` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1061 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `planet_list`
--

DROP TABLE IF EXISTS `planet_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planet_list` (
  `pl_id` int NOT NULL AUTO_INCREMENT,
  `pl_name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`pl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `specials`
--

DROP TABLE IF EXISTS `specials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specials` (
  `sp_id` int NOT NULL AUTO_INCREMENT,
  `master_id` int DEFAULT NULL,
  `sp_name` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `sp_effect` varchar(256) DEFAULT NULL,
  `action_cost` int DEFAULT NULL,
  `refresh_seconds` int DEFAULT NULL,
  `other_info` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `train_cl` int DEFAULT NULL,
  `train_loyalty` varchar(45) DEFAULT NULL,
  `modifier` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`sp_id`),
  KEY `fk_specials_master_idx` (`master_id`),
  CONSTRAINT `fk_specials_master` FOREIGN KEY (`master_id`) REFERENCES `master_specials` (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-24 16:53:17
