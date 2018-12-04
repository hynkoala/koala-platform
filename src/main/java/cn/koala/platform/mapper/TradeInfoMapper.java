package cn.koala.platform.mapper;

import cn.koala.platform.model.TradeInfo;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by hanyaning
 * Email:hynkoala@163.com
 * Date: 2018.12.04
 * Time:20:07
 * Description: 交易详细清单表 的mapper
 */
@Repository
public interface TradeInfoMapper {
    void saveTradeInfo(TradeInfo tradeInfo);

    List<TradeInfo> getTradeInfo(Map map);
}