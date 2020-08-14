/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.salon.model;

import com.tsoft.annotations.form.Label;
import com.tsoft.security.model.superclass.LifeCycleEntity;
import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

/**
 *
 * @author eisti
 */
@Entity
public class Prestation extends LifeCycleEntity {

    @Column
    private String libelle;

    @ManyToOne
    @JoinColumn(name = "type_prestation", referencedColumnName = "code")
    @NotNull
    private PrestationType type;

    @Column
    @NotNull
    private BigDecimal prix_unitaire;
    @Column
    @NotNull
    @Label("Durée (min)")
    private Byte duree;
    @Column
    @NotNull
    private double taux_tva;

    public PrestationType getType() {
        return type;
    }

    public void setType(PrestationType type) {
        this.type = type;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public BigDecimal getPrix_unitaire() {
        return prix_unitaire;
    }

    public void setPrix_unitaire(BigDecimal prix_unitaire) {
        this.prix_unitaire = prix_unitaire;
    }

    public Byte getDuree() {
        return duree;
    }

    public void setDuree(Byte duree) {
        this.duree = duree;
    }

    public double getTaux_tva() {
        return taux_tva;
    }

    public void setTaux_tva(double taux_tva) {
        this.taux_tva = taux_tva;
    }

}
