package cn.koala.platform.mapper;

import cn.koala.platform.model.Goods;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by hanyaning
 * Email:hynkoala@163.com
 * Date: 2018.11.27
 * Time:20:22
 * Description:
 */
@Repository
public interface GoodsMapper {
    void insertGoods(Goods goods);

    List<Goods> getGoodsList(Map map);
}