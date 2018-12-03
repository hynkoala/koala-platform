package cn.koala.platform.service;

import cn.koala.platform.model.Account;
import cn.koala.platform.model.TradeInfo;

/**
 * Created by 12732
 * Email:hynkoala@163.com
 * Date: 2018.12.01
 * Time:1:00
 * Description:
 */
public interface AccountService {
    void saveAccount(Account account);

    TradeInfo addTradeInfoFromAccount(Account account, TradeInfo tradeInfo);
}
