/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.salon.finance.model;

import com.tsoft.annotations.form.SpelValue;
import com.tsoft.appli.caisse.model.Encaissement;
import com.tsoft.appli.caisse.service.MvtCaisseService;
import com.tsoft.appli.salon.model.Ticket;
import com.tsoft.dao.Dao;
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
@Dao(MvtCaisseService.class)
public class PaiementTicket extends Encaissement{
    
    @ManyToOne
    @JoinColumn(name = "code_ticket",referencedColumnName = "code")
    @NotNull
    private Ticket  ticket;
    @SpelValue("ticket.montant_TTC")
    @Column
    private BigDecimal montant_a_verser;
   

    public Ticket getTicket() {
        return ticket;
    }

    public void setTicket(Ticket ticket) {
        this.ticket = ticket;
    }

    public BigDecimal getMontant_a_verser() {
        return montant_a_verser;
    }

    public void setMontant_a_verser(BigDecimal montant_a_verser) {
        this.montant_a_verser = montant_a_verser;
    }

    
    
    
    
    
    
}
