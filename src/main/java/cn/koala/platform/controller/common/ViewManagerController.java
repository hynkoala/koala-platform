package cn.koala.platform.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by hanyaning
 * Email:hynkoala@163.com
 * Date: 2018.11.30
 * Time:13:35
 * Description:
 */
@Controller
@RequestMapping("view")
public class ViewManagerController {
    @RequestMapping("toTargetUrl")
    public String toTarget(String target) {

        return target;
    }
}