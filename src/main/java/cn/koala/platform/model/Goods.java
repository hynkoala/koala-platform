package cn.koala.platform.model;

import java.util.Date;

/**
 * Created by hanyaning
 * Email:hynkoala@163.com
 * Date: 2018.11.27
 * Time:20:19
 * Description:
 */
public class Goods {
    private String goodsId;//
    private String goodsName;//
    private String goodsUnit;//
    private String goodsType;//
    private String goodsBigType;//
    private Integer goodsInPrice;//
    private Integer goodsFixedPrice;//
    private String goodsUsage;//
    private Date produceDate;//
    private Date expiryDate;//
    private Date createTime;//
    private Date updateTime;//
    private String guaranteePeriod;//
    private String doHave;//
    private String goodsModel;

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

    public String getGoodsModel() {
        return goodsModel;
    }

    public void setGoodsModel(String goodsModel) {
        this.goodsModel = goodsModel;
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

    private String goodsBrand;
    private String surplus;


}