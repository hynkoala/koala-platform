package cn.koala.platform.model;

import java.util.Date;

/**
 * Created by hanyaning
 * Email:hynkoala@163.com
 * Date: 2018.11.27
 * Time:20:19
 * Description: 货物表model
 */
public class Goods {
    private String goodsId;//
    private String goodsName;//
    private String goodsUnit;//
    private String goodsType;//
    private String goodsBigType;//
    private Double goodsInPrice;//
    private Double goodsFixedPrice;//
    private String goodsUsage;//
    private Date produceDate;//
    private Date expiryDate;//
    private Date createTime;//
    private Date updateTime;//
    private String guaranteePeriod;//
    private String doHave;//
    private String goodsSize;
    private String goodsBrand;
    private String surplus;
    private String goodsBh;

    public String getGoodsBh() {
        return goodsBh;
    }

    public void setGoodsBh(String goodsBh) {
        this.goodsBh = goodsBh;
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

    public String getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(String goodsType) {
        this.goodsType = goodsType;
    }

    public String getGoodsBigType() {
        return goodsBigType;
    }

    public void setGoodsBigType(String goodsBigType) {
        this.goodsBigType = goodsBigType;
    }

    public Double getGoodsInPrice() {
        return goodsInPrice;
    }

    public void setGoodsInPrice(Double goodsInPrice) {
        this.goodsInPrice = goodsInPrice;
    }

    public Double getGoodsFixedPrice() {
        return goodsFixedPrice;
    }

    public void setGoodsFixedPrice(Double goodsFixedPrice) {
        this.goodsFixedPrice = goodsFixedPrice;
    }

    public String getGoodsUsage() {
        return goodsUsage;
    }

    public void setGoodsUsage(String goodsUsage) {
        this.goodsUsage = goodsUsage;
    }

    public Date getProduceDate() {
        return produceDate;
    }

    public void setProduceDate(Date produceDate) {
        this.produceDate = produceDate;
    }

    public Date getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
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

    public String getGuaranteePeriod() {
        return guaranteePeriod;
    }

    public void setGuaranteePeriod(String guaranteePeriod) {
        this.guaranteePeriod = guaranteePeriod;
    }

    public String getDoHave() {
        return doHave;
    }

    public void setDoHave(String doHave) {
        this.doHave = doHave;
    }

    public String getGoodsSize() {
        return goodsSize;
    }

    public void setGoodsSize(String goodsSize) {
        this.goodsSize = goodsSize;
    }

    public String getGoodsBrand() {
        return goodsBrand;
    }

    public void setGoodsBrand(String goodsBrand) {
        this.goodsBrand = goodsBrand;
    }

    public String getSurplus() {
        return surplus;
    }

    public void setSurplus(String surplus) {
        this.surplus = surplus;
    }
}