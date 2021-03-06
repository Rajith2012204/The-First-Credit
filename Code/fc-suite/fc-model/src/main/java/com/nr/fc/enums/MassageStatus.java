/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nr.fc.enums;

/**
 *
 * @author Madhuranga Samarasinghe
 */
public class MassageStatus {
    public static final String PENDING = "Pending";
    public static final String READ = "Read";

    /**
     * This function is to help to standardize the General Status
     * Eg. If you insert AcTiVate this will return the correct format with the first letter capital 
     * 	   and other letters simple
     * @param status the binding status should be given here
     * @return "Activate" or "Deactivate"
     */
    public static final String find(String status){
    	if(status.equalsIgnoreCase("Pending")||status.equalsIgnoreCase("Pending")){
			return PENDING;
		}else if(status.equalsIgnoreCase("Read")||status.equalsIgnoreCase("Reading")){
			return READ;
		}else{
			return READ;
		}
    }
    
}
