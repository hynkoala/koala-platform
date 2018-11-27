package cn.koala.platform.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by hanyaning
 * Email:hynkoala@163.com
 * Date: 2018.11.27
 * Time:20:08
 * Description:
 */
@Controller
@RequestMapping("account")
public class AccountController {
    @RequestMapping("")
    public String toAccountIndex(Model model) {
        String path = "accountIndex";
        return path;
    }
}