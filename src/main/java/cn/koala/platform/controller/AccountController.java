package cn.koala.platform.controller;

import cn.koala.platform.constant.CommonConstant;
import cn.koala.platform.mapper.AccountInMapper;
import cn.koala.platform.mapper.TradeInfoMapper;
import cn.koala.platform.model.TradeInfo;
import cn.koala.platform.model.project.AccountProject;
import cn.koala.platform.service.AccountService;
import cn.koala.platform.service.GoodsService;
import cn.koala.platform.service.common.DataManagerService;
import cn.koala.platform.service.common.DataOrganizeService;
import cn.koala.platform.service.core.AccountDto;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @Autowired
    TradeInfoMapper tradeInfoMapper;
    @Autowired
    DataManagerService dataManagerService;
    @Autowired
    DataOrganizeService dataOrganizeService;
    @RequestMapping("")
    public String toAccountIndex(Model model) {
        String path = "accountIndex";
        return path;
    }

    @ResponseBody
    @RequestMapping("saveAccount")
    public String newAccountIn(AccountProject account,
                               @RequestBody(required = false) List<TradeInfo> tradeInfoList) {
        AccountDto accountDto = accountService.makeSureAccountDto(account, null);
        if (accountDto != null) {
            accountDto = accountService.initAccountInfo(accountDto);
            accountService.saveAccount(accountDto);
        }
        if (CollectionUtils.isNotEmpty(tradeInfoList) && account != null) {
            for (TradeInfo tradeInfo : tradeInfoList) {
                if (StringUtils.isNotBlank(tradeInfo.getGoodsName())) {
                    tradeInfo = accountService.initTradeInfoFromAccount(tradeInfo, accountDto);
                    tradeInfoMapper.saveTradeInfo(tradeInfo);
                }
            }
        }
        return CommonConstant.STR_SUCCESS;
    }

    @ResponseBody
    @RequestMapping("getAccount")
    public Map getAccount(@RequestParam(required = false) String accountType) {
        List<AccountDto> accountDtos = null;
        //accountService.makeSureAccountDto(null,accountType);
        if (StringUtils.isNotBlank(accountType)) {
            accountDtos = accountService.getAccountDtos(accountType, null);
        }
        Map map = new HashMap();
        map.put("data", accountDtos);
        map.put("limit", 10);
        Map resultMap = dataOrganizeService.tableDataOrganize(map);

        return resultMap;

    }

    @RequestMapping("accountDetails")
    public String seeAccountInfo(@RequestParam String accountType, @RequestParam(required = false) String accountId) {
        if (StringUtils.isNotBlank(accountType)) {
            AccountDto accountDto;
            accountDto = accountService.getAccountById(accountId, accountType);

        }

        return null;
    }

}