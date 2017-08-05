/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nr.fc.controller.util;

import com.nr.fc.json.model.CustomerJson;
import com.nr.fc.model.Customer;
import com.nr.fc.model.CustomerContact;
import com.nr.fc.service.customer.CustomerContactService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author Naveen
 */
@Component
public class CustomerJsonUtil {

    @Autowired
    private CustomerContactService customerContactService;

    public CustomerJson toJson(Customer customer) {

        CustomerJson customerJson = new CustomerJson();
        customerJson.setCustomerId(customer.getCustomerId());
        customerJson.setSalutaionId(customer.getSalutaionId());
        customerJson.setFirstName(customer.getFirstName());
        customerJson.setMiddleName(customer.getMiddleName());
        customerJson.setLastName(customer.getLastName());
        customerJson.setGender(customer.getGender());
        customerJson.setIdType(customer.getIdType());
        customerJson.setCustomerIdentificationNumber(customer.getCustomerIdentificationNo());
        customerJson.setIssueCountry(customer.getIssudeCountry());
        customerJson.setOccupation(customer.getOccupation());
        customerJson.setNoOfFamilyMembers(customer.getNoOfFamilyMembers());
        customerJson.setNoOfDependents(customer.getNoOfDependents());
        customerJson.setFirstAddress(customer.getFirstAddress());
        customerJson.setSecondAddress(customer.getSecondAddress());
        customerJson.setCity(customer.getCity());
        customerJson.setProvince(customer.getProvince());
        //customerJson.setImageId(customer.geti);
        customerJson.setStatus(customer.getStatus());

        List<CustomerContact> contactsList = customerContactService.findByCustomerId(customer.getCustomerId());

        for (CustomerContact contactsListobject : contactsList) {

            if (contactsListobject.getCustomerContactPK().getContactCategory().equalsIgnoreCase("primary") && contactsListobject.getCustomerContactPK().getContactType().equalsIgnoreCase("telephone")) {
                customerJson.setMobileNumberOne(contactsListobject.getContact());
            }

            if (contactsListobject.getCustomerContactPK().getContactCategory().equalsIgnoreCase("primary") && contactsListobject.getCustomerContactPK().getContactType().equalsIgnoreCase("land line")) {
                customerJson.setLandLineNumber(contactsListobject.getContact());
            }

            if (contactsListobject.getCustomerContactPK().getContactCategory().equalsIgnoreCase("primary") && contactsListobject.getCustomerContactPK().getContactType().equalsIgnoreCase("email")) {
                customerJson.setPersonalEmail(contactsListobject.getContact());
            }

            if (contactsListobject.getCustomerContactPK().getContactCategory().equalsIgnoreCase("normal") && contactsListobject.getCustomerContactPK().getContactType().equalsIgnoreCase("telephone")) {
                customerJson.setMobileNumberTwo(contactsListobject.getContact());
            }

            if (contactsListobject.getCustomerContactPK().getContactCategory().equalsIgnoreCase("normal") && contactsListobject.getCustomerContactPK().getContactType().equalsIgnoreCase("email")) {
                customerJson.setEmail(contactsListobject.getContact());
            }

            if (contactsListobject.getCustomerContactPK().getContactCategory().equalsIgnoreCase("normal") && contactsListobject.getCustomerContactPK().getContactType().equalsIgnoreCase("fax")) {
                customerJson.setFax(contactsListobject.getContact());
            }

        }
        return customerJson;

    }

}
