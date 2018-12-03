package cn.koala.platform.model;

import java.util.Date;

/**
 * Created by hanyaning
 * Email:hynkoala@163.com
 * Date: 2018.12.03
 * Time:17:20
 * Description:
 */
public class Account {
    private String accountId;
    private String accountName;
    private String accountBh;
    private String goodsType;
    private String tradeTarget;
    private String contactPerson;
    private String contactWay;
    private String otherComment;
    private Double sumMoney;
    private String operatePerson;
    private String doReceipt;
    private Double taxRate;
    private String doSettle;
    private Date createTime;
    private Date updateTime;

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getAccountBh() {
        return accountBh;
    }

    public void setAccountBh(String accountBh) {
        this.accountBh = accountBh;
    }

    public String getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(String goodsType) {
        this.goodsType = goodsType;
    }

    public String getTradeTarget() {
        return tradeTarget;
    }

    public void setTradeTarget(String tradeTarget) {
        this.tradeTarget = tradeTarget;
    }

    public String getContactPerson() {
        return contactPerson;
    }

    public void setContactPerson(String contactPerson) {
        this.contactPerson = contactPerson;
    }

    public String getContactWay() {
        return contactWay;
    }

    public void setContactWay(String contactWay) {
        this.contactWay = contactWay;
    }

    public String getOtherComment() {
        return otherComment;
    }

    public void setOtherComment(String otherComment) {
        this.otherComment = otherComment;
    }

    public Double getSumMoney() {
        return sumMoney;
    }

    public void setSumMoney(Double sumMoney) {
        this.sumMoney = sumMoney;
    }

    public String getOperatePerson() {
        return operatePerson;
    }

    public void setOperatePerson(String operatePerson) {
        this.operatePerson = operatePerson;
    }

    public String getDoReceipt() {
        return doReceipt;
    }

    public void setDoReceipt(String doReceipt) {
        this.doReceipt = doReceipt;
    }

    public Double getTaxRate() {
        return taxRate;
    }

    public void setTaxRate(Double taxRate) {
        this.taxRate = taxRate;
    }

    public String getDoSettle() {
        return doSettle;
    }

    public void setDoSettle(String doSettle) {
        this.doSettle = doSettle;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}