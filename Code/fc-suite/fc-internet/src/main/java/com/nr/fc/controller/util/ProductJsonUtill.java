/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nr.fc.controller.util;

import com.nr.fc.json.model.LoanJson;
import com.nr.fc.model.Loan;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Component;

/**
 *
 * @author naveendrafernando
 */
@Component
public class ProductJsonUtill {

    public List<LoanJson> toJson(List<Loan> loans) {

        List<LoanJson> loanJsonObjList=new  ArrayList<>();
        for (Loan loanObj : loans) {

            LoanJson loanJsonObj = new LoanJson();
            loanJsonObj.setLoanId(loanObj.getLoanId());
            loanJsonObj.setLoanName(loanObj.getLoanName());
            loanJsonObj.setInstallmentType(loanObj.getInstallmentType());
            loanJsonObj.setAmount(Double.toString(loanObj.getAmount()));
            loanJsonObj.setInterestRate(Double.toString(loanObj.getInterestRate()));
            loanJsonObj.setTerms(Double.toString(loanObj.getTerms()));
            loanJsonObj.setStartingFee(Double.toString(loanObj.getStartingFee()));
            loanJsonObj.setAdminFee(Double.toString(loanObj.getAdminFee()));
            loanJsonObj.setInsuranceFee(Double.toString(loanObj.getInsuranceFee()));
            loanJsonObj.setLateFee(Double.toString(loanObj.getLateFee()));
            loanJsonObj.setDocumentFee(Double.toString(loanObj.getDocumentFee()));
            loanJsonObj.setOverduePrinciple(Double.toString(loanObj.getOverduePrinciple()));
            loanJsonObj.setStatus(loanObj.getStatus());
            loanJsonObj.setDescription(loanObj.getDescription());
            loanJsonObjList.add(loanJsonObj);
        }

        return loanJsonObjList;
    }

}
