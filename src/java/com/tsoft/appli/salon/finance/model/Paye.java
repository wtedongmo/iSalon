/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.salon.finance.model;

import com.tsoft.appli.caisse.model.Decaissement;
import com.tsoft.appli.salon.model.Employe;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

/**
 *
 * @author eisti
 */
@Entity
public class Paye  extends Decaissement{

    public Employe getEmploye() {
        return employe;
    }

    public void setEmploye(Employe employe) {
        this.employe = employe;
    }
    
    @ManyToOne
    @JoinColumn(referencedColumnName = "code",name = "code_emeploye")
    @NotNull
    private Employe employe;
    
    
    
}
