package cn.koala.platform.model;

import java.util.Date;

/**
 * Created by hanyaning
 * Email:hynkoala@163.com
 * Date: 2018.11.27
 * Time:20:14
 * Description:
 */
public class AccountIn {
    private String inId;//
    private String inName;//
    private Date inTime;//
    private String goodsType;//
    private String inBh;//
    private String otherComment;//
    private Double sumMoney;//
    private String supplier;//
    private String supplierPhone;//
    private String supplierAddress;//
    private String contactPerson;//
    private String operatePerson;//
    private Date createTime;//
    private Date updateTime;//

    public String getInId() {
        return inId;
    }

    public void setInId(String inId) {
        this.inId = inId;
    }

    public String getInName() {
        return inName;
    }

    public void setInName(String inName) {
        this.inName = inName;
    }

    public Date getInTime() {
        return inTime;
    }

    public void setInTime(Date inTime) {
        this.inTime = inTime;
    }

    public String getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(String goodsType) {
        this.goodsType = goodsType;
    }

    public String getInBh() {
        return inBh;
    }

    public void setInBh(String inBh) {
        this.inBh = inBh;
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

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public String getSupplierPhone() {
        return supplierPhone;
    }

    public void setSupplierPhone(String supplierPhone) {
        this.supplierPhone = supplierPhone;
    }

    public String getSupplierAddress() {
        return supplierAddress;
    }

    public void setSupplierAddress(String supplierAddress) {
        this.supplierAddress = supplierAddress;
    }

    public String getContactPerson() {
        return contactPerson;
    }

    public void setContactPerson(String contactPerson) {
        this.contactPerson = contactPerson;
    }

    public String getOperatePerson() {
        return operatePerson;
    }

    public void setOperatePerson(String operatePerson) {
        this.operatePerson = operatePerson;
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