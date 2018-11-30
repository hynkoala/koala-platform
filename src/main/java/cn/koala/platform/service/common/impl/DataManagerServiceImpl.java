package cn.koala.platform.service.common.impl;

import cn.koala.platform.service.common.DataManagerService;
import cn.koala.platform.service.common.DataOrganizeService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by hanyaning
 * Email:hynkoala@163.com
 * Date: 2018.11.30
 * Time:9:06
 * Description:
 */
@Service
public class DataManagerServiceImpl implements DataManagerService {
    @Resource(name = "layuiDataServiceImpl")
    LayuiDataServiceImpl layuiDataServiceImpl;

    @Override
    public DataOrganizeService getDataOranizeService(String type) {
        DataOrganizeService dataOrganizeService = null;
        if (StringUtils.equals(type, "layui")) {
            dataOrganizeService = layuiDataServiceImpl;
        }
        return dataOrganizeService;
    }
}