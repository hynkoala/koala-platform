package cn.koala.platform.service.impl;

import cn.koala.platform.model.Account;
import cn.koala.platform.model.TradeInfo;
import cn.koala.platform.service.AccountService;
import org.springframework.stereotype.Service;

/**
 * Created by 12732
 * Email:hynkoala@163.com
 * Date: 2018.12.01
 * Time:1:00
 * Description:
 */
@Service
public class AccountServiceImpl implements AccountService {
    @Override
    public TradeInfo addTradeInfoFromAccount(Account account, TradeInfo tradeInfo) {

        return tradeInfo;
    }

    @Override
    public void saveAccount(Account account) {

    }
}
