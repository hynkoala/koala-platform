package cn.koala.platform.service;

import cn.koala.platform.mapper.parent.AccountMapper;
import cn.koala.platform.model.TradeInfo;
import cn.koala.platform.model.TrainUnit;
import cn.koala.platform.model.parent.Account;
import cn.koala.platform.service.dto.AccountDto;

import java.util.List;
import java.util.Map;

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
     * @Return: cn.koala.platform.service.dto.AccountDto
     * @Description: 传入某种类型的account，返回对应类型的Dto（通过AccountType判断，为空则返回account父类对象）
     */
    AccountDto makeSureAccountDto(Account account, String accountType);

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.04
     * @Param: [accountDto] 账单DTO
     * @Return: cn.koala.platform.service.dto.AccountDto 返回账单Dto
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

    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.12.05
     * @Param: [accountType]
     * @Return: java.util.List<cn.koala.platform.model.parent.Account>
     * @Description: 传入accountType，返回相应类型的AccountDto list，按时间倒序排序
     */
    List<AccountDto> getAccountDtos(String accountType, Map map);
    
    /**
     *@Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     *@Date: 2019.01.07
     *@Param: [id, accountType]
     *@Return: cn.koala.platform.service.dto.AccountDto
     *@Description: 通过id获取账单信息
     */
    AccountDto getAccountById(String id, String accountType);

    /**
     *@Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     *@Date: 2019.01.07
     *@Param: [accountType]
     *@Return: cn.koala.platform.mapper.parent.AccountMapper
     *@Description: 获取各类型账单数据库操作的对应的mapper
     */
    AccountMapper getAccountMapper(String accountType);

    /**
     *@Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     *@Date: 2019.01.07
     *@Param: [accountDto]
     *@Return: void
     *@Description: 更新账单信息
     */
    void updateAccount(AccountDto accountDto);

    /**
     *@Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     *@Date: 2019.01.07
     *@Param: [tradeInfo]
     *@Return: void
     *@Description: 保存交易详细信息（账单货物流水账）
     */
    void saveTradeInfo(TradeInfo tradeInfo);

    /**
     *@Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     *@Date: 2019.01.07
     *@Param: [accountId, accountType]
     *@Return: void
     *@Description: 通过账单id删除账单
     */
    void delAccount(String accountId,String accountType);

    /**
     *@Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     *@Date: 2019.01.07
     *@Param: [accountDto]
     *@Return: void
     *@Description: 保存或更新交易单位的信息，本质上修改单位训练表Train_unit
     */
    TrainUnit saveOrUpdateTradeUnit(AccountDto accountDto);

}
