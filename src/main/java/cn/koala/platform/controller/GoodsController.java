package cn.koala.platform.controller;

import cn.koala.platform.constant.CommonConstant;
import cn.koala.platform.mapper.GoodsMapper;
import cn.koala.platform.model.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.UUID;

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
        goods.setGoodsId(UUID.randomUUID().toString().replace("-", "1"));
        goodsMapper.insertGoods(goods);
        return CommonConstant.STR_SUCCESS;
    }
}