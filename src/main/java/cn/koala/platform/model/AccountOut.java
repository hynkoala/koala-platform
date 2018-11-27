package cn.koala.platform.model;

import java.util.Date;

/**
 * Created by hanyaning
 * Email:hynkoala@163.com
 * Date: 2018.11.27
 * Time:20:18
 * Description:
 */
public class AccountOut {
    private String out_id;//
    private String out_name;//
    private Date out_time;//
    private String bill_id;//
    private String goods_id;//
    private String goods_name;//
    private Integer goods_count;//
    private String goods_unit;//
    private String goods_type;//
    private Integer goods_in_price;//
    private Integer goods_fixed_price;//
    private String goods_purchaser;//
    private String do_receipt;//
    private String user_name;//
    private Integer tax_rate;//
    private String do_clear;//

    public String getOut_id() {
        return out_id;
    }

    public void setOut_id(String out_id) {
        this.out_id = out_id;
    }

    public String getOut_name() {
        return out_name;
    }

    public void setOut_name(String out_name) {
        this.out_name = out_name;
    }

    public Date getOut_time() {
        return out_time;
    }

    public void setOut_time(Date out_time) {
        this.out_time = out_time;
    }

    public String getBill_id() {
        return bill_id;
    }

    public void setBill_id(String bill_id) {
        this.bill_id = bill_id;
    }

    public String getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(String goods_id) {
        this.goods_id = goods_id;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public Integer getGoods_count() {
        return goods_count;
    }

    public void setGoods_count(Integer goods_count) {
        this.goods_count = goods_count;
    }

    public String getGoods_unit() {
        return goods_unit;
    }

    public void setGoods_unit(String goods_unit) {
        this.goods_unit = goods_unit;
    }

    public String getGoods_type() {
        return goods_type;
    }

    public void setGoods_type(String goods_type) {
        this.goods_type = goods_type;
    }

    public Integer getGoods_in_price() {
        return goods_in_price;
    }

    public void setGoods_in_price(Integer goods_in_price) {
        this.goods_in_price = goods_in_price;
    }

    public Integer getGoods_fixed_price() {
        return goods_fixed_price;
    }

    public void setGoods_fixed_price(Integer goods_fixed_price) {
        this.goods_fixed_price = goods_fixed_price;
    }

    public String getGoods_purchaser() {
        return goods_purchaser;
    }

    public void setGoods_purchaser(String goods_purchaser) {
        this.goods_purchaser = goods_purchaser;
    }

    public String getDo_receipt() {
        return do_receipt;
    }

    public void setDo_receipt(String do_receipt) {
        this.do_receipt = do_receipt;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public Integer getTax_rate() {
        return tax_rate;
    }

    public void setTax_rate(Integer tax_rate) {
        this.tax_rate = tax_rate;
    }

    public String getDo_clear() {
        return do_clear;
    }

    public void setDo_clear(String do_clear) {
        this.do_clear = do_clear;
    }
}