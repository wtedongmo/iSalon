package com.tsoft.appli.salon.model;

import com.tsoft.security.model.Person;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author eisti
 */
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "type")
public class Employe  extends Person{
    
    @ManyToOne
    @JoinColumn(name = "code_salon",referencedColumnName = "code")
    @NotNull
    private Salon salon;
    @ManyToOne
    @JoinColumn(name = "type_prestation",referencedColumnName = "code")
    private PrestationType specialite;
    
    

    public Salon getSalon() {
        return salon;
    }

    public void setSalon(Salon salon) {
        this.salon = salon;
    }

    public PrestationType getSpecialite() {
        return specialite;
    }

    public void setSpecialite(PrestationType specialite) {
        this.specialite = specialite;
    }
    
    
    
}
