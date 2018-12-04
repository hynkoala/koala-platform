package cn.koala.platform.service;

import cn.koala.platform.model.TradeInfo;
import cn.koala.platform.model.parent.Account;
import cn.koala.platform.service.core.AccountDto;

/**
 * Created by 12732
 * Email:hynkoala@163.com
 * Date: 2018.12.01
 * Time:1:00
 * Description:
 */
public interface AccountService {
    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: [account]
     * @Return: void
     * @Description: 传入account并保存，可自适应账单类型进行对应数据库表的保存
     */
    void saveAccount(AccountDto accountDto);

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: [account]
     * @Return: cn.koala.platform.service.core.AccountDto
     * @Description: 传入某种类型的account，返回对应类型的Dto（通过AccountType判断，为空则返回account父类对象）
     */
    AccountDto makeSureAccountDto(Account account);

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: [accountDto] 账单DTO
     * @Return: cn.koala.platform.service.core.AccountDto 返回账单Dto
     * @Description: 初始化account的基本信息
     */
    AccountDto initAccountInfo(AccountDto accountDto);

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: [tradeInfo, accountDto]
     * @Return: cn.koala.platform.model.TradeInfo
     * @Description: 将账单数据初始化到TradeInfo信息中
     */
    TradeInfo initTradeInfoFromAccount(TradeInfo tradeInfo, AccountDto accountDto);

}
