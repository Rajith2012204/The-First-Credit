/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nr.fc.controller.product;

import com.nr.fc.controller.ServicePath;
import com.nr.fc.controller.util.ProductJsonUtill;
import com.nr.fc.exception.BussinessException;
import com.nr.fc.json.model.JsonReturn;
import com.nr.fc.json.model.LoanJson;
import com.nr.fc.model.Loan;
import com.nr.fc.service.product.ProductService;
import java.util.Date;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author naveendrafernando
 */
@Controller
@RequestMapping(value = ServicePath.ADMIN_PREFIX + ServicePath.CREATE_PRODUCT)
public class ProductController {
    
    @Autowired
    private ProductService productService;
    
    @Autowired
    private ProductJsonUtill productJsonUtill;
    
     private static final Logger LOGGER = LoggerFactory.getLogger(ProductController.class);

    @RequestMapping(value = "/save", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    public JsonReturn save(@RequestParam(value = "loanName", required = true) String loanName,
            @RequestParam(value = "installmentType", required = true) String installmentType,
            @RequestParam(value = "productAmount", required = true) String productAmount,
            @RequestParam(value = "interestRate", required = true) String interestRate,
            @RequestParam(value = "productTerms", required = true) String productTerms,
            @RequestParam(value = "description", required = true) String description,
            @RequestParam(value = "status", required = true) String status,
            @RequestParam(value = "startingFee", required = true) String startingFee,
            @RequestParam(value = "adminFee", required = true) String adminFee,
            @RequestParam(value = "insuranceFee", required = true) String insuranceFee,
            @RequestParam(value = "documentFee", required = true) String documentFee,
            @RequestParam(value = "lateFee", required = true) String lateFee,
            @RequestParam(value = "overduePrinciple", required = true) String overduePrinciple,
            @RequestParam(value = "username", required = true) String username) {

        JsonReturn jsonReturn = new JsonReturn();
        Loan loanObj = new Loan();

        try {

            List<Loan> exLoanObj=productService.findByLoanNam(loanName);
            
            if(exLoanObj.isEmpty()){
                
                loanObj.setLoanName(loanName);
                
            }else{
                throw new BussinessException("Loan name already exsist!");
            }
            
            
            loanObj.setInstallmentType(installmentType);
            
            try{
                
            double amount = Double.parseDouble(productAmount);
            loanObj.setAmount(amount);
            
            double interestRateValue = Double.parseDouble(interestRate);
            loanObj.setInterestRate(interestRateValue);
            
             double productTermsValue = Double.parseDouble(productTerms);
            loanObj.setTerms(productTermsValue);
            
            double startingFeeValue = Double.parseDouble(startingFee);
            loanObj.setStartingFee(startingFeeValue);
            
            double adminFeeValue = Double.parseDouble(adminFee);
            loanObj.setAdminFee(adminFeeValue);
            
            double insuranceFeeValue = Double.parseDouble(insuranceFee);
            loanObj.setInsuranceFee(insuranceFeeValue);
            
            double documentFeeValue = Double.parseDouble(documentFee);
            loanObj.setDocumentFee(documentFeeValue);
            
            double lateFeeValue = Double.parseDouble(lateFee);
            loanObj.setLateFee(lateFeeValue);
            
            double overduePrincipleValue = Double.parseDouble(overduePrinciple);
            loanObj.setOverduePrinciple(overduePrincipleValue);
            
            }
            catch(NumberFormatException e){
                
              throw new BussinessException("value cannot be converted to number !");  
              
            }
            
            loanObj.setDescription(description);
            loanObj.setStatus(status);
            loanObj.setAddedBy(username);
            loanObj.setModifiedBy(username);
            loanObj.setAddedDate(new Date());
            productService.save(loanObj);
            
            
            jsonReturn.setSuccess("true");
            jsonReturn.setResult(loanObj.getLoanName());
   
        } catch (BussinessException e) {
            jsonReturn.setSuccess("false");
            jsonReturn.setErrorMessage(e.getMsg());
            jsonReturn.setErrorCode("123");
            e.printStackTrace();
        } catch (Exception e) {
            jsonReturn.setSuccess("false");
            jsonReturn.setErrorMessage(e.getMessage());
            jsonReturn.setErrorCode("123");
            LOGGER.error("Exception Occured", e);
            e.printStackTrace();
        }
        return jsonReturn;
    }
    
    
    @RequestMapping(value = "/find/all", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public List<LoanJson> findAllLoans() {

        List<Loan> loans = productService.findAll();

        return productJsonUtill.toJson(loans);

    }

    
    
}
