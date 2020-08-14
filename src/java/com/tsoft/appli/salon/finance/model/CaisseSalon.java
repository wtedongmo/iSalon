/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.salon.finance.model;

import com.tsoft.annotations.form.Select;
import com.tsoft.appli.caisse.model.Caisse;
import com.tsoft.appli.salon.model.Salon;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

/**
 *
 * @author eisti
 */
@Entity
public class CaisseSalon  extends Caisse{
    
    @ManyToOne
    @JoinColumn(name = "code_salon",referencedColumnName = "code")
    @NotNull
    @Select
    private Salon salon;

    public Salon getSalon() {
        return salon;
    }

    public void setSalon(Salon salon) {
        this.salon = salon;
    }
    
    
    
    
}
