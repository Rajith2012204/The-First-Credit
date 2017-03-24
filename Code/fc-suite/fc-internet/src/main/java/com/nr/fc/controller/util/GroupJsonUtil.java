/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nr.fc.controller.util;

import com.nr.fc.json.model.GroupJson;
import com.nr.fc.model.CustomerGroup;
import com.nr.fc.util.DateUtil;

import org.springframework.stereotype.Component;

/**
 *
 * @author Naveen
 */
@Component
public class GroupJsonUtil {
    /**
     * 
     * @param group
     * @return 
     */
    public GroupJson toJson(CustomerGroup group) {

        GroupJson groupJson = new GroupJson();
        groupJson.setGroupId(group.getGroupId());
        groupJson.setGroupName(group.getGroupName());
        groupJson.setDateOfEstablishment(DateUtil.dateToString(group.getDateOfEstablishment(), DateUtil.Formats.DEFAULTDATE));
        groupJson.setEmployeeName(group.getEmployee().getFirstName());
        groupJson.setMeetingDate(DateUtil.dateToString(group.getMeetingDate(), DateUtil.Formats.DEFAULTDATE));
        groupJson.setBranch(group.getBranch());
        groupJson.setAddress(group.getPrimaryAddress());
        groupJson.setContact(group.getPrimaryContact());
        groupJson.setDescription(group.getDescription());
        groupJson.setStatus(group.getStatus());

        return groupJson;
    }

}
