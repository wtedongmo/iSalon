
DROP TABLE IF EXISTS `Icon`;
CREATE TABLE `Icon` (
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Icon
-- ----------------------------
INSERT INTO `Icon` VALUES ('fa  fa-institution');
INSERT INTO `Icon` VALUES ('fa fa-calendar');
INSERT INTO `Icon` VALUES ('fa fa-graduation-cap');
INSERT INTO `Icon` VALUES ('fa fa-money');
INSERT INTO `Icon` VALUES ('fa fa-wrench');
INSERT INTO `Icon` VALUES ('fa fa-wreng');
INSERT INTO `Icon` VALUES ('fa icon-settings');

DROP TABLE IF EXISTS `Jour`;
CREATE TABLE `Jour` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Jour
-- ----------------------------
INSERT INTO `Jour` VALUES ('1', 'Lundi');
INSERT INTO `Jour` VALUES ('2', 'Mardi');
INSERT INTO `Jour` VALUES ('3', 'Mercredi');
INSERT INTO `Jour` VALUES ('4', 'Jeudi');
INSERT INTO `Jour` VALUES ('5', 'Vendredi');


DROP TABLE IF EXISTS mouvementpuce;
DROP TABLE IF EXISTS puce;
DROP TABLE IF EXISTS paiement;
DROP TABLE IF EXISTS comptepersonne;
DROP TABLE IF EXISTS personne;
CREATE TABLE personne (
  code int(11) NOT NULL AUTO_INCREMENT,
  nom_prenom varchar(100) NOT NULL,
  numeroCNI varchar(100) DEFAULT NULL,
  telephone varchar(25) DEFAULT NULL,
  telephone_mobile varchar(25) DEFAULT NULL,
  categorie int(11) DEFAULT NULL,
  date_naissance date DEFAULT NULL,
  lieu_naissance varchar(100) DEFAULT NULL,
  email_adresse varchar(100) DEFAULT NULL,
  PRIMARY KEY (code)
) ;


DROP TABLE IF EXISTS comptepersonne;
CREATE TABLE comptepersonne (
  code int(11) NOT NULL AUTO_INCREMENT,
  libelle varchar(100) DEFAULT NULL,
  code_personne int(11) DEFAULT NULL,
  type_compte varchar(50) DEFAULT NULL,
  categorie_personne varchar(50) DEFAULT NULL,
  credit double DEFAULT NULL,
  debit double DEFAULT NULL,
  PRIMARY KEY (code),
  KEY FK_eqwc3up4p29u3hv9hudxl2kjr (code_personne),
  CONSTRAINT FK_eqwc3up4p29u3hv9hudxl2kjr FOREIGN KEY (code_personne) REFERENCES personne (code)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `Rubrique`;
DROP TABLE IF EXISTS `Menu`;
CREATE TABLE `Menu` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  `code_icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `UK_oytepumsam0jvxieqkuti3ihu` (`libelle`),
  KEY `FK_s248ipg025n7ghnwte6yma0lg` (`code_icon`),
  CONSTRAINT `FK_s248ipg025n7ghnwte6yma0lg` FOREIGN KEY (`code_icon`) REFERENCES `Icon` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `Menu` VALUES ('1', 'Timetable', 'fa fa-calendar');
INSERT INTO `Menu` VALUES ('2', 'Securite', 'fa icon-settings');
INSERT INTO `Menu` VALUES ('6', 'Finance', 'fa fa-money');
INSERT INTO `Menu` VALUES ('5', 'Personnel', 'fa  fa-institution');
INSERT INTO `Menu` VALUES ('7', 'Parametrage', 'fa icon-settings');


DROP TABLE IF EXISTS typetransfert;

CREATE TABLE typetransfert (
  code int(11) primary key AUTO_INCREMENT,
  libelle varchar(50) NOT NULL
 ) ;
-- INSERT INTO typetransfert VALUES (1,'AGENT_CLIENT',NULL,NULL,NULL,NULL,NULL),(2,'DELEGATE_VENDOR',NULL,NULL,NULL,NULL,NULL),(3,'DISTRIBUTOR_AGENT',NULL,NULL,NULL,NULL,NULL),(4,'DISTRIBUTOR_DELEGATE',NULL,NULL,NULL,NULL,NULL),(5,'DISTRIBUTOR_VENDOR',NULL,NULL,NULL,NULL,NULL),(6,'MTN_DISTRIBUTOR',NULL,NULL,NULL,NULL,NULL),(7,'VENDOR_CLIENT',NULL,NULL,NULL,NULL,NULL);

DROP TABLE IF EXISTS puce;

CREATE TABLE puce (
  code int(11) NOT NULL AUTO_INCREMENT,
  msisdn varchar(25) DEFAULT NULL,
  compte_proprietaire int(11) DEFAULT NULL,
  balance double DEFAULT NULL,
  compte_auxiliaire int(11) DEFAULT NULL,
  PRIMARY KEY (code),
  KEY FK_3y2pn1l7mk6lw3f3a9vo6ey8t (compte_auxiliaire),
  KEY FK_kuv0wio7kxv8xocginjikeudx (compte_proprietaire),
  CONSTRAINT FK_3y2pn1l7mk6lw3f3a9vo6ey8t FOREIGN KEY (compte_auxiliaire) REFERENCES comptepersonne (code),
  CONSTRAINT FK_kuv0wio7kxv8xocginjikeudx FOREIGN KEY (compte_proprietaire) REFERENCES comptepersonne (code)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS mouvementpuce;

CREATE TABLE mouvementpuce (
  code int(11) NOT NULL AUTO_INCREMENT,
  code_puce_source int(11) DEFAULT NULL,
  code_puce_destination int(11) DEFAULT NULL,
  reference varchar(50) DEFAULT NULL,
  sens_transfert int(11) DEFAULT NULL,
  type_transfert int(11) DEFAULT NULL,
  balance double DEFAULT NULL,
  date_operation date DEFAULT NULL,
  heure_operation time DEFAULT NULL,
  montant double DEFAULT NULL,
  balance_destination double DEFAULT NULL,
  PRIMARY KEY (code),
  KEY FK_jle7vkoh4dwloxvv339039du2 (code_puce_destination),
  KEY FK_9rfisklyif6akmgpm1w1b4nsw (code_puce_source),
  CONSTRAINT FK_9rfisklyif6akmgpm1w1b4nsw FOREIGN KEY (code_puce_source) REFERENCES puce (code),
  CONSTRAINT FK_jle7vkoh4dwloxvv339039du2 FOREIGN KEY (code_puce_destination) REFERENCES puce (code)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS paiement;

CREATE TABLE paiement (
  code int(11) NOT NULL AUTO_INCREMENT,
  compte_client int(11) DEFAULT NULL,
  compte_fournisseur int(11) DEFAULT NULL,
  date_paiement datetime DEFAULT NULL,
  sens varchar(15) DEFAULT NULL,
  montant double DEFAULT NULL,
  objet varchar(100) DEFAULT NULL,
  reference varchar(50) DEFAULT NULL,
  PRIMARY KEY (code),
  KEY FK_87d1j278w62t9x5ckifj8inbv (compte_client),
  KEY FK_s8mn64p6nyuurgcr2jeu08wyw (compte_fournisseur),
  CONSTRAINT FK_87d1j278w62t9x5ckifj8inbv FOREIGN KEY (compte_client) REFERENCES comptepersonne (code),
  CONSTRAINT FK_s8mn64p6nyuurgcr2jeu08wyw FOREIGN KEY (compte_fournisseur) REFERENCES comptepersonne (code)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS parametre;
CREATE TABLE parametre (
  codeparams varchar(100) NOT NULL,
  libelle varchar(100) DEFAULT NULL,
  valeur text DEFAULT NULL,
  description text,
  code int(11) primary key  AUTO_INCREMENT
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO parametre (codeparams, libelle, valeur) values ('default.chemin.image.entete','Image Entete','localhost:8082/entete.png'),('default.compte','Compte Compte personne par défaut','12'),('default.compte.cleint','Compte client par défaut','11'),('default.compte.fournisseur','Compte fournisseur par défaut','2');


DROP TABLE IF EXISTS `Rubrique`;
CREATE TABLE `Rubrique` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `form_description` longtext,
  `grille_description` longtext,
  `libelle` varchar(100) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `code_menu` int(11) NOT NULL,
  `code_icon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `UK_iq9gkoroq3dd39wu3etcwyteu` (`libelle`),
  KEY `FK_f4dxpxlidlvajy7gy6ylh6qgu` (`code_menu`),
  KEY `FK_9sggkqtdrwawrwbv1l2o3ox1k` (`code_icon`),
  CONSTRAINT `FK_9sggkqtdrwawrwbv1l2o3ox1k` FOREIGN KEY (`code_icon`) REFERENCES `Icon` (`code`),
  CONSTRAINT `FK_f4dxpxlidlvajy7gy6ylh6qgu` FOREIGN KEY (`code_menu`) REFERENCES `Menu` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Rubrique
-- ----------------------------
INSERT INTO `Rubrique` VALUES ('2', null, null, 'User', 'User', '2', null);
INSERT INTO `Rubrique` VALUES ('3', null, null, 'Comptepersonne', 'Comptepersonne', '5', null);
INSERT INTO `Rubrique` VALUES ('4', null, null, 'Personne', 'Personne', '5', null);
INSERT INTO `Rubrique` VALUES ('5', null, null, 'Clotureperiode', 'Clotureperiode', '2', null);
INSERT INTO `Rubrique` VALUES ('15', null, null, 'Menu', 'Menu', '2', null);
INSERT INTO `Rubrique` VALUES ('18', null, null, 'Droit', 'Droit', '2', null);
INSERT INTO `Rubrique` VALUES ('20', null, null, 'Profil', 'Profil', '2', null);
INSERT INTO `Rubrique` VALUES ('23', null, null, 'Facture', 'Facture', '6', null);
INSERT INTO `Rubrique` VALUES ('24', null, null, 'Detail Facture', 'DetailFacture', '6', null);
INSERT INTO `Rubrique` VALUES ('25', null, null, 'Rubrique', 'Rubrique', '2', null);
INSERT INTO `Rubrique` VALUES ('26', null, null, 'Caisse', 'Caisse', '2', null);
INSERT INTO `Rubrique` VALUES ('29', null, null, 'Services', 'Services', '2', null);
INSERT INTO `Rubrique` VALUES ('33', null, null, 'Produit', 'Produit', '6', null);
INSERT INTO `Rubrique` VALUES ('34', null, null, 'Paiement', 'Paiement', '6', null);
INSERT INTO `Rubrique` VALUES ('35', null, null, 'Icon', 'Icon', '2', null);
INSERT INTO `Rubrique` VALUES ('36', null, null, 'UserProfil', 'UserProfil', '2', null);


DROP TABLE IF EXISTS `Services`;
CREATE TABLE `Services` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `libelle` varchar(100) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `UK_re35qlkavuinfhlwj0x20b1nm` (`libelle`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `cycle_vie` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `email_adresse` varchar(100) DEFAULT NULL,
  `telephone_mobile` varchar(100) DEFAULT NULL,
  `civilite` varchar(255) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `lieu_naissance` varchar(100) DEFAULT NULL,
  `nom_prenom` varchar(255) NOT NULL,
  `numero_cni` int(11) DEFAULT NULL,
  `accountNonExpired` bit(1) DEFAULT NULL,
  `date_changementpwd` datetime DEFAULT NULL,
  `date_expirationpwd` datetime DEFAULT NULL,
  `lastaccessdate` datetime DEFAULT NULL,
  `login_attempts` tinyint(4) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `question_secrete` varchar(255) DEFAULT NULL,
  `reponse_question_secrete` varchar(255) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `code_createur` int(11) DEFAULT NULL,
  `code_modificateur` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `UK_jreodf78a7pl5qidfh43axdfb` (`username`),
  KEY `FK_fvt5ciaahuniadlm0ymjf9onc` (`code_createur`),
  KEY `FK_rdye15peix89i7cdybfgc5b9q` (`code_modificateur`),
  CONSTRAINT `FK_fvt5ciaahuniadlm0ymjf9onc` FOREIGN KEY (`code_createur`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_rdye15peix89i7cdybfgc5b9q` FOREIGN KEY (`code_modificateur`) REFERENCES `User` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of User
-- ----------------------------
INSERT INTO `User` VALUES ('1', null, '2015-08-31 10:45:47', 'ACTIF', '', 'csuarez@b1zmail.org', '237 29728131', null, null, 'Dixie', 'Lindsey Craft', null, '', '2015-08-31 10:45:38', '2016-02-29 10:45:38', '2015-08-31 10:45:47', '0', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'papa', 'fad9a0a6f25df623a055091fe7e403534c7e9536', 'admin', null, '1');
INSERT INTO `User` VALUES ('2', '2015-08-27 20:32:41', null, 'ACTIF', null, 'aretrees@everyma1l.net', '237 56551235', null, '1973-12-14', 'Ellijay', 'Nancy Stevens', null, '', null, null, null, '0', '93f9892cb654d0de9ccf4a903a85841d4faa94ed', null, null, 'O''neill', null, null);
INSERT INTO `User` VALUES ('3', '2015-08-27 20:32:41', null, 'ACTIF', null, 'kelliott@ma1l2u.net', '237 76557336', null, '1972-03-04', 'Rome', 'Janet Abbott', null, '', null, null, null, '0', '4d6d294d6601c7a4bb7f36f2133a749685a35a20', null, null, 'Suarez', null, null);
INSERT INTO `User` VALUES ('4', '2015-08-27 20:32:41', null, 'ACTIF', null, 'fdrake@yah00.biz', '237 49470058', null, '1977-01-12', 'Louisville', 'Marty Franco', null, '', null, null, null, '0', 'a90de9701e67a358423874204d032971f44aa671', null, null, 'Dunn', null, null);
INSERT INTO `User` VALUES ('5', '2015-08-27 20:32:41', null, 'ACTIF', null, 'theof@ma1l2u.com', '237 18422948', null, '1961-04-04', 'Donalsonville', 'Michael Gross', null, '', null, null, null, '0', '2b28d1cd5b792fa708e928e31ce80d0772ca71da', null, null, 'Schneider', null, null);
INSERT INTO `User` VALUES ('6', '2015-08-27 20:32:41', null, 'ACTIF', null, 'hlarson@gma1l.com', '237 43931350', null, '1964-08-22', 'Atlanta', 'Patrick Walker', null, '', null, null, null, '0', '8413dfbfdc785f396b85aa5e9aa87c58c9caf0f2', null, null, 'Richardson', null, null);
INSERT INTO `User` VALUES ('7', '2015-08-27 20:32:41', null, 'ACTIF', null, 'wheath43@ma1l2u.org', '237 63930850', null, '1969-05-07', 'Darien', 'Carrie McDowell', null, '', null, null, null, '0', '868c9f5323309397b8934005f3dddce4fa2193fc', null, null, 'Chang', null, null);
INSERT INTO `User` VALUES ('8', '2015-08-27 20:32:41', null, 'ACTIF', null, 'diedcame@b1zmail.co.uk', '237 36151883', null, '1968-05-14', 'Chula', 'Sharon Fuentes', null, '', null, null, null, '0', '77cdd861e986d3dfc6279c044f3b7561243adf24', null, null, 'Daugherty', null, null);
INSERT INTO `User` VALUES ('9', '2015-08-27 20:32:41', null, 'ACTIF', null, 'ksherman31@ma1l2u.us', '237 15931747', null, '1974-11-16', 'Dupont', 'Ralph Logan', null, '', null, null, null, '0', '6e7f4c6b99bfd07f34928d4325175ac99dfa6844', null, null, 'Cotton', null, null);
INSERT INTO `User` VALUES ('10', '2015-08-27 20:32:41', null, 'ACTIF', null, 'eblevins@gma1l.co.uk', '237 98894618', null, '1961-12-17', 'Bloomingdale', 'Kyle Dudley', null, '', null, null, null, '0', '4b5f11b4a597f1401798aaac31ccff812cb08a59', null, null, 'Howell', null, null);
INSERT INTO `User` VALUES ('11', '2015-08-27 20:32:41', null, 'ACTIF', null, 'islandon@everyma1l.us', '237 85811963', null, '1975-08-25', 'Dawsonville', 'Jeffrey Collins', null, '', null, null, null, '0', '4bdba3d7565a762da2da4073cd27c331ba78f6d0', null, null, 'Weber', null, null);
INSERT INTO `User` VALUES ('12', '2015-08-27 20:32:41', null, 'ACTIF', null, 'camesidekick@gma1l.co.uk', '237 02450273', null, '1954-07-18', 'Norcross', 'Marlene Mays', null, '', null, null, null, '0', '23b1bcb69bb91dec50bb13e875fb9401ed3d2cf6', null, null, 'Cleveland', null, null);
INSERT INTO `User` VALUES ('13', '2015-08-27 20:32:41', null, 'ACTIF', null, 'mjennings@ma1lbox.co.uk', '237 78949335', null, '1962-12-14', 'Buena Vista', 'Penny Spears', null, '', null, null, null, '0', '7da240ad5f55280b4c300231d6d9f6d4b913328f', null, null, 'Odom', null, null);
INSERT INTO `User` VALUES ('14', '2015-08-27 20:32:41', null, 'ACTIF', null, 'rcantrell@yah00.net', '237 63569212', null, '1971-01-31', 'Preston', 'Tashia Robles', null, '', null, null, null, '0', 'e8b685271238adf161cffed3c91f54d97023262b', null, null, 'Fields', null, null);
INSERT INTO `User` VALUES ('15', '2015-08-27 20:32:41', null, 'ACTIF', null, 'generatedenter88@hotma1l.net', '237 66675689', null, '1973-08-18', 'Doraville', 'Abigail Orr', null, '', null, null, null, '0', '6fdc79dedbf873fb5b1d753550ea4809943c3c42', null, null, 'Lawson', null, null);

DROP TABLE IF EXISTS `Profil`;
CREATE TABLE `Profil` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `cycle_vie` varchar(255) DEFAULT NULL,
  `libelle` varchar(100) NOT NULL,
  `code_createur` int(11) DEFAULT NULL,
  `code_modificateur` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_9q68md5aemgsn0xluu9xcqyr0` (`code_createur`),
  KEY `FK_l9ad0mufmnyiv21s75h85x27i` (`code_modificateur`),
  CONSTRAINT `FK_9q68md5aemgsn0xluu9xcqyr0` FOREIGN KEY (`code_createur`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_l9ad0mufmnyiv21s75h85x27i` FOREIGN KEY (`code_modificateur`) REFERENCES `User` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Profil
-- ----------------------------
INSERT INTO `Profil` VALUES ('1', '2015-08-27 20:32:41', null, 'ACTIF', 'ADMIN', null, null);
INSERT INTO `Profil` VALUES ('2', '2015-08-27 20:32:41', null, 'ACTIF', 'USER', null, null);

-- ----------------------------
-- Table structure for `UserProfil`
-- ----------------------------
DROP TABLE IF EXISTS `UserProfil`;
CREATE TABLE `UserProfil` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `cycle_vie` varchar(255) DEFAULT NULL,
  `code_createur` int(11) DEFAULT NULL,
  `code_modificateur` int(11) DEFAULT NULL,
  `code_profil` int(11) DEFAULT NULL,
  `code_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_punwxlagt0cwefx9mujmr1rd5` (`code_createur`),
  KEY `FK_myfdd9rgjwlbqavfy0tkyiip8` (`code_modificateur`),
  KEY `FK_9285rcv8f16yc5v30iny32dok` (`code_profil`),
  KEY `FK_a12i6ysur3emn9ux6vplbaocc` (`code_user`),
  CONSTRAINT `FK_9285rcv8f16yc5v30iny32dok` FOREIGN KEY (`code_profil`) REFERENCES `Profil` (`code`),
  CONSTRAINT `FK_a12i6ysur3emn9ux6vplbaocc` FOREIGN KEY (`code_user`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_myfdd9rgjwlbqavfy0tkyiip8` FOREIGN KEY (`code_modificateur`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_punwxlagt0cwefx9mujmr1rd5` FOREIGN KEY (`code_createur`) REFERENCES `User` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of UserProfil
-- ----------------------------
INSERT INTO `UserProfil` VALUES ('1', '2015-08-27 20:32:41', null, 'ACTIF', null, null, '1', '1');

DROP TABLE IF EXISTS `Droit`;
CREATE TABLE `Droit` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `cycle_vie` varchar(255) DEFAULT NULL,
  `parametres` longtext,
  `code_createur` int(11) DEFAULT NULL,
  `code_modificateur` int(11) DEFAULT NULL,
  `code_profil` int(11) NOT NULL,
  `code_rubrique` int(11) NOT NULL,
  `code_service` int(11) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_psyfx2b0uiiiib1xxwy7f8bio` (`code_createur`),
  KEY `FK_91sechnf3hu0ffkb5c8tjci2e` (`code_modificateur`),
  KEY `FK_n6vtej6pirtyi8mx5dijj2xav` (`code_profil`),
  KEY `FK_56xhiux27xw2abg9xmujhgpgm` (`code_rubrique`),
  KEY `FK_8na8h3xi1slyp9hthw51hj3fd` (`code_service`),
  CONSTRAINT `FK_56xhiux27xw2abg9xmujhgpgm` FOREIGN KEY (`code_rubrique`) REFERENCES `Rubrique` (`code`),
  CONSTRAINT `FK_8na8h3xi1slyp9hthw51hj3fd` FOREIGN KEY (`code_service`) REFERENCES `Services` (`code`),
  CONSTRAINT `FK_91sechnf3hu0ffkb5c8tjci2e` FOREIGN KEY (`code_modificateur`) REFERENCES `User` (`code`),
  CONSTRAINT `FK_n6vtej6pirtyi8mx5dijj2xav` FOREIGN KEY (`code_profil`) REFERENCES `Profil` (`code`),
  CONSTRAINT `FK_psyfx2b0uiiiib1xxwy7f8bio` FOREIGN KEY (`code_createur`) REFERENCES `User` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS vuecumulmouvpuce;
DROP VIEW IF EXISTS vuecumulmouvpuce;
create VIEW vuecumulmouvpuce AS select pc.code AS code_puce,pc.msisdn AS msisdn,p.nom_prenom AS nom_prenom,p.categorie AS categorie,mp.date_operation AS date_operation,count(mp.code) AS nombre_transfert,sum(mp.montant) AS montant_transfere from (((mouvementpuce mp join puce pc on((pc.code = mp.code_puce_source))) join comptepersonne cp on(((cp.code = pc.compte_proprietaire) or (cp.code = pc.compte_auxiliaire)))) join personne p on((p.code = cp.code_personne))) group by pc.code,pc.msisdn,p.nom_prenom,p.categorie,mp.date_operation order by p.categorie,p.nom_prenom,pc.msisdn,mp.date_operation;

DROP TABLE IF EXISTS vueinfosrevendeur;
DROP VIEW IF EXISTS vueinfosrevendeur;
create VIEW vueinfosrevendeur AS select p.code AS code,p.nom_prenom AS nom_prenom,p.categorie AS categorie,p.date_naissance AS date_naissance,p.lieu_naissance AS lieu_naissance,pc.code AS code_puce,pc.msisdn AS msisdn from ((personne p join comptepersonne cp on((p.code = cp.code_personne))) join puce pc on((cp.code = pc.compte_proprietaire)));

DROP TABLE IF EXISTS vuelistemouvpuce;
DROP VIEW IF EXISTS vuelistemouvpuce;
create VIEW vuelistemouvpuce AS select mp.code AS code,mp.reference AS reference,mp.date_operation AS date_operation,mp.montant AS montant,mp.code_puce_destination AS code_puce_destination,pc2.msisdn AS msisdn_destination,mp.code_puce_source AS code_puce_source,pc.msisdn AS msisdn_source,mp.balance AS balance,p.nom_prenom AS nom_prenom_fournisseur from ((((mouvementpuce mp join puce pc on((pc.code = mp.code_puce_source))) join puce pc2 on((pc2.code = mp.code_puce_destination))) join comptepersonne cp on(((cp.code = pc.compte_proprietaire) or (cp.code = pc.compte_auxiliaire)))) join personne p on((p.code = cp.code_personne))) order by mp.date_operation,mp.reference;

DROP TABLE IF EXISTS vuepaiement;
DROP VIEW IF EXISTS vuepaiement;
create VIEW vuepaiement AS select pm.code AS code,p.code AS code_client,p.nom_prenom AS nom_prenom_client,pm.reference AS reference,if((pm.sens = 'ENTREE'),pm.montant,0) AS entree,if((pm.sens = 'SORTIE'),pm.montant,0) AS sortie,pm.sens AS sens_paiement,pm.date_paiement AS datepaiement,pm.compte_client AS compte_client,pm.compte_fournisseur AS compte_fournisseur,cpc.libelle AS libelle_client,puc.msisdn AS msisdn_client from (((paiement pm join comptepersonne cpc on((pm.compte_client = cpc.code))) join personne p on((p.code = cpc.code_personne))) left join puce puc on((cpc.code = puc.compte_proprietaire)));

DROP TABLE IF EXISTS vueumulpaiementbalance;
DROP VIEW IF EXISTS vueumulpaiementbalance;
create VIEW vueumulpaiementbalance AS select pm.compte_client AS compte_client,p.nom_prenom AS nom_prenom_client,pm.date_paiement AS datepaiement,pm.sens AS sens_paiement,puc.msisdn AS msisdn_client,count(pm.code) AS nombre_paiement,sum(if((pm.sens = 'ENTREE'),pm.montant,0)) AS cumul_entree,sum(if((pm.sens = 'SORTIE'),pm.montant,0)) AS cumul_sortie from (((paiement pm join comptepersonne cpc on((pm.compte_client = cpc.code))) join personne p on((p.code = cpc.code_personne))) left join puce puc on((cpc.code = puc.compte_proprietaire))) group by pm.compte_client,p.nom_prenom,pm.date_paiement,pm.sens,puc.msisdn;


alter table personne modify categorie int(11);
alter table comptepersonne modify categorie_personne int(11);
alter table personne add boite_postale varchar(30) after lieu_naissance, 
		add quartier varchar(100) after boite_postale, 
		add sexe int(11) after nom_prenom, 
		add service_travail int(11) after quartier, 
		add statut_matrimoniale int(11) after service_travail;

drop table if exists categoriepersonne;
create table categoriepersonne(code int(11) primary key auto_increment, libelle varchar(50));

drop table if exists servicetravail;
create table servicetravail(code int(11) primary key auto_increment, libelle varchar(50));

drop table if exists sexe;
create table sexe(code int(11) primary key auto_increment, libelle varchar(50));
insert into sexe values (1, 'MAXCULIN'), (2, 'FEMININ'), (3, 'INCONNU'), (4, 'NON APPLICABLE'); 

drop table if exists statutmatrimonial;
create table statutmatrimonial(code int(11) primary key auto_increment, libelle varchar(50));
insert into statutmatrimonial values (1, 'MARIE'), (2, 'NON MARIE'), (3, 'INCONNU'), (4, 'NON APPLICABLE'); 

drop table if exists yesno;
create table yesno(code int(11) primary key auto_increment, libelle varchar(15));
insert into yesno values (1, 'OUI'), (2, 'NON'), (3, 'INCONNU'); 

drop table if exists naturecompte;
create table naturecompte(code int(11) primary key auto_increment, libelle varchar(50));

drop table if exists typecompte;
create table typecompte(code int(11) primary key auto_increment, libelle varchar(50));


-- modify catégorie int(11)
-- decimal(19,2) NOT NULL
	
-- modify catégorie int(11)
-- decimal(19,2) NOT NULL
drop table if exists produit;
create table produit (code int(11) primary key auto_increment, libelle varchar(100), description text, type_produit int(11) not null, categorie_produit int(11), prix_achat decimal(19,2), prix_vente decimal(19,2), duree_realisation int(11), quantite double, taxable char(1)); 
			
-- typeproduit : Article, Service
drop table if exists typeproduit;
create table typeproduit(code int(11) primary key auto_increment, libelle varchar(50));
insert into typeproduit values (1, 'ARTICLE'), (2, 'SERVICE'), (3, 'INCONNU'); 

-- categorieproduit
drop table if exists categorieproduit;
create table categorieproduit(code int(11) primary key auto_increment, libelle varchar(50));

drop table if exists ticket;
drop table if exists facture;
create table facture (code int(11) primary key auto_increment, compte_client int(11), date_debut datetime, mode_prise_rdv int(11), reference varchar(100), 
objet varchar(100), date_facture datetime, etat_facture int(11) default 1, categorie_facture int(11) default 1, type_facture int(11) default 1, code_liste_prix int(11), duree_total int(11), date_fin_prevu datetime, 
compte_fournisseur int(11), taux_tva double, total_ht decimal(19,2), total_tva decimal(19,2), total_ttc decimal(19,2), total_regler decimal(19,2), reste_a_payer decimal(19,2), solde_compte_client decimal(19,2), code_modele_messagerie int(11), code_facture_modele int(11));

-- etatfacture : RDV, Confirme, Commande,Livre/Realise/Valide
drop table if exists etatfacture;
create table etatfacture(code int(11) primary key auto_increment, libelle varchar(50));
insert into etatfacture values(4, 'INCONNU'), (1, 'RDV'), (2, 'CONFIRME'), (3, 'REALISE'); 

-- categoriefacture : Facture, Devis, Commande
drop table if exists categoriefacture;
create table categoriefacture(code int(11) primary key auto_increment, libelle varchar(50));
insert into categoriefacture values (4, 'INCONNUE'), (1, 'FACTURE'), (2, 'DEVIS'), (3, 'COMMANDE');

-- typefacture : Achat, Vente, Transfert en entree, Transfert en sortie, Depot
drop table if exists typefacture;
create table typefacture(code int(11) primary key auto_increment, libelle varchar(50));
insert into typefacture values (6, 'INCONNUE'), (1, 'VENTE'), (2, 'ACHAT'), (3, 'DEPOT'), (4, 'TRANSFERT ENTREE'), (5, 'TRANSFERT SORTIE');

drop table if exists modepriserdv;
create table modepriserdv(code int(11) primary key auto_increment, libelle varchar(50));

drop table if exists listeprix;
create table listeprix(code int(11) primary key auto_increment, libelle varchar(50), formule_prix text);

drop table if exists detaillisteprix;
create table detaillisteprix(code int(11) primary key auto_increment, code_liste_prix int(11), code_produit varchar(50), prix_achat decimal(19,2), prix_vente decimal(19,2));


drop table if exists detailticket;
drop table if exists detailfacture;
create table detailfacture (code int(11) primary key auto_increment, code_facture int(11), code_produit int(11), quantite double, duree int(11), 
prix_unitaire decimal(19,2), montant_ht decimal(19,2), taux_tva double, montant_tva decimal(19,2), montant_total decimal(19,2), code_technicien int(11), 
date_debut datetime, date_fin_prevu datetime); 

alter table paiement add  solde_compte_client decimal(19,2) after reference,
			add code_facture int(11) after solde_compte_client,
			add code_caisse int(11) after code_facture; 

drop table if exists modepaiement;
create table modepaiement(code int(11) primary key auto_increment, libelle varchar(50));
insert into modepaiement values(1, 'ESPECE'), (2, 'CHEQUE'), (3, 'VIREMENT'), (4, 'INCONNU');

drop table if exists typepaiement;
create table typepaiement(code int(11) primary key auto_increment, libelle varchar(50));
insert into typepaiement values(1, 'PAIEMENT CLIENT'), (2, 'PAIEMENT FOURNISSEUR'), (3, 'INCONNU');

-- alter table paiement change code_ticket code_facture int(11) default 1;
alter table paiement add mode_paiement int(11) default 1;
alter table paiement add type_paiement int(11) default 1;

drop table if exists caisse;
create table caisse(code int(11) primary key auto_increment, libelle varchar(50), code_gerant int(11));

drop table if exists paiementticket;
drop table if exists paiementfacture;
create table paiementfacture (code int(11) primary key auto_increment, code_paiement int(11), code_facture int(11), montant_ttc_facture decimal(19,2), montant_paiement decimal(19,2), montant_paiement_facture decimal(19,2), reste_a_payer decimal(19,2));

drop table if exists clotureperiode;
create table  clotureperiode (code int(11) primary key auto_increment, libelle varchar(100), date_debut datetime, date_fin datetime, etat_periode int(11), entite_concernee varchar(30), filtre varchar(50), code_caisse int(11), nombre_transaction int(11), total_entree decimal(19,2), total_sortie decimal(19,2));


-- etat_periode : ouvert, ferme


