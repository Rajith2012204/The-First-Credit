package com.nr.fc.service.customer;

import com.nr.fc.model.CustomerContact;
import com.nr.fc.model.CustomerContactPK;

/**
 *
 * @author Naveen
 */
public interface CustomerContactService {

    /**
     *
     * @param customerContact
     */
    public void save(CustomerContact customerContact);

    /**
     *
     * @param customerContactPK
     * @return
     */
    public CustomerContact findByPk(CustomerContactPK customerContactPK);

}
