/*
 * RendezVouso change this license header, choose License Headers in Project Properties.
 * RendezVouso change this template file, choose RendezVousools | RendezVousemplates
 * and open the template in the editor.
 */
package com.tsoft.appli.salon.service;

import com.tsoft.appli.salon.model.RendezVous;
import com.tsoft.appli.salon.model.Ticket;
import com.tsoft.dao.hibernate.service.HibernateService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author eisti
 */
@Service
public class RDVService extends HibernateService<RendezVous> {

    @Override
    public RendezVous create(final RendezVous rdv) throws Exception {
        dao.create(rdv);
        Ticket t=new Ticket();
        t.setRdv(rdv);
        t.setDate_echeance(rdv.getDate_rdv());
        List tosave=new ArrayList();
        tosave.add(t);
        tosave.add(rdv);
        saveAll(tosave);
        return rdv;
    }
}
