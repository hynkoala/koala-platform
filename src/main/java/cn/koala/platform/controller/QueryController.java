package cn.koala.platform.controller;

import cn.koala.platform.mapper.AccountOutMapper;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.*;

/**
 * Created by hanyaning
 * Email:hynkoala@163.com
 * Date: 2018.12.26
 * Time:17:12
 * Description: 查询功能控制层
 */
@Controller
@RequestMapping("query")
public class QueryController {

    @Autowired
    AccountOutMapper accountOutMapper;

    @ResponseBody
    @RequestMapping("getUnitsUseAmount")
    public Map getUnitsAmount(String startTime, String endTime) throws ParseException {
        Map returnMap = new HashMap();
        Map map = new HashMap();
        Date startDate;
        Date endDate = new Date();

        if(StringUtils.isBlank(startTime)){
            startDate = DateUtils.addDays(new Date(),-30);
        }else{
            startDate = DateUtils.parseDate(startTime,"yy-MM-dd");
        }
        if(StringUtils.isNotBlank(endTime)){
            endDate = DateUtils.parseDate(startTime,"yy-MM-dd");
        }
        map.put("startTime",startDate);
        map.put("endTime",endDate);
        List<Map> infoList = accountOutMapper.getUnitsUseAmount(map);
        List unitList = new ArrayList();
        List dataList = new ArrayList();
        if (CollectionUtils.isNotEmpty(infoList)) {

            String unitName;
            for (Map map1 : infoList) {
                Map map2 = new HashMap();

                if (map1.get("UNIT") != null) {
                    unitName = map1.get("UNIT").toString();
                } else {
                    unitName = "未知单位";

                }
                map2.put("value", map1.get("MONEY"));
                map2.put("name", unitName);

                unitList.add(unitName);

                dataList.add(map2);
            }
        }
        returnMap.put("unit", unitList);
        returnMap.put("data", dataList);

        return returnMap;

    }

    @ResponseBody
    @RequestMapping("getTimeSeriesSum")
    public Map getTimeSeriesSum(String days) {
        Date currentDate = new Date();
        currentDate = DateUtils.setHours(currentDate, 0);
        currentDate = DateUtils.setMinutes(currentDate, 0);
        currentDate = DateUtils.setSeconds(currentDate, 0);
        currentDate = DateUtils.addDays(currentDate, 1);
        Date endDate ;
        Date startDate;
        int i = 0;
        int sss;
        if (StringUtils.isBlank(days)) {
            sss = 30;
        } else {
            sss = Integer.parseInt(days);
        }
        List dayList = new ArrayList<>();
        List<Map> dataList = new ArrayList<>();
        while (i < sss) {
            endDate = DateUtils.addDays(currentDate, -i);
            startDate = DateUtils.addDays(endDate, -1);
            Map map = new HashMap();
            map.put("startTime", startDate);
            map.put("endTime", endDate);
            Map dataMap = new HashMap();
            dataMap.put("name", 30-i);
            Double sumMoney = accountOutMapper.getTimeSeriesSum(map);
            if (sumMoney != null) {
                dataMap.put("value", sumMoney);
            } else {
                dataMap.put("value", 0);
            }
            dataList.add(dataMap);
            if(i+1!=sss){
                dayList.add(i+1);
            }else {
                dayList.add("30");
            }

            i++;
        }
        Collections.reverse(dataList);
        Map returnMap = new HashMap();
        returnMap.put("xValue", dayList);
        returnMap.put("data", dataList);
        return returnMap;
    }

}