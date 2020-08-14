/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.salon.finance.service;

import com.tsoft.appli.caisse.model.MoyenPaiement;
import com.tsoft.appli.caisse.service.CaisseService;
import com.tsoft.appli.salon.finance.model.PaiementTicket;
import com.tsoft.appli.salon.model.Salon;
import com.tsoft.appli.salon.model.Ticket;
import com.tsoft.exceptions.BusinessException;
import com.tsoft.service.process.EmptyReportProcess;
import com.tsoft.utils.FileUtils;
import java.io.File;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.Temporal;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotNull;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

/**
 *
 * @author tchipi
 */
@Service
@Scope("session")
public class RecuTicket extends EmptyReportProcess {

    @JoinColumn
    @NotNull
    private Ticket ticket;
    
    @NotNull
    private BigDecimal montant;
    @Enumerated
    private MoyenPaiement moyen_paiement;
    @NotNull
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date date_paiement;

   

    @Override
    public void afterPropertiesSet() throws Exception {
        date_paiement = new Date();
        moyen_paiement=MoyenPaiement.ESPECES;
    }

   
    @Override
    public String libelle() {
        return "Payer un ticket";
    }

    public Ticket getTicket() {
        return ticket;
    }

    public void setTicket(Ticket ticket) {
        this.ticket = ticket;
    }

    public BigDecimal getMontant() {
        return montant;
    }

    public void setMontant(BigDecimal montant) {
        this.montant = montant;
    }

    public Date getDate_paiement() {
        return date_paiement;
    }

    public void setDate_paiement(Date date_paiement) {
        this.date_paiement = date_paiement;
    }

    public MoyenPaiement getMoyen_paiement() {
        return moyen_paiement;
    }

    public void setMoyen_paiement(MoyenPaiement moyen_paiement) {
        this.moyen_paiement = moyen_paiement;
    }

   
   
    @Autowired
    CaisseService  cs;

    @Override
    public Object run(HttpSession session, HttpServletRequest request) throws Exception {
        

        PaiementTicket pt= new PaiementTicket();
        pt.setCaisse(cs.getUserCaisse());
        pt.setMontant(getMontant());
        pt.setTicket(getTicket());
        pt.setMoyen_paiement(getMoyen_paiement());
       
        hibernateService.create(pt);

        //impression Recu
        String reportfile = "";
        //remplissage des parametres du report
        Map params = new HashMap();
        reportfile = "classpath:com/tsoft/appli/highschool/finances/service/RecuVersement.jasper";

        
        //information about salon
        Salon ecole = (Salon) hibernateService.getOne(Salon.class, "select e from Salon e");
        if (ecole == null) {
            throw new BusinessException("Paramètres du salon non definis");
        }
        params.put("nom_salon",getTicket().getRdv().getCoiffeur().getSalon().getNom());
        params.put("slogan_salon", getTicket().getRdv().getCoiffeur().getSalon().getSlogan());
        params.put("adress_salon", getTicket().getRdv().getCoiffeur().getSalon().getBoite_postale() + " Tel:" + getTicket().getRdv().getCoiffeur().getSalon().getTelephoneMobile());
        params.put("logo_salon", FileUtils.getUploadedFile(getTicket().getRdv().getCoiffeur().getSalon().getLogo()).getAbsolutePath());

        File uploadedfile = new File("." + File.separator + "reports");
        if (!uploadedfile.exists()) {
            uploadedfile.mkdirs();
        }
        String destfile = uploadedfile.getAbsolutePath() + File.separator + "RecuVersement"
                +getTicket().getCode() + ".pdf";
        //fill report
        JasperPrint jp = JasperFillManager.fillReport(
                resourceLoader.getResource(reportfile).getInputStream() //file jasper
                , params, //params report
                dataSource.getConnection());  //datasource

        JasperExportManager.exportReportToPdfFile(jp, destfile);

        return download(destfile);

    }

    @Override
    public Class rubrique() throws Exception {
        return  PaiementTicket.class;
    }

}
