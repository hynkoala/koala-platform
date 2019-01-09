package cn.koala.platform.model.parent;

import cn.koala.platform.service.dto.AccountDto;

import java.util.Date;

/**
 * Created by hanyaning
 * Email:hynkoala@163.com
 * Date: 2018.12.03
 * Time:17:20
 * Description:
 */
public class Account implements AccountDto {
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
    private Date createTime;
    private Date updateTime;
    private String accountType;
    private String unitId;

    @Override
    public String getUnitId() {
        return unitId;
    }

    @Override
    public void setUnitId(String unitId) {
        this.unitId = unitId;
    }

    @Override
    public String getAccountType() {
        return accountType;
    }

    @Override
    public void setAccountType(String accountType) {
        this.accountType = accountType;
    }

    @Override
    public String getAccountId() {
        return accountId;
    }

    @Override
    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    @Override
    public String getAccountName() {
        return accountName;
    }

    @Override
    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    @Override
    public String getAccountBh() {
        return accountBh;
    }

    @Override
    public void setAccountBh(String accountBh) {
        this.accountBh = accountBh;
    }

    @Override
    public String getGoodsType() {
        return goodsType;
    }

    @Override
    public void setGoodsType(String goodsType) {
        this.goodsType = goodsType;
    }

    @Override
    public String getTradeTarget() {
        return tradeTarget;
    }

    @Override
    public void setTradeTarget(String tradeTarget) {
        this.tradeTarget = tradeTarget;
    }

    @Override
    public String getContactPerson() {
        return contactPerson;
    }

    @Override
    public void setContactPerson(String contactPerson) {
        this.contactPerson = contactPerson;
    }

    @Override
    public String getContactWay() {
        return contactWay;
    }

    @Override
    public void setContactWay(String contactWay) {
        this.contactWay = contactWay;
    }

    @Override
    public String getOtherComment() {
        return otherComment;
    }

    @Override
    public void setOtherComment(String otherComment) {
        this.otherComment = otherComment;
    }

    @Override
    public Double getSumMoney() {
        return sumMoney;
    }

    @Override
    public void setSumMoney(Double sumMoney) {
        this.sumMoney = sumMoney;
    }

    @Override
    public String getOperatePerson() {
        return operatePerson;
    }

    @Override
    public void setOperatePerson(String operatePerson) {
        this.operatePerson = operatePerson;
    }

    @Override
    public Date getCreateTime() {
        return createTime;
    }

    @Override
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public Date getUpdateTime() {
        return updateTime;
    }

    @Override
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

}