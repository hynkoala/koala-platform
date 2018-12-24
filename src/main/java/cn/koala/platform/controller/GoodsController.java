package cn.koala.platform.controller;

import cn.koala.platform.constant.CommonConstant;
import cn.koala.platform.mapper.GoodsMapper;
import cn.koala.platform.model.Goods;
import cn.koala.platform.service.common.DataManagerService;
import cn.koala.platform.service.common.DataOrganizeService;
import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

/**
 * Created by hanyaning
 * Email:hynkoala@163.com
 * Date: 2018.11.27
 * Time:20:23
 * Description:
 */
@Controller
@RequestMapping("goods")
public class GoodsController {
    @Autowired
    GoodsMapper goodsMapper;
    @Autowired
    DataManagerService dataManagerService;
    @Autowired
    DataOrganizeService dataOrganizeService;
    @RequestMapping("toAddGoods")
    public String toAddGoods(Model model) {

        String path = "goods/addGoods";
        return path;
    }

    @RequestMapping("toGoodsList")
    public String toGoodsList(Model model) {
        String path = "goods/goodsList";
        return path;
    }

    @RequestMapping("saveGoods")
    @ResponseBody
    public String saveGoods(Goods goods) {
        if (StringUtils.isBlank(goods.getGoodsId())) {
            goods.setGoodsId(UUID.randomUUID().toString().replace("-", "1"));
        }
        if (goods.getCreateTime() == null) {
            goods.setCreateTime(new Date());
        }
        goods.setUpdateTime(new Date());
        goodsMapper.insertGoods(goods);
        return CommonConstant.STR_SUCCESS;
    }

    @ResponseBody
    @RequestMapping("getGoodsList")
    public Map getGoodsList(@RequestParam(required = false) int limit, @RequestParam(required = false) int page) {
        Map resultMap = new HashMap<>();
        Map map = new HashMap<>();
        List<Goods> goodsList = goodsMapper.getGoodsList(map);
        Map inputMap = new HashMap();
        inputMap.put("data", goodsList);
        inputMap.put("limit", limit);
        inputMap.put("page", page);
        dataOrganizeService = dataManagerService.getDataOranizeService("layui");
        resultMap = dataOrganizeService.tableDataOrganize(inputMap);
        return resultMap;
    }

    @ResponseBody
    @RequestMapping("getBigTypes")
    public List getGoodsBigType() {
        List<Map> map = goodsMapper.getBigTypeList();

        return map;
    }

    @ResponseBody
    @RequestMapping("getSmallTypes")
    public List getSmallTypes(String type) {
        Map map = new HashMap();
        map.put("type", type);
        List<Map> resultMap = goodsMapper.getTypesByBigtype(map);

        return resultMap;
    }

    @ResponseBody
    @RequestMapping("getGoodsInfo")
    public List<Goods> getGoodsInfo(@RequestParam(required = false) String goodsName) {
        Map map = new HashedMap();
        map.put("goodsName", goodsName);
        List<Goods> goodsList = goodsMapper.getGoodsList(map);
        return goodsList;
    }
}