SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accountalias
-- ----------------------------
DROP TABLE IF EXISTS `accountalias`;
CREATE TABLE `accountalias`  (
  `AliasID` int NOT NULL,
  `OriginalAccountID` int NULL DEFAULT NULL,
  `AliasName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`AliasID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for accountrelationship
-- ----------------------------
DROP TABLE IF EXISTS `accountrelationship`;
CREATE TABLE `accountrelationship`  (
  `RelationshipID` int NOT NULL,
  `AccountID1` int NULL DEFAULT NULL,
  `AccountID2` int NULL DEFAULT NULL,
  `Type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`RelationshipID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for billingaccount
-- ----------------------------
DROP TABLE IF EXISTS `billingaccount`;
CREATE TABLE `billingaccount`  (
  `BillingAccountID` int NOT NULL,
  `AccountID` int NULL DEFAULT NULL,
  `BillingDetails` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `MailboxNumber` int NULL DEFAULT NULL,
  PRIMARY KEY (`BillingAccountID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cardiovascular_chronic _disease_data
-- ----------------------------
DROP TABLE IF EXISTS `cardiovascular_chronic _disease_data`;
CREATE TABLE `cardiovascular_chronic _disease_data`  (
  `Age` int NULL DEFAULT NULL,
  `Sex` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ChestPainType` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `RestingBP` int NULL DEFAULT NULL,
  `Cholesterol` int NULL DEFAULT NULL,
  `FastingBloodSugar` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `RestingECG` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `MaxHeartRate` int NULL DEFAULT NULL,
  `ExerciseInducedAngina` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `STDepression` int NULL DEFAULT NULL,
  `STSlope` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `NumMajorVessels` int NULL DEFAULT NULL,
  `Thalassemia` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `HeartDiseaseDiagnosis` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for commission
-- ----------------------------
DROP TABLE IF EXISTS `commission`;
CREATE TABLE `commission`  (
  `CommissionID` int NOT NULL,
  `PersonID` int NULL DEFAULT NULL,
  `CommissionAmount` decimal(10, 2) NULL DEFAULT NULL,
  `CommissionDate` date NULL DEFAULT NULL,
  `InheritedCommission` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`CommissionID`) USING BTREE,
  INDEX `PersonID`(`PersonID` ASC) USING BTREE,
  CONSTRAINT `commission_ibfk_1` FOREIGN KEY (`PersonID`) REFERENCES `person` (`PersonID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract`  (
  `ContractID` int NOT NULL,
  `PersonID` int NULL DEFAULT NULL,
  `ContractType` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `PolicyDetails` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  PRIMARY KEY (`ContractID`) USING BTREE,
  INDEX `PersonID`(`PersonID` ASC) USING BTREE,
  CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`PersonID`) REFERENCES `person` (`PersonID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for healthfactors
-- ----------------------------
DROP TABLE IF EXISTS `healthfactors`;
CREATE TABLE `healthfactors`  (
  `FactorID` int NOT NULL,
  `PersonID` int NULL DEFAULT NULL,
  `FactorType` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `FactorValue` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`FactorID`) USING BTREE,
  INDEX `PersonID`(`PersonID` ASC) USING BTREE,
  CONSTRAINT `healthfactors_ibfk_1` FOREIGN KEY (`PersonID`) REFERENCES `person` (`PersonID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for managercontract
-- ----------------------------
DROP TABLE IF EXISTS `managercontract`;
CREATE TABLE `managercontract`  (
  `ManagerContractID` int NOT NULL,
  `AccountID` int NULL DEFAULT NULL,
  `AssociatePersonID` int NULL DEFAULT NULL,
  `SitCode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `WritingNumber` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `StateDOlWritingNumber` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `SitCodeDetails` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  PRIMARY KEY (`ManagerContractID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for medicalrecords
-- ----------------------------
DROP TABLE IF EXISTS `medicalrecords`;
CREATE TABLE `medicalrecords`  (
  `RecordID` int NOT NULL,
  `PersonID` int NULL DEFAULT NULL,
  `RecordDate` date NULL DEFAULT NULL,
  `ProcedureType` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ProcedureDetails` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  PRIMARY KEY (`RecordID`) USING BTREE,
  INDEX `PersonID`(`PersonID` ASC) USING BTREE,
  CONSTRAINT `medicalrecords_ibfk_1` FOREIGN KEY (`PersonID`) REFERENCES `person` (`PersonID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ml_models
-- ----------------------------
DROP TABLE IF EXISTS `ml_models`;
CREATE TABLE `ml_models`  (
  `model_id` int NOT NULL AUTO_INCREMENT,
  `model_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `model_data` longblob NULL,
  PRIMARY KEY (`model_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for patientnotes
-- ----------------------------
DROP TABLE IF EXISTS `patientnotes`;
CREATE TABLE `patientnotes`  (
  `NoteID` int NOT NULL,
  `RecordID` int NULL DEFAULT NULL,
  `NoteText` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  PRIMARY KEY (`NoteID`) USING BTREE,
  INDEX `RecordID`(`RecordID` ASC) USING BTREE,
  CONSTRAINT `patientnotes_ibfk_1` FOREIGN KEY (`RecordID`) REFERENCES `medicalrecords` (`RecordID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person`  (
  `PersonID` int NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `Age` int NULL DEFAULT NULL,
  `Gender` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`PersonID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for personrelationship
-- ----------------------------
DROP TABLE IF EXISTS `personrelationship`;
CREATE TABLE `personrelationship`  (
  `RelationshipID` int NOT NULL,
  `PersonID1` int NULL DEFAULT NULL,
  `PersonID2` int NULL DEFAULT NULL,
  `Type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`RelationshipID`) USING BTREE,
  INDEX `PersonID1`(`PersonID1` ASC) USING BTREE,
  INDEX `PersonID2`(`PersonID2` ASC) USING BTREE,
  CONSTRAINT `personrelationship_ibfk_1` FOREIGN KEY (`PersonID1`) REFERENCES `person` (`PersonID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `personrelationship_ibfk_2` FOREIGN KEY (`PersonID2`) REFERENCES `person` (`PersonID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for productioncredit
-- ----------------------------
DROP TABLE IF EXISTS `productioncredit`;
CREATE TABLE `productioncredit`  (
  `CreditID` int NOT NULL,
  `PersonID` int NULL DEFAULT NULL,
  `CreditAmount` decimal(10, 2) NULL DEFAULT NULL,
  `CreditDate` date NULL DEFAULT NULL,
  PRIMARY KEY (`CreditID`) USING BTREE,
  INDEX `PersonID`(`PersonID` ASC) USING BTREE,
  CONSTRAINT `productioncredit_ibfk_1` FOREIGN KEY (`PersonID`) REFERENCES `person` (`PersonID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
