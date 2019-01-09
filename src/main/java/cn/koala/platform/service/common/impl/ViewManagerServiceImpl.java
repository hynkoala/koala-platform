package cn.koala.platform.service.common.impl;

import cn.koala.platform.service.common.ViewManagerService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

/**
 * Created by hanyaning
 * Email:hynkoala@163.com
 * Date: 2018.12.14
 * Time:10:30
 * Description: 组织返回view的路径
 */
@Service
public class ViewManagerServiceImpl implements ViewManagerService {

    @Override
    public String accountPathGenerate(String prefix, String accountType) {
        String suffix = "";
        String path;
        if (StringUtils.equals(accountType, "1")) {
            suffix = "accountIn";
        } else if (StringUtils.equals(accountType, "2")) {
            suffix = "accountOut";
        } else {
            suffix = "";
        }
        if (StringUtils.isNotBlank(prefix)) {
            if (StringUtils.lastIndexOf(prefix, "/") + 1 != prefix.length()
                    && StringUtils.isNotBlank(suffix)) {
                prefix = prefix + "/";
            }
        } else {
            prefix = "accountIndex";
        }
        path = prefix + suffix;

        return path;
    }
}