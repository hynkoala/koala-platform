package cn.koala.platform.model;

import java.util.Date;

/**
 * Created by hanyaning
 * Email:hynkoala@163.com
 * Date: 2019.01.07
 * Time:16:09
 * Description: 单位训练表model，每次创建账单时储存交易对象信息（新建或者更新）
 */
public class TrainUnit {
    private String unitId;
    private String unitName;
    private String contactPerson;
    private String contactWay;
    private String unitType;
    private Integer useFrequency;
    private Date createTime;
    private Date updateTime;

    public String getUnitId() {
        return unitId;
    }

    public void setUnitId(String unitId) {
        this.unitId = unitId;
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
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

    public String getUnitType() {
        return unitType;
    }

    public void setUnitType(String unitType) {
        this.unitType = unitType;
    }

    public Integer getUseFrequency() {
        return useFrequency;
    }

    public void setUseFrequency(Integer useFrequency) {
        this.useFrequency = useFrequency;
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