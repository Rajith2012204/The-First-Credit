/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nr.fc.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author naveendrafernando
 */
@Entity
@Table(name = "fc_loan")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Loan.findAll", query = "SELECT l FROM Loan l")
    , @NamedQuery(name = "Loan.findByLoanId", query = "SELECT l FROM Loan l WHERE l.loanId = :loanId")
    , @NamedQuery(name = "Loan.findByLoanName", query = "SELECT l FROM Loan l WHERE l.loanName = :loanName")
    , @NamedQuery(name = "Loan.findByInstallmentType", query = "SELECT l FROM Loan l WHERE l.installmentType = :installmentType")
    , @NamedQuery(name = "Loan.findByAmount", query = "SELECT l FROM Loan l WHERE l.amount = :amount")
    , @NamedQuery(name = "Loan.findByInterestRate", query = "SELECT l FROM Loan l WHERE l.interestRate = :interestRate")
    , @NamedQuery(name = "Loan.findByTerms", query = "SELECT l FROM Loan l WHERE l.terms = :terms")
    , @NamedQuery(name = "Loan.findByStartingFee", query = "SELECT l FROM Loan l WHERE l.startingFee = :startingFee")
    , @NamedQuery(name = "Loan.findByAdminFee", query = "SELECT l FROM Loan l WHERE l.adminFee = :adminFee")
    , @NamedQuery(name = "Loan.findByInsuranceFee", query = "SELECT l FROM Loan l WHERE l.insuranceFee = :insuranceFee")
    , @NamedQuery(name = "Loan.findByLateFee", query = "SELECT l FROM Loan l WHERE l.lateFee = :lateFee")
    , @NamedQuery(name = "Loan.findByDocumentFee", query = "SELECT l FROM Loan l WHERE l.documentFee = :documentFee")
    , @NamedQuery(name = "Loan.findByOverduePrinciple", query = "SELECT l FROM Loan l WHERE l.overduePrinciple = :overduePrinciple")
    , @NamedQuery(name = "Loan.findByStatus", query = "SELECT l FROM Loan l WHERE l.status = :status")
    , @NamedQuery(name = "Loan.findByAddedBy", query = "SELECT l FROM Loan l WHERE l.addedBy = :addedBy")
    , @NamedQuery(name = "Loan.findByAddedDate", query = "SELECT l FROM Loan l WHERE l.addedDate = :addedDate")
    , @NamedQuery(name = "Loan.findByModifiedBy", query = "SELECT l FROM Loan l WHERE l.modifiedBy = :modifiedBy")
    , @NamedQuery(name = "Loan.findByModifiedDate", query = "SELECT l FROM Loan l WHERE l.modifiedDate = :modifiedDate")})
public class Loan implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "loan_id")
    private String loanId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "loan_name")
    private String loanName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "installment_type")
    private String installmentType;
    @Basic(optional = false)
    @NotNull
    @Column(name = "amount")
    private double amount;
    @Basic(optional = false)
    @NotNull
    @Column(name = "interest_rate")
    private double interestRate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "terms")
    private double terms;
    @Basic(optional = false)
    @NotNull
    @Column(name = "starting_fee")
    private double startingFee;
    @Basic(optional = false)
    @NotNull
    @Column(name = "admin_fee")
    private double adminFee;
    @Basic(optional = false)
    @NotNull
    @Column(name = "insurance_fee")
    private double insuranceFee;
    @Basic(optional = false)
    @NotNull
    @Column(name = "late_fee")
    private double lateFee;
    @Basic(optional = false)
    @NotNull
    @Column(name = "document_fee")
    private double documentFee;
    @Basic(optional = false)
    @NotNull
    @Column(name = "overdue_principle")
    private double overduePrinciple;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "status")
    private String status;
    @Lob
    @Size(max = 65535)
    @Column(name = "description")
    private String description;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "added_by")
    private String addedBy;
    @Basic(optional = false)
    @NotNull
    @Column(name = "added_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date addedDate;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "modified_by")
    private String modifiedBy;
    @Basic(optional = false)
    @NotNull
    @Column(name = "modified_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date modifiedDate;

    public Loan() {
    }

    public Loan(String loanId) {
        this.loanId = loanId;
    }

    public Loan(String loanId, String loanName, String installmentType, double amount, double interestRate, double terms, double startingFee, double adminFee, double insuranceFee, double lateFee, double documentFee, double overduePrinciple, String status, String addedBy, Date addedDate, String modifiedBy, Date modifiedDate) {
        this.loanId = loanId;
        this.loanName = loanName;
        this.installmentType = installmentType;
        this.amount = amount;
        this.interestRate = interestRate;
        this.terms = terms;
        this.startingFee = startingFee;
        this.adminFee = adminFee;
        this.insuranceFee = insuranceFee;
        this.lateFee = lateFee;
        this.documentFee = documentFee;
        this.overduePrinciple = overduePrinciple;
        this.status = status;
        this.addedBy = addedBy;
        this.addedDate = addedDate;
        this.modifiedBy = modifiedBy;
        this.modifiedDate = modifiedDate;
    }

    public String getLoanId() {
        return loanId;
    }

    public void setLoanId(String loanId) {
        this.loanId = loanId;
    }

    public String getLoanName() {
        return loanName;
    }

    public void setLoanName(String loanName) {
        this.loanName = loanName;
    }

    public String getInstallmentType() {
        return installmentType;
    }

    public void setInstallmentType(String installmentType) {
        this.installmentType = installmentType;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public double getInterestRate() {
        return interestRate;
    }

    public void setInterestRate(double interestRate) {
        this.interestRate = interestRate;
    }

    public double getTerms() {
        return terms;
    }

    public void setTerms(double terms) {
        this.terms = terms;
    }

    public double getStartingFee() {
        return startingFee;
    }

    public void setStartingFee(double startingFee) {
        this.startingFee = startingFee;
    }

    public double getAdminFee() {
        return adminFee;
    }

    public void setAdminFee(double adminFee) {
        this.adminFee = adminFee;
    }

    public double getInsuranceFee() {
        return insuranceFee;
    }

    public void setInsuranceFee(double insuranceFee) {
        this.insuranceFee = insuranceFee;
    }

    public double getLateFee() {
        return lateFee;
    }

    public void setLateFee(double lateFee) {
        this.lateFee = lateFee;
    }

    public double getDocumentFee() {
        return documentFee;
    }

    public void setDocumentFee(double documentFee) {
        this.documentFee = documentFee;
    }

    public double getOverduePrinciple() {
        return overduePrinciple;
    }

    public void setOverduePrinciple(double overduePrinciple) {
        this.overduePrinciple = overduePrinciple;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAddedBy() {
        return addedBy;
    }

    public void setAddedBy(String addedBy) {
        this.addedBy = addedBy;
    }

    public Date getAddedDate() {
        return addedDate;
    }

    public void setAddedDate(Date addedDate) {
        this.addedDate = addedDate;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public Date getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (loanId != null ? loanId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Loan)) {
            return false;
        }
        Loan other = (Loan) object;
        if ((this.loanId == null && other.loanId != null) || (this.loanId != null && !this.loanId.equals(other.loanId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.nr.fc.model.Loan[ loanId=" + loanId + " ]";
    }
    
}
