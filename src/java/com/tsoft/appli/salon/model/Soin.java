/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.salon.model;

import com.tsoft.annotations.form.OnChange;
import com.tsoft.annotations.form.Select;
import com.tsoft.annotations.form.SpelValue;
import com.tsoft.security.model.superclass.AuditEntity;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

/**
 *
 * @author eisti
 */
@Entity
public class Soin extends AuditEntity {

    @JoinColumn(name = "code_prestation", referencedColumnName = "code")
    @ManyToOne
    @NotNull
    @Select
    @OnChange
    private Prestation prestation;
    @JoinColumn(name = "code_rdv", referencedColumnName = "code")
    @ManyToOne
    @NotNull
    private RendezVous rdv;

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private Date date_debut;
    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private Date date_fin;
    @Column
    @SpelValue("prestation.prix_unitaire")
    private BigDecimal prix;
    @Column
    @SpelValue("prestation.taux_tva")
    private double taux_tva;

    public Prestation getPrestation() {
        return prestation;
    }

    public void setPrestation(Prestation prestation) {
        this.prestation = prestation;
    }

   

    public Date getDate_debut() {
        return date_debut;
    }

    public void setDate_debut(Date date_debut) {
        this.date_debut = date_debut;
    }

    public RendezVous getRdv() {
        return rdv;
    }

    public void setRdv(RendezVous rdv) {
        this.rdv = rdv;
    }

    public Date getDate_fin() {
        return date_fin;
    }

    public void setDate_fin(Date date_fin) {
        this.date_fin = date_fin;
    }

    public BigDecimal getPrix() {
        return prix;
    }

    public void setPrix(BigDecimal prix) {
        this.prix = prix;
    }

    public double getTaux_tva() {
        return taux_tva;
    }

    public void setTaux_tva(double taux_tva) {
        this.taux_tva = taux_tva;
    }

}
