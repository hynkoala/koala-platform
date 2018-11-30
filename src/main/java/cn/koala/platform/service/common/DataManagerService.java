package cn.koala.platform.service.common;

/**
 * Created by hanyaning
 * Email:hynkoala@163.com
 * Date: 2018.11.30
 * Time:9:08
 * Description:
 */
public interface DataManagerService {
    /**
     * @Author: <a href="@mailto:hynkoala@163.com">hanyaning</a>
     * @Date: 2018.11.30
     * @Param: [type] 前端框架类型
     * @Return: cn.koala.platform.service.common.DataOrganizeService
     * @Description: 取组织数据的service
     */
    DataOrganizeService getDataOranizeService(String type);
}