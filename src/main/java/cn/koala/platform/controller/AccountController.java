package cn.koala.platform.controller;

import cn.koala.platform.constant.CommonConstant;
import cn.koala.platform.mapper.AccountInMapper;
import cn.koala.platform.model.AccountIn;
import cn.koala.platform.model.TradeInfo;
import cn.koala.platform.service.AccountService;
import cn.koala.platform.service.GoodsService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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
    @Autowired
    AccountInMapper accountInMapper;
    @Autowired
    GoodsService goodsService;
    @Autowired
    AccountService accountService;
    @RequestMapping("")
    public String toAccountIndex(Model model) {
        String path = "accountIndex";
        return path;
    }

    @ResponseBody
    @RequestMapping("saveAccountIn")
    public String newAccountIn(AccountIn accountIn,
                               @RequestBody(required = false) List<TradeInfo> tradeInfoList) {
        if (StringUtils.isBlank(accountIn.getAccountId())) {
            accountIn.setAccountId(UUID.randomUUID().toString().replace("-", "1"));
        }
        accountService.addTradeInfoFromAccount(accountIn, tradeInfoList.get(0));
        accountIn.setCreateTime(new Date());
        accountIn.setUpdateTime(new Date());
        List list = new ArrayList();
        //list = (List) JSON.parseArray(tradeInfos);
        for (Object trade : list) {
            TradeInfo tempTradeInfo = new TradeInfo();
            tempTradeInfo.setGoodsName("");
        }
        accountInMapper.newAccountIn(accountIn);
        accountIn.setOperatePerson(null);
        accountIn.setCreateTime(new Date());
        accountIn.setUpdateTime(new Date());
        return CommonConstant.STR_SUCCESS;
    }

}