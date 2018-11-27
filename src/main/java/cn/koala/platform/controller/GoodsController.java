package cn.koala.platform.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
    @RequestMapping("toAddGoods")
    public String toAddGoods() {
        String path = "goods/addGoods";
        return path;
    }
}