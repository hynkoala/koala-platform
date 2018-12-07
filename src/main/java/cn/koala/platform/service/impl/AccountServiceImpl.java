package cn.koala.platform.service.impl;

import cn.koala.platform.mapper.AccountInMapper;
import cn.koala.platform.mapper.AccountOutMapper;
import cn.koala.platform.mapper.parent.AccountMapper;
import cn.koala.platform.model.AccountIn;
import cn.koala.platform.model.AccountOut;
import cn.koala.platform.model.TradeInfo;
import cn.koala.platform.model.parent.Account;
import cn.koala.platform.service.AccountService;
import cn.koala.platform.service.core.AccountDto;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * Created by 12732
 * Email:hynkoala@163.com
 * Date: 2018.12.01
 * Time:1:00
 * Description:
 */
@Service
public class AccountServiceImpl implements AccountService {
    @Autowired
    AccountInMapper accountInMapper;
    @Autowired
    AccountOutMapper accountOutMapper;

    @Override
    public void saveAccount(AccountDto accountDto) {
        accountDto.setUpdateTime(new Date());
        if (accountDto instanceof AccountIn) {
            accountInMapper.saveAccountIn((AccountIn) accountDto);
        } else if (accountDto instanceof AccountOut) {
        }
    }

    @Override
    public AccountDto initAccountInfo(AccountDto accountDto) {
        if (StringUtils.isBlank(accountDto.getAccountId())) {
            accountDto.setAccountId(UUID.randomUUID().toString().replace("-", "1"));
        }
        if (accountDto.getCreateTime() == null) {
            accountDto.setCreateTime(new Date());
        }
        if (StringUtils.isBlank(accountDto.getOperatePerson())) {
            accountDto.setOperatePerson("hyn");
        }
        accountDto.setUpdateTime(new Date());
        return accountDto;
    }

    @Override
    public AccountDto makeSureAccountDto(Account account, String accountType) {
        AccountDto accountDto;
        if (account != null && StringUtils.isNotBlank(account.getAccountType())) {
            accountType = account.getAccountType();
        } else {
            account = new Account();
        }
        if (StringUtils.isNotBlank(accountType)) {
            if (StringUtils.equals(accountType, "1")) {
                AccountIn accountIn = new AccountIn();
                BeanUtils.copyProperties(account, accountIn);
                accountDto = accountIn;
                return accountDto;
            } else if (StringUtils.equals(accountType, "2")) {
                AccountOut accountOut = new AccountOut();
                BeanUtils.copyProperties(account, accountOut);
                return accountOut;
            }
        }
        return account;
    }

    @Override
    public TradeInfo initTradeInfoFromAccount(TradeInfo tradeInfo, AccountDto account) {
        tradeInfo.setTradeId(UUID.randomUUID().toString().replace("-", "1"));
        tradeInfo.setAccountBh(account.getAccountBh());
        tradeInfo.setAccountName(account.getAccountName());
        tradeInfo.setAccountId(account.getAccountId());
        tradeInfo.setAccountType(account.getAccountType());
        tradeInfo.setContactPerson(account.getContactPerson());
        tradeInfo.setContactWay(account.getContactWay());
        tradeInfo.setTradeTime(account.getCreateTime());
        tradeInfo.setTradeTarget(account.getTradeTarget());
        tradeInfo.setUpdateTime(account.getCreateTime());
        return tradeInfo;
    }

    @Override
    public List<AccountDto> getAccountDtos(String accountType, Map paraMap) {
        List<AccountDto> accountDtos = null;
        AccountMapper accountMapper;
        switch (accountType) {
            case "1": {
                accountMapper = accountInMapper;
                break;
            }
            case "2": {
                accountMapper = accountOutMapper;
                break;
            }
            default: {
                accountMapper = null;
            }
        }
        if (accountMapper != null) {
            accountDtos = accountMapper.getAccountList(paraMap);
        }
        return accountDtos;
    }

    @Override
    public AccountDto getAccountById(String accountId, String accountType) {
        Map map = new HashMap();
        map.put("accountId", accountId);
        AccountDto accountDto;
        List<AccountDto> accountDtos = getAccountDtos(accountType, map);
        if (CollectionUtils.isNotEmpty(accountDtos)) {
            accountDto = accountDtos.get(0);
            if (accountDto != null) {
                return accountDto;
            }
        }
        return null;
    }

}
