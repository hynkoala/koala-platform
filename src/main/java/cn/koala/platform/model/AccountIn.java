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
    private String billId;//
    private String goodsId;//
    private String goodsName;//
    private String goodsUnit;//
    private Integer goodsCount;//
    private String goodsType;//
    private Integer goodsInPrice;//
    private Integer goodsFixedPrice;//
    private String goodsSupplier;//
    private String userName;//

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

    public String getBillId() {
        return billId;
    }

    public void setBillId(String billId) {
        this.billId = billId;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsUnit() {
        return goodsUnit;
    }

    public void setGoodsUnit(String goodsUnit) {
        this.goodsUnit = goodsUnit;
    }

    public Integer getGoodsCount() {
        return goodsCount;
    }

    public void setGoodsCount(Integer goodsCount) {
        this.goodsCount = goodsCount;
    }

    public String getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(String goodsType) {
        this.goodsType = goodsType;
    }

    public Integer getGoodsInPrice() {
        return goodsInPrice;
    }

    public void setGoodsInPrice(Integer goodsInPrice) {
        this.goodsInPrice = goodsInPrice;
    }

    public Integer getGoodsFixedPrice() {
        return goodsFixedPrice;
    }

    public void setGoodsFixedPrice(Integer goodsFixedPrice) {
        this.goodsFixedPrice = goodsFixedPrice;
    }

    public String getGoodsSupplier() {
        return goodsSupplier;
    }

    public void setGoodsSupplier(String goodsSupplier) {
        this.goodsSupplier = goodsSupplier;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}