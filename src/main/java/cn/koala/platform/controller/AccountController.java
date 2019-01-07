package cn.koala.platform.controller;

import cn.koala.platform.constant.CommonConstant;
import cn.koala.platform.mapper.AccountInMapper;
import cn.koala.platform.mapper.GoodsMapper;
import cn.koala.platform.mapper.TradeInfoMapper;
import cn.koala.platform.model.Goods;
import cn.koala.platform.model.TradeInfo;
import cn.koala.platform.model.project.AccountProject;
import cn.koala.platform.service.AccountService;
import cn.koala.platform.service.GoodsService;
import cn.koala.platform.service.common.DataManagerService;
import cn.koala.platform.service.common.DataOrganizeService;
import cn.koala.platform.service.common.ViewManagerService;
import cn.koala.platform.service.core.AccountDto;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.Date;
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
    @Autowired
    ViewManagerService viewManagerService;
    @Autowired
    GoodsMapper goodsMapper;

    @RequestMapping("")
    public String toAccountIndex(Model model) {
        String path = "accountIndex";
        return path;
    }

    @ResponseBody
    @RequestMapping("saveAccount")
    public Map newAccountIn(AccountProject account,
                               @RequestBody(required = false) List<TradeInfo> tradeInfoList) {
        Map resultMap = new HashMap();
        if(StringUtils.isBlank(account.getDoReceipt())){
            account.setDoReceipt("0");
        }
        AccountDto accountDto = accountService.makeSureAccountDto(account, null);
        if (accountDto != null) {
            // 通过账单id是否存在判断是新建账单还是更新账单
            if (StringUtils.isBlank(accountDto.getAccountId())) {
                accountDto = accountService.initAccountInfo(accountDto);
                accountService.saveAccount(accountDto);
            } else {
                accountService.updateAccount(accountDto);
            }

            resultMap.put("accountId",accountDto.getAccountId());
            resultMap.put("accountType",accountDto.getAccountType());
        }
        if (CollectionUtils.isNotEmpty(tradeInfoList) && account != null) {
            for (TradeInfo tradeInfo : tradeInfoList) {
                // 如果商品名为空值，则认为传过来的是空行，不予保存
                if (StringUtils.isNotBlank(tradeInfo.getGoodsName())) {
                    tradeInfo = accountService.initTradeInfoFromAccount(tradeInfo, accountDto);
                    accountService.saveTradeInfo(tradeInfo);
                }
            }
        }
        resultMap.put("msg",CommonConstant.STR_SUCCESS);
        return resultMap;
    }

    @ResponseBody
    @RequestMapping("getAccount")
    public Map getAccount(@RequestParam(required = false) String accountType, int limit, int page, String input,
                          String startTime, String endTime) {
        String returnMsg ="";
        List<AccountDto> accountDtos = null;
        if (StringUtils.isNotBlank(accountType)) {
            Map queryMap = new HashMap();
            if (StringUtils.isNotBlank(input)) {
                input = StringUtils.deleteWhitespace(input);
                queryMap.put("input", input);
            }
            try {
                if (StringUtils.isNotBlank(startTime)) {
                    Date startDate = DateUtils.parseDate(startTime, "yy-MM-dd");
                    queryMap.put("startTime", startDate);
                }
                if (StringUtils.isNotBlank(endTime)) {
                    Date endDate = DateUtils.parseDate(endTime, "yy-MM-dd");
                    queryMap.put("endTime", endDate);
                }
            }catch (ParseException e){
                returnMsg = "时间格式有误，格式样例：2008-08-08";
            }

            accountDtos = accountService.getAccountDtos(accountType, queryMap);
        }
        Map map = new HashMap();
        map.put("data", accountDtos);
        if (limit == 0) {
            map.put("limit", 10);
        } else {
            map.put("limit", limit);
        }
        if (page != 0) {
            map.put("page", page);
        } else {
            map.put("page", 1);
        }
        Map resultMap = dataOrganizeService.tableDataOrganize(map);

        return resultMap;

    }

    @RequestMapping("accountDetails")
    public String seeAccountInfo(Model model, @RequestParam String accountType, @RequestParam(required = false) String accountId) {
        AccountDto accountDto;
        List<TradeInfo> tradeInfoList;
        Map map = new HashMap();
        //获取账单信息

        String path = "500";
        if (StringUtils.isNotBlank(accountType) && StringUtils.isNotBlank(accountId)) {
            accountDto = accountService.getAccountById(accountId, accountType);
            if (accountDto != null) {
                tradeInfoList = tradeInfoMapper.getTradeInfosByAccountId(accountDto.getAccountId());
                if (CollectionUtils.isNotEmpty(tradeInfoList)) {
                    model.addAttribute("tradeInfoSize", tradeInfoList.size());
                }
                model.addAttribute("tradeInfoList", tradeInfoList);
                model.addAttribute("account", accountDto);
                path = viewManagerService.accountPathGenerate("account/", accountType);
            }
            // 获取货物信息，以便方便选择货物
            map.clear();
            List<Goods> goodsList = goodsMapper.getGoodsList(map);
            model.addAttribute("goodsList", goodsList);
        }
        return path;
    }

    @ResponseBody
    @RequestMapping("queryAccountFlow")
    public Map queryAccounntFlow(int limit, int page, String input, String startTime, String endTime) {
        String returnMsg = "success";
        Map resultMap;
        Map queryMap = new HashMap();
        if (StringUtils.isNotBlank(input)) {
            input = StringUtils.deleteWhitespace(input);
            queryMap.put("input", input);
        }
        try {
            if (StringUtils.isNotBlank(startTime)) {
                Date startDate = DateUtils.parseDate(startTime, "yy-MM-dd");
                queryMap.put("startTime", startDate);
            }
            if (StringUtils.isNotBlank(endTime)) {
                Date endDate = DateUtils.parseDate(endTime, "yy-MM-dd");
                queryMap.put("endTime", endDate);
            }
        }catch (ParseException e) {
            returnMsg = "时间格式有误，格式样例：2008-08-08";
        }

        List<TradeInfo> flowList = tradeInfoMapper.getTradeInfo(queryMap);

        Map map = new HashMap();
        map.put("data", flowList);
        if (limit == 0) {
            map.put("limit", 10);
        } else {
            map.put("limit", limit);
        }
        if (page != 0) {
            map.put("page", page);
        } else {
            map.put("page", 1);
        }
        resultMap = dataOrganizeService.tableDataOrganize(map);
        resultMap.put("msg",returnMsg);
        return resultMap;
    }

    @ResponseBody
    @RequestMapping("delAccount")
    public String delAccount(String ids, String accountType) {
        String msg = CommonConstant.STR_ERROR;
        if (StringUtils.endsWith(ids, ",")) {
            ids = StringUtils.deleteWhitespace(ids);
            ids = StringUtils.removeEnd(ids, ",");
        }
        String[] accountIds = StringUtils.split(ids, ",");
        if (ids != null && accountIds.length > 0) {
            for (String id : accountIds) {
                accountService.delAccount(id, accountType);
            }
        }
        msg = CommonConstant.STR_SUCCESS;
        return msg;

    }

}