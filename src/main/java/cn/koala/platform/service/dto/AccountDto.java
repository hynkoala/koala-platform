package cn.koala.platform.service.dto;

import java.util.Date;

/**
 * Created by hanyaning
 * Email:hynkoala@163.com
 * Date: 2018.12.04
 * Time:8:40
 * Description:
 */
public interface AccountDto {
    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: []
     * @Return: java.lang.String
     * @Description: 获取账单id
     */
    String getAccountId();

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: [id]
     * @Return: void
     * @Description: set账单id
     */
    void setAccountId(String id);

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: []
     * @Return: java.lang.String
     * @Description: get账单名
     */
    String getAccountName();

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: [name]
     * @Return: void
     * @Description: set账单名
     */
    void setAccountName(String name);

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: []
     * @Return: java.lang.String
     * @Description: get账单编号
     */
    String getAccountBh();

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: [bh]
     * @Return: void
     * @Description: set账单编号
     */
    void setAccountBh(String bh);

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: []
     * @Return: java.lang.String
     * @Description: get账单的类型
     */
    String getAccountType();

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: [type]
     * @Return: void
     * @Description: set证书类型
     */
    void setAccountType(String type);

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: []
     * @Return: java.lang.String
     * @Description: get账单交易对象
     */
    String getTradeTarget();

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: [name]
     * @Return: void
     * @Description: get账单交易对象
     */
    void setTradeTarget(String name);

    /**
     *@Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     *@Date: 2019.01.07
     *@Param: [id]
     *@Return: java.lang.String
     *@Description:     获取交易单位的id
     */
    String getUnitId();

    /**
     *@Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     *@Date: 2019.01.07
     *@Param: [id]
     *@Return: void
     *@Description: set交易单位的id
     */
    void setUnitId(String id);

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: []
     * @Return: java.lang.String
     * @Description: set交易对象
     */
    String getGoodsType();

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: [type]
     * @Return: void
     * @Description:
     */
    void setGoodsType(String type);

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: []
     * @Return: java.lang.String
     * @Description:
     */
    String getOtherComment();

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: [str]
     * @Return: void
     * @Description:
     */
    void setOtherComment(String str);

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: [str]
     * @Return: java.lang.String
     * @Description:
     */
    String getContactPerson();

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: [person]
     * @Return: java.lang.String
     * @Description:
     */
    void setContactPerson(String person);

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: [phone]
     * @Return: java.lang.String
     * @Description:
     */
    String getContactWay();

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: [phone]
     * @Return: java.lang.String
     * @Description:
     */
    void setContactWay(String phone);

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: [date]
     * @Return: java.util.Date
     * @Description:
     */
    Date getUpdateTime();

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: [date]
     * @Return: java.util.Date
     * @Description:
     */
    void setUpdateTime(Date date);

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: [date]
     * @Return: java.util.Date
     * @Description:
     */
    Date getCreateTime();

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: [date]
     * @Return: java.util.Date
     * @Description:
     */
    void setCreateTime(Date date);

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: []
     * @Return: java.lang.String
     * @Description:
     */
    String getOperatePerson();

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: [name]
     * @Return: void
     * @Description:
     */
    void setOperatePerson(String name);

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: []
     * @Return: java.lang.Double
     * @Description:
     */
    Double getSumMoney();

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: [sum]
     * @Return: void
     * @Description:
     */
    void setSumMoney(Double sum);
}