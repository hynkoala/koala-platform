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
    Goods initGoodsFromTradeInfo(TradeInfo tradeInfo);

}
