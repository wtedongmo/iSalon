/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.salon.model;

import com.tsoft.annotations.form.Fichier;
import com.tsoft.security.model.PersonMoral;
import com.tsoft.security.model.User;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.validation.constraints.NotNull;
import org.hibernate.annotations.Formula;

/**
 *
 * @author eisti
 */
@Entity
public class Salon extends PersonMoral {
    
    @ManyToOne
    @JoinColumn(name = "code_responsable",referencedColumnName = "code")
    private User responsable;
    @Column
    @NotNull
    private String nom;

    @Column
    @Fichier
    private String logo;
    @Column
    private String slogan;
    @Column
    @Temporal(javax.persistence.TemporalType.TIME)
    private Date heure_ouverture;
    @Column
    @Temporal(javax.persistence.TemporalType.TIME)
    private Date heure_fermeture;
    @Formula("(select count(*) from Employe c where c.code_salon=code)")
    private Integer nbre_employes;
    @OneToMany(mappedBy = "salon")
    private List<Employe> employes;

    public User getResponsable() {
        return responsable;
    }

    public void setResponsable(User responsable) {
        this.responsable = responsable;
    }

    public Date getHeure_ouverture() {
        return heure_ouverture;
    }

    public void setHeure_ouverture(Date heure_ouverture) {
        this.heure_ouverture = heure_ouverture;
    }

    public Date getHeure_fermeture() {
        return heure_fermeture;
    }

    public void setHeure_fermeture(Date heure_fermeture) {
        this.heure_fermeture = heure_fermeture;
    }

    public String getSlogan() {
        return slogan;
    }

    public void setSlogan(String slogan) {
        this.slogan = slogan;
    }

  

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public Integer getNbre_employes() {
        return nbre_employes;
    }

    public void setNbre_employes(Integer nbre_employes) {
        this.nbre_employes = nbre_employes;
    }

    public List<Employe> getEmployes() {
        return employes;
    }

    public void setEmployes(List<Employe> employes) {
        this.employes = employes;
    }
    
    

}
