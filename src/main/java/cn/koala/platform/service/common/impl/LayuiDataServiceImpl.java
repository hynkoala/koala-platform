package cn.koala.platform.service.common.impl;

import cn.koala.platform.service.common.DataOrganizeService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by hanyaning
 * Email:hynkoala@163.com
 * Date: 2018.11.30
 * Time:8:51
 * Description:
 */
@Service
public class LayuiDataServiceImpl implements DataOrganizeService {

    @Override
    public Map tableDataOrganize(Map map) {
        int limit;
        int page;
        List dataList = (List) map.get("data");
        Map resultMap = new HashMap();
        if (CollectionUtils.isNotEmpty(dataList)) {
            if (map.containsKey("limit")) {
                limit = (int) map.get("limit");
            } else {
                limit = 0;
            }
            if (map.containsKey("page")) {
                page = (int) map.get("page");
            } else {
                page = 1;
            }
            int start = limit * (page - 1);
            int end = limit * (page);
            if (end > dataList.size()) {
                end = dataList.size();
            }
            List returnList = dataList.subList(start, end);
            resultMap.put("code", "0");
            resultMap.put("msg", "success");
            resultMap.put("data", returnList);
            resultMap.put("count", dataList.size());
        } else {
            resultMap.put("code", "0");
            resultMap.put("msg", "success");
            resultMap.put("data", null);
            resultMap.put("count", 0);
        }
        return resultMap;
    }

}