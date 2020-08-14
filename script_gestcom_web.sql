
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


