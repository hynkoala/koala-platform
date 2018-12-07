package cn.koala.platform.mapper.parent;

import cn.koala.platform.service.core.AccountDto;

import java.util.List;
import java.util.Map;

/**
 * Created by hanyaning
 * Email:hynkoala@163.com
 * Date: 2018.12.06
 * Time:17:20
 * Description:
 */
public interface AccountMapper {
    List<AccountDto> getAccountList(Map map);
}