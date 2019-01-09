package cn.koala.platform.mapper;

import cn.koala.platform.model.TrainUnit;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by hanyaning
 * Email:hynkoala@163.com
 * Date: 2019.01.07
 * Time:16:14
 * Description:
 */
@Repository
public interface TrainUnitMapper {
    void saveTradeUnit(TrainUnit unit);
    void updateTradeUnit(TrainUnit unit);
    void delTradeUnit(String id);
    List<TrainUnit> getTradeUnits(Map map);

}