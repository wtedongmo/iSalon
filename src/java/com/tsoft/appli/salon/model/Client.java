/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.salon.model;

import com.tsoft.annotations.form.Label;
import com.tsoft.annotations.form.Libelle;
import com.tsoft.security.model.PersonSuperClass;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

/**
 *
 * @author eisti
 */
@Entity
public class Client  extends PersonSuperClass{
    
    @NotNull
    @Column
    @Libelle
    @Label("Nom Et Prénom")
    private String nom_prenom;

    public String getNom_prenom() {
        return nom_prenom;
    }

    public void setNom_prenom(String nom_prenom) {
        this.nom_prenom = nom_prenom;
    }
    
}
