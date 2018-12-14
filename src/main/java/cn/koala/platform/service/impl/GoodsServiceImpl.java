package cn.koala.platform.service.impl;

import cn.koala.platform.mapper.GoodsMapper;
import cn.koala.platform.model.Goods;
import cn.koala.platform.model.TradeInfo;
import cn.koala.platform.service.GoodsService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.UUID;

/**
 * Created by 12732
 * Email:hynkoala@163.com
 * Date: 2018.12.01
 * Time:0:57
 * Description:
 */
@Service
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    GoodsMapper goodsMapper;

    @Override
    public Goods initGoodsFromTradeInfo(TradeInfo tradeInfo) {
        Goods goods = new Goods();
        BeanUtils.copyProperties(tradeInfo, goods);
        goods.setCreateTime(new Date());
        goods.setUpdateTime(new Date());
        //Todo dohave的值通过仓库现有量和交易量来计算得出
        goods.setDoHave("1");
        if (StringUtils.isBlank(goods.getGoodsId())) {
            goods.setGoodsId(UUID.randomUUID().toString().replace("-", "1"));
        }
        goodsMapper.insertGoods(goods);
        return goods;
    }
}
