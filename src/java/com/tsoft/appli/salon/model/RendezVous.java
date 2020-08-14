/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.salon.model;

import com.tsoft.annotations.form.Libelle;
import com.tsoft.annotations.form.Select;
import com.tsoft.appli.salon.service.RDVService;
import com.tsoft.dao.Dao;
import com.tsoft.security.model.superclass.AuditEntity;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.hibernate.annotations.Formula;

/**
 *
 * @author tchipi
 */
@Entity
@Dao(RDVService.class)
public class RendezVous extends AuditEntity  implements EventObject{

    @Formula("(concat(code,concat('/RDV/',date_format(date_rdv,'%m/%Y'))))")
    @Libelle
    private String reference;
    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private Date date_prise_rdv;
    @Column
    @Temporal(TemporalType.TIMESTAMP)
    @NotNull
    private Date date_rdv;
    @JoinColumn(name = "code_client", referencedColumnName = "code")
    @ManyToOne
    @NotNull
    private Client client;
    @JoinColumn(name = "code_coiffeur", referencedColumnName = "code")
    @ManyToOne
    @NotNull
    @Select
    private Coiffeur coiffeur;

    @Column
    @Enumerated(EnumType.STRING)
    private ModePriseRDV mode_prise_rdv;
    
    @Formula("(select sum(s.prix) from Soin s where s.code_rdv=code)")
    private BigDecimal montant_HT;
    @Formula("(select sum(s.prix)*s.taux_tva/100 from Soin s where s.code_rdv=code)")
    private BigDecimal tva;
    @Formula("(select sum(s.prix)*(1+ s.taux_tva/100) from Soin s where s.code_rdv=code)")
    private BigDecimal montant_TTC;

    @OneToMany(mappedBy = "rdv")
    private List<Soin> soins_a_effectues = new ArrayList();

    @Column
    private boolean confirme;
    @Column
    private boolean prioritaire;

    public Date getDate_prise_rdv() {
        return date_prise_rdv;
    }

    public void setDate_prise_rdv(Date date_prise_rdv) {
        this.date_prise_rdv = date_prise_rdv;
    }

    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Coiffeur getCoiffeur() {
        return coiffeur;
    }

    public void setCoiffeur(Coiffeur coiffeur) {
        this.coiffeur = coiffeur;
    }

    public Date getDate_rdv() {
        return date_rdv;
    }

    public void setDate_rdv(Date date_rdv) {
        this.date_rdv = date_rdv;
    }

    public ModePriseRDV getMode_prise_rdv() {
        return mode_prise_rdv;
    }

    public void setMode_prise_rdv(ModePriseRDV mode_prise_rdv) {
        this.mode_prise_rdv = mode_prise_rdv;
    }

    public boolean isConfirme() {
        return confirme;
    }

    public void setConfirme(boolean confirme) {
        this.confirme = confirme;
    }

    public boolean isPrioritaire() {
        return prioritaire;
    }

    public void setPrioritaire(boolean prioritaire) {
        this.prioritaire = prioritaire;
    }

    @Override
    public String id() {
        return  code+"";
    }

    @Override
    public String libelle() {
       return coiffeur.getNom_prenom()+" //  "+client.getNom_prenom();
    }

    @Override
    public Date start() {
       return  date_rdv;
    }

    public BigDecimal getMontant_HT() {
        return montant_HT;
    }

    public void setMontant_HT(BigDecimal montant_HT) {
        this.montant_HT = montant_HT;
    }

    public BigDecimal getTva() {
        return tva;
    }

    public void setTva(BigDecimal tva) {
        this.tva = tva;
    }

    public BigDecimal getMontant_TTC() {
        return montant_TTC;
    }

    public void setMontant_TTC(BigDecimal montant_TTC) {
        this.montant_TTC = montant_TTC;
    }

    public List<Soin> getSoins_a_effectues() {
        return soins_a_effectues;
    }

    public void setSoins_a_effectues(List<Soin> soins_a_effectues) {
        this.soins_a_effectues = soins_a_effectues;
    }
    
    

}
