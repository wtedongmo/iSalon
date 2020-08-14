/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.salon.model;

import com.tsoft.annotations.form.Libelle;
import com.tsoft.appli.salon.finance.model.PaiementTicket;
import com.tsoft.security.model.superclass.AuditEntity;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.validation.constraints.NotNull;
import org.hibernate.annotations.Formula;

/**
 *
 * @author tchipi
 */
@Entity
public class Ticket extends AuditEntity {

    @Formula("(concat(code,concat('/T/',date_format(date_creation,'%m/%Y'))))")
    @Libelle
    private String reference;
    @JoinColumn(name = "code_rdv", referencedColumnName = "code")
    @OneToOne
    @NotNull
    private RendezVous rdv;
    @Column
    @NotNull
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date date_echeance;

    @Formula("(select sum(s.prix) from Soin s join RendezVous rdv on  s.code_rdv=rdv.code  join Ticket t on t.code_rdv=rdv.code where t.code=code)")
    private BigDecimal montant_HT;
    @Formula("(select sum(s.prix)*s.taux_tva/100 from Soin s join RendezVous rdv on  s.code_rdv=rdv.code  join Ticket t on t.code_rdv=rdv.code where t.code=code)")
    private BigDecimal tva;
    @Formula("(select sum(s.prix)*(1+ s.taux_tva/100) from Soin s join RendezVous rdv on  s.code_rdv=rdv.code  join Ticket t on t.code_rdv=rdv.code where t.code=code)")
    private BigDecimal montant_TTC;

    @OneToMany(mappedBy = "ticket")
    private List<PaiementTicket> paiements = new ArrayList();

    public RendezVous getRdv() {
        return rdv;
    }

    public void setRdv(RendezVous rdv) {
        this.rdv = rdv;
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

    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public Date getDate_echeance() {
        return date_echeance;
    }

    public void setDate_echeance(Date date_echeance) {
        this.date_echeance = date_echeance;
    }

    public List<PaiementTicket> getPaiements() {
        return paiements;
    }

    public void setPaiements(List<PaiementTicket> paiements) {
        this.paiements = paiements;
    }
    
    

}
