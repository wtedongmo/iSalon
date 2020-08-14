

update puce set compte_proprietaire = compte_propietaire;
alter table puce drop compte_propietaire;

alter table puce change code_revendeur compte_proprietaire int(11);
alter table puce add compte_auxiliaire int(11);
-- alter table paiement add type_paiement varchar(50);
alter table mouvementpuce add type_transfert varchar(50);
alter table comptepersonne add type_compte varchar(50);
alter table comptepersonne add categorie_personne varchar(50); -- Ce dernier sera en lecture seule. Il va contenir la categorie de la personne, sera renseigné automatiquement à la suite du chix de la personne. Il va permettre de renseigner le type de transfert ou de mouvement puce. 
update comptepersonne c join personne p on p.code=c.code_personne set c.categorie_personne=p.categorie;
alter table paiement add objet varchar(100) after reference;

-- create index puceperssk2 on puce(compte_propietaire);
drop view if exists vueinfosrevendeur;
create view vueinfosrevendeur as 
	select p.code, p.nom_prenom, p.categorie, p.date_naissance, p.lieu_naissance, pc.code as code_puce, pc.msisdn
		from personne p 
		join comptepersonne cp on p.code=cp.code_personne
		join puce pc on cp.code=pc.compte_proprietaire;
-- 		join comptepersonne cp on p.code=cp.code --- , cp.libelle as libelle_compte

-- 2015/07/24
update mouvementpuce set sens='SORTIE' where sens='DEBIT';
update mouvementpuce set sens='ENTREE' where sens='CREDIT';

-- create index MouvementPucepssk on mouvementpuce(code_puce_source);
-- create index MouvementPucepdsk on mouvementpuce(code_puce_destination);
drop view if exists vuelistemouvpuce;
create view vuelistemouvpuce as 
	select mp.code, mp.reference, mp.date_operation, mp.montant, mp.code_puce_destination, pc2.msisdn as msisdn_destination, mp.code_puce_source, pc.msisdn as msisdn_source, mp.balance, p.nom_prenom as nom_prenom_fournisseur 
	from mouvementpuce mp
	join puce pc on pc.code=mp.code_puce_source 
	join puce pc2 on pc2.code=mp.code_puce_destination 
	join comptepersonne cp on (cp.code=pc.compte_proprietaire or cp.code=pc.compte_auxiliaire)
	join personne p on p.code=cp.code_personne
	order by mp.date_operation, mp.reference ;
	
drop view if exists vuelistemouvpuce;
create view vuelistemouvpuce as 
	select mp.code, mp.reference, mp.date_operation, mp.sens as sens_mouvement, if(mp.sens='CREDIT', mp.montant, 0) as credit, if(mp.sens='DEBIT', mp.montant, 0) as debit, mp.code_puce_destination, pc2.msisdn as msisdn_destination, mp.code_puce_source, pc.msisdn as msisdn_source, mp.balance as balance_source, mp.balance_destination , p.nom_prenom as nom_prenom_fournisseur, cp.code as compte_fournisseur, p2.nom_prenom as nom_prenom_client, cp2.code as compte_client
	from mouvementpuce mp
	join puce pc on pc.code=mp.code_puce_source 
	join puce pc2 on pc2.code=mp.code_puce_destination 
	join comptepersonne cp on (cp.code=pc.compte_proprietaire or cp.code=pc.compte_auxiliaire)
	join personne p on p.code=cp.code_personne
	join comptepersonne cp2 on (cp2.code=pc2.compte_proprietaire or cp2.code=pc2.compte_auxiliaire)
	join personne p2 on p2.code=cp2.code_personne
	order by mp.date_operation, mp.reference ;
	
-- colonne a afficher : N°, reference, emetteur, beneficiaire, date_operation, recu, transfere, balance
-- colonne a afficher : reference, source, destination, date_operation, credit, debit, balance
-- select * from vuelistemouvpuce where msisdn_source='237670005708' and date_operation between '2015/05/20' and '2015/05/20';

drop view if exists vuelistemouvpucesource;
create view vuelistemouvpucesource as 
	select mp.code, mp.reference, mp.date_operation, mp.sens as sens_mouvement, if(mp.sens='ENTREE', mp.montant, 0) as entree, if(mp.sens='SORTIE', mp.montant, 0) as sortie, mp.code_puce_source as code_puce, pc.msisdn as msisdn, mp.balance as balance, p.nom_prenom, cp.code as code_compte, 'mvtpuve_s' as journal
	from mouvementpuce mp
	join puce pc on pc.code=mp.code_puce_source 
	join comptepersonne cp on (cp.code=pc.compte_propietaire or cp.code=pc.compte_auxiliaire)
	join personne p on p.code=cp.code_personne
	order by mp.date_operation, mp.reference ;

drop view if exists vuelistemouvpucedestination;
create view vuelistemouvpucedestination as 
	select mp.code, mp.reference, mp.date_operation, mp.sens as sens_mouvement, if(mp.sens='ENTREE', mp.montant, 0) as entree, if(mp.sens='SORTIE', mp.montant, 0) as sortie, mp.code_puce_destination as code_puce, pc.msisdn as msisdn, mp.balance_destination as balance, p.nom_prenom, cp.code as code_compte, 'mvtpuve_d' as journal
	from mouvementpuce mp
	join puce pc on pc.code=mp.code_puce_destination 
	join comptepersonne cp on (cp.code=pc.compte_propietaire or cp.code=pc.compte_auxiliaire)
	join personne p on p.code=cp.code_personne
	order by mp.date_operation, mp.reference ;
	
drop view if exists vuepaiementfournisseur;
create view vuepaiementfournisseur as 
	select pm.code, pm.reference, pm.datepaiement as date_operation, pm.sens as sens_mouvement, if(pm.sens='ENTREE', pm.montant, 0) as entree, if(pm.sens='SORTIE', pm.montant, 0) as sortie, pc.code as code_puce, pc.msisdn as msisdn, 0 as balance, p.nom_prenom, cp.code as code_compte, 'paie_f' as journal
	from paiement pm
	join comptepersonne cp on (pm.comptefournisseur=cp.code)
	join personne p on p.code=cp.code_personne
	join puce pc on cp.code=pc.compte_propietaire
	order by  pm.datepaiement, pm.reference ;
	
-- Vue pour listing de tous les mouvement d'une personne

drop view if exists vuemouvementpersonne;
create view vuemouvementpersonne as 
select * from vuelistemouvpucesource
union
select * from vuelistemouvpucedestination
union
select * from vuepaiementfournisseur
union
select * from vuepaiementclient;


	
	

drop view if exists vuepaiementclient;
create view vuepaiementclient as 
	select pm.code, pm.reference, pm.datepaiement as date_operation, pm.sens as sens_mouvement, if(pm.sens='ENTREE', pm.montant, 0) as entree, if(pm.sens='SORTIE', pm.montant, 0) as sortie, pc.code as code_puce, pc.msisdn as msisdn, 0 as balance, p.nom_prenom, cp.code as code_compte, 'paie_c' as journal
	from paiement pm
	join comptepersonne cp on (pm.compteclient=cp.code)
	join personne p on p.code=cp.code_personne
	join puce pc on cp.code=pc.compte_propietaire
	order by  pm.datepaiement, pm.reference ;

	
drop view if exists vuelistemouvpuceentree;
create view vuelistemouvpuceentree as 
	select mp.code, mp.reference, mp.date_operation, mp.sens as sens_mouvement, if(mp.sens='ENTREE', mp.montant, 0) as entree, 0 as sortie, mp.code_puce_destination, pc2.msisdn as msisdn_destination, mp.code_puce_source, pc.msisdn as msisdn_source, mp.balance as balance_source, mp.balance_destination, p.nom_prenom as nom_prenom_fournisseur, cp.code as compte_fournisseur, p2.nom_prenom as nom_prenom_client, cp2.code as compte_client
	from mouvementpuce mp
	join puce pc on pc.code=mp.code_puce_source 
	join puce pc2 on pc2.code=mp.code_puce_destination 
	join comptepersonne cp on (cp.code=pc.compte_propietaire or cp.code=pc.compte_auxiliaire)
	join personne p on p.code=cp.code_personne
	join comptepersonne cp2 on (cp2.code=pc2.compte_propietaire or cp2.code=pc2.compte_auxiliaire)
	join personne p2 on p2.code=cp2.code_personne
	order by mp.date_operation, mp.reference ;

	
drop view if exists vuecumulmouvpuce;
create view vuecumulmouvpuce as 
	select pc.code as code_puce, pc.msisdn, p.nom_prenom, p.categorie, mp.date_operation, count(mp.code) as nombre_transfert, sum(mp.montant) as montant_transfere 
	from mouvementpuce mp 
	join puce pc on pc.code=mp.code_puce_source 
	join comptepersonne cp on cp.code=pc.compte_proprietaire or cp.code=pc.compte_auxiliaire
	join personne p on p.code=cp.code_personne
	group by pc.code, pc.msisdn, p.nom_prenom, p.categorie, mp.date_operation
	order by p.categorie, p.nom_prenom,pc.msisdn,mp.date_operation ; 

update paiement set sens='ENTREE' where sens='CREDIT';
update paiement set sens='SORTIE' where sens='DEBIT';

create index paiementcomptcsk on paiement(compteclient);
create index paiementcomptfsk on paiement(comptefournisseur);
create index comptepersonnepsk on comptepersonne(code_personne);
	
drop view if exists vuepaiement;
create view vuepaiement as select pm.code as code, p.code as code_client, p.nom_prenom as nom_prenom_client, pm.reference, if(pm.sens='ENTREE', montant, 0) as entree, if(pm.sens='SORTIE', montant, 0) as sortie, pm.sens as sens_paiement, pm.datepaiement, pm.compteclient, pm.comptefournisseur, cpc.libelle as libelle_client, puc.msisdn as msisdn_client 
from paiement pm
join comptepersonne cpc on pm.compteclient=cpc.code
join personne p on p.code= cpc.code_personne
left join puce puc on cpc.code=puc.compte_proprietaire;

-- Cumul des mouvement d'une periode
-- alter table paiement add solde double;

drop view if exists vueumulpaiementbalance;
create view vueumulpaiementbalance as select pm.compteclient,  p.nom_prenom as nom_prenom_client, pm.datepaiement, pm.sens as sens_paiement, puc.msisdn as msisdn_client, 
count(pm.code) as nombre_paiement, sum(if(pm.sens='ENTREE', montant, 0)) as cumul_entree, sum(if(pm.sens='SORTIE', montant, 0)) as cumul_sortie 
from paiement pm
join comptepersonne cpc on pm.compteclient=cpc.code
join personne p on p.code= cpc.code_personne
left join puce puc on cpc.code=puc.compte_proprietaire 
GROUP BY pm.compteclient,  p.nom_prenom, pm.datepaiement, pm.sens, puc.msisdn;


-- Comment avoir la balance d'une puce
-- Comment avoir l'historique d'un compte
-- 1. Une vue qui donne les actions dans les mouvements de puce en client
-- 1. Une vue qui donne les actions dans les mouvements de puce en fournisseur

-- 2. Une vue qui donne les actions dans les paiements de compte 
-- Faire la fusion des deux vues pour avoir l'historique




-- order by p.nom_prenom;

-- alter table puce add compte_pro int(11); -- il faut changer le code code_revendeur de la puce en compte proprietaire. Le problème avec la personne est que si la personne a plusieurs compte, on ne saura plus quel compte utilisé
-- Lors du chargement des fichiers des vendeurs, ce n'est pas le compte du délégué qui doit être mouvementé, mais sa balance en terme de credit puce. 
-- Lorsque le delegue fait une demande de transfert credit vers la puce mère, ce dernier credite son balance, débit son compte et débite le compte de la puce mère.
-- Comment avoir la balance de début et de fin d'un délégué, sur une période ?

-- la balance de depart du delegue, la somme versée, et le contenu de sa puce sur la période. // Etat de cumul. Recupérer le premier enregistrement de la journée de début et le dernier enregistrement de la fin d'une autre journée. Faire le cumul des versements de cette période
-- Pour controler les mouvements de compte, on va utiliser les types de compte (principal et auxiliaire). Les comptes principaux des délégués sont utilisés pour les opérations entre le délégué et son fournisseur (le distributeur). Les comptes auxiliaires des délégués sont utilisés pour les opérations entre le délégués et les vendeurs. Pour un premier temps, on va interdire les paiements avec les comptes auxiliaires. 
-- Pour controler d'utilisation d'un compte auxiliaire ou d'un compte principal dans un mouvement de puce, on va ajouter dans la table puce un champ compte_auxiliaire et dans mouvementpuce un champ type de transfert (Distributeur-Delegue, MTN-Distributeur, Delegue-Vendeur). 
-- Pour les transferts entre MTN et le distributeur, un mouvement puce en credit du distributeur credite le compte de MTN et débite celui du distributeur. Lorsque le distributeur fait un paiement chez MTN (paiement en sortie), MTN etant le fournisseur et le distributeur le client, ce paiement débite le compte de MTN et credite celui du distributeur.

-- Création de la table parametre
create table parametre (codeparams varchar(50) primary key, libelle varchar(100), valeur varchar(100), description text);
insert into parametre(codeparams, libelle, valeur) values('mtn.default.compte.fournisseur','Compte fournisseur par défaut','2'), ('mtn.default.compte.cleint','Compte client par défaut','3'), ('mtn.default.compte','Compte Compte personne par défaut','4'), ('mtn.chemin.image.entete','Image Entete','localhost:8082/entete.png');



drop view if exists vuepaiementperiode;
create view vuepaiementperiode as select pm.code as code, p.code as code_client, p.nom_prenom as nom_prenom_client, pm.reference, if(pm.sens='ENTREE', montant, 0) as entree, if(pm.sens='SORTIE', montant, 0) as sortie, pm.sens as sens_paiement, pm.datepaiement, pm.compteclient, pm.comptefournisseur, cpc.libelle as libelle_client, cpc.type_compte, p.categorie, puce.msisdn, 
from paiement pm
join comptepersonne cpc on pm.compteclient=cpc.code
join personne p on p.code= cpc.code_personne;
join puce puce on cpc.code= puce.compte_propietaire
join puce puce2 on cpc.code= puce2.compte_auxiliaire
left join mouvementpuce mp on puce.code=mp.code_puce_destination
left join mouvementpuce mp2 on puce2.code=mp2.code_puce_source
order by 
-- order by p.nom_prenom;




	
