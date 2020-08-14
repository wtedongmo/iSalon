/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.salon.service;

import com.tsoft.appli.salon.model.EventObject;
import com.tsoft.appli.salon.model.RendezVous;
import com.tsoft.dao.hibernate.service.HibernateServiceWrapper;
import com.tsoft.utils.ObjectUtils;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author eisti
 */
@RestController
@RequestMapping("/app")
public class RDVController {

    @Autowired
    HibernateServiceWrapper hsw;

    @RequestMapping(value = "/getRDV", method = RequestMethod.GET)
    public List<EventObject> getRDV(HttpServletRequest req, @RequestParam Date startParam, @RequestParam Date endParam) throws Exception {
        List<EventObject> results = new ArrayList();
        List<Criterion> criteres = new ArrayList();
        criteres.add(Restrictions.lt("date_rdv", endParam));
        criteres.add(Restrictions.ge("date_rdv", startParam));
        List<RendezVous> rdvs = hsw.getAll(RendezVous.class, criteres, null);
        for (RendezVous rdv : rdvs) {
            results.add(rdv);
        }
        return results;
    }

    @Autowired
    ObjectUtils ou;

    @RequestMapping(value = "/addRDV", method = RequestMethod.GET)
    public JSONObject addRDV(HttpServletRequest req, @RequestParam long date) throws Exception {
        JSONObject jo = new JSONObject();
        RendezVous rdv = new RendezVous();
        Date date_rdv=new Date();
        date_rdv.setTime(date);
        rdv.setDate_rdv(date_rdv);
        jo = ou.objectToJson(rdv, req, true);
        jo.put("row", -1);
        jo.put("categorie", RendezVous.class.getSimpleName());
        jo.put("nbrow", 0);
        return jo;
    }

}
