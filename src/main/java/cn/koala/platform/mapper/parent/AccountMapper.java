package cn.koala.platform.mapper.parent;

import cn.koala.platform.service.dto.AccountDto;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by hanyaning
 * Email:hynkoala@163.com
 * Date: 2018.12.06
 * Time:17:20
 * Description:
 */
@Repository
public interface AccountMapper {
    void saveAccount(AccountDto accountDto);

    void updateAccount(AccountDto accountDto);
    void updateAccountWithNull(AccountDto accountDto);
    List<AccountDto> getAccountList(Map map);
    void delAccount(String id);
}