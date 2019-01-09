package cn.koala.platform.service;

import cn.koala.platform.model.Goods;
import cn.koala.platform.model.TradeInfo;

/**
 * Created by 12732
 * Email:hynkoala@163.com
 * Date: 2018.12.01
 * Time:0:56
 * Description:
 */
public interface GoodsService {
    /**
     *@Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     *@Date: 2019.01.07
     *@Param: [tradeInfo]
     *@Return: cn.koala.platform.model.Goods
     *@Description: 从账单交易明细中来提取获取信息，对应goods model类
     */
    Goods initGoodsFromTradeInfo(TradeInfo tradeInfo);

}
