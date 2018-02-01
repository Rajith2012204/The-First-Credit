/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nr.fc.service.product;

import com.nr.fc.model.Loan;
import java.util.List;

/**
 *
 * @author naveendrafernando
 */
public interface ProductService {
    
 
   /**
    * 
    * @return 
    */
    public String generateLoanId();

    /**
     *
     * @param loanObj
     * @throws java.lang.Exception
     */
    public void save(Loan loanObj)throws Exception;
    
    /**
     * 
     * @param loanObj 
     * @throws java.lang.Exception 
     */
    public void update(Loan loanObj)throws Exception;

    /**
     *
     * @param loanId
     * @return 
     */
    public Loan findByLoanId(String loanId);
    
     /**
     *
     * @param loanName
     * @return 
     */
    public List<Loan> findByLoanNam(String loanName);
    
     /**
      * 
      * @return 
      */
     public List<Loan> findAll();
}
