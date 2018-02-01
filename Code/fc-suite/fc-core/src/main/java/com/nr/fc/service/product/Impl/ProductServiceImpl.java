/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nr.fc.service.product.Impl;

import com.nr.fc.dao.LoanDao;
import com.nr.fc.model.Customer;
import com.nr.fc.model.Loan;
import com.nr.fc.service.product.ProductService;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author naveendrafernando
 */
@Service
public class ProductServiceImpl implements ProductService{

    @Autowired
    LoanDao loanDao;
    
    @Override
    public String generateLoanId() {
         String sql = "SELECT l FROM Loan l ORDER BY l.loanId DESC ";
        Map<String, Object> params = new HashMap<>();
        List<Loan> loanObj = loanDao.findbyQueryLimit(sql, params, 1);
        String lastId = "1000000";
        if (loanObj.size() > 0) {
            lastId = loanObj.get(0).getLoanId();
        }
        int intLastId = Integer.parseInt(lastId);
        intLastId++;
        return "" + intLastId;
    }

    @Override
    @Transactional
    public void save(Loan loanObj) throws Exception {
       loanObj.setLoanId(generateLoanId());
       loanObj.setModifiedDate(new Date());
       loanDao.create(loanObj);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void update(Loan loanObj) throws Exception {
        loanDao.update(loanObj);
    }

    @Override
    public Loan findByLoanId(String loanId) {
       String sql = "SELECT l FROM Loan l WHERE l.loanId = :loanId";
        Map<String, Object> params = new HashMap<>();
        params.put("loanId", loanId);
        return loanDao.findbyQuerySingle(sql, params);
    }

    @Override
    public List<Loan> findByLoanNam(String loanName) {
        String sql = "SELECT l FROM Loan l WHERE l.loanName = :loanName";
        Map<String, Object> params = new HashMap<>();
        params.put("loanName", loanName);
        return loanDao.findbyQuery(sql, params);
    }

    @Override
    public List<Loan> findAll() {
        
        return loanDao.findAll();
    }
    
}
