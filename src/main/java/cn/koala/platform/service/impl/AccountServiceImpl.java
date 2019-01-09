package cn.koala.platform.service.impl;

import cn.koala.platform.constant.AccountConstant;
import cn.koala.platform.mapper.*;
import cn.koala.platform.mapper.parent.AccountMapper;
import cn.koala.platform.model.*;
import cn.koala.platform.model.parent.Account;
import cn.koala.platform.service.AccountService;
import cn.koala.platform.service.GoodsService;
import cn.koala.platform.service.dto.AccountDto;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
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
    private final Logger logger = Logger.getLogger(this.getClass());
    @Autowired
    AccountInMapper accountInMapper;
    @Autowired
    AccountOutMapper accountOutMapper;
    @Autowired
    TradeInfoMapper tradeInfoMapper;
    @Autowired
    GoodsService goodsService;
    @Autowired
    GoodsMapper goodsMapper;
    @Autowired
    TrainUnitMapper trainUnitMapper;

    @Override
    public void saveAccount(AccountDto accountDto) {
        accountDto.setUpdateTime(new Date());
        if (StringUtils.isNotBlank(accountDto.getAccountType())) {
            AccountMapper accountMapper = getAccountMapper(accountDto.getAccountType());
            accountMapper.saveAccount(accountDto);
            logger.info("*****账单保存完成，编号为：" + accountDto.getAccountBh());
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
        AccountMapper accountMapper = getAccountMapper(accountType);
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

    @Override
    public AccountMapper getAccountMapper(String accountType) {
        AccountMapper accountMapper;
        if (StringUtils.equals(accountType, AccountConstant.ACCOUNT_TYPE_IN)) {
            return accountInMapper;
        } else if (StringUtils.equals(accountType, AccountConstant.ACCOUNT_TYPE_OUT)) {
            return accountOutMapper;
        }
        return null;
    }

    @Override
    public void updateAccount(AccountDto accountDto) {
        accountDto.setUpdateTime(new Date());
        if (StringUtils.isNotBlank(accountDto.getAccountType())) {
            AccountMapper accountMapper = getAccountMapper(accountDto.getAccountType());
            accountMapper.updateAccountWithNull(accountDto);
            logger.info("*****账单" + accountDto.getAccountBh() + "更新成功");
        }
    }

    @Override
    public void saveTradeInfo(TradeInfo tradeInfo) {
        // 先更新货物仓库，goodsId为空表示仓库还没有的货物，插入仓库，如果是已有货物，更新部分信息
        if (StringUtils.isBlank(tradeInfo.getGoodsId())) {
            Goods goods = goodsService.initGoodsFromTradeInfo(tradeInfo);
            tradeInfo.setGoodsId(goods.getGoodsId());
        }
        if (StringUtils.isBlank(tradeInfo.getTradeId())) {
            tradeInfo.setTradeId(UUID.randomUUID().toString().replace("-", "1"));
            tradeInfo.setCreateTime(new Date());
            tradeInfo.setUpdateTime(new Date());
            tradeInfoMapper.saveTradeInfo(tradeInfo);
        } else {
            tradeInfo.setUpdateTime(new Date());
            tradeInfoMapper.updateTradeInfo(tradeInfo);
        }

    }

    @Override
    public void delAccount(String id, String type) {
        if (StringUtils.isNotBlank(type)) {
            AccountMapper accountMapper = getAccountMapper(type);
            if (accountMapper != null && StringUtils.isNotBlank(id)) {
                accountMapper.delAccount(id);
            }
        }
    }

    @Override
    public TrainUnit saveOrUpdateTradeUnit(AccountDto accountDto) {
        //通过单位id是否有值来判断是保存还是更新(单位名有值时才进行保存)
        TrainUnit trainUnit = null;
        if (StringUtils.isNotBlank(accountDto.getTradeTarget())) {
            // 从账单上获取页面内容
            trainUnit = new TrainUnit();
            trainUnit.setUnitId(accountDto.getUnitId());
            trainUnit.setUnitName(accountDto.getTradeTarget());
            trainUnit.setContactPerson(accountDto.getContactPerson());
            trainUnit.setContactWay(accountDto.getContactWay());
            trainUnit.setUpdateTime(new Date());
            trainUnit.setUnitType(accountDto.getAccountType());
            if (StringUtils.isNotBlank(accountDto.getUnitId())) {
                Map paramMap = new HashMap();
                paramMap.put("unitId",accountDto.getUnitId());
                TrainUnit oldUnit = null;
                if(CollectionUtils.isNotEmpty(trainUnitMapper.getTradeUnits(paramMap))){
                    oldUnit = trainUnitMapper.getTradeUnits(paramMap).get(0);
                }
                if(oldUnit!=null){
                    trainUnit.setUseFrequency(oldUnit.getUseFrequency()+1);
                    if(oldUnit.getCreateTime()==null){
                        trainUnit.setCreateTime(new Date());
                    }
                }
                trainUnitMapper.updateTradeUnit(trainUnit);
            }else {
                trainUnit.setUnitId(UUID.randomUUID().toString().replace("-","1"));
                trainUnit.setCreateTime(new Date());
                trainUnit.setUseFrequency(1);
                trainUnitMapper.saveTradeUnit(trainUnit);
            }
        }
        return trainUnit;
    }

}
