/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nr.fc.service.customergroup;

import com.nr.fc.model.CustomerGroup;

/**
 *
 * @author Naveen
 */
public interface CustomerGroupService {

    /**
     *
     * @param customerGroupObj
     */
    public void Save(CustomerGroup customerGroupObj);

    /**
     *
     * @return
     */
    public String getLastGroupID();

}
