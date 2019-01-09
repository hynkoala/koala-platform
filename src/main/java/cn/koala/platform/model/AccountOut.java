package cn.koala.platform.model;

import cn.koala.platform.model.parent.Account;

/**
 * Created by hanyaning
 * Email:hynkoala@163.com
 * Date: 2018.11.27
 * Time:20:18
 * Description: 出账单model
 */
public class AccountOut extends Account {
    private String doReceipt;
    private Double taxRate;
    private String doSettle;

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

}