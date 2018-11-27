package cn.koala.platform.service;

import cn.koala.platform.model.User;

import java.util.Map;

/**
 * Created by user
 * Email:hynkoala@163.com
 * Date: 2018.07.19
 * Time:16:55
 * Description:
 */
public interface UserService {
    /**
     * @Author: hanyaning
     * @Email: hynkoala@163.com
     * @Date: 2018.09.17
     * @Param: [user]
     * @Return: void
     * @Description: 通过user对象插入user操作，对应userMapper接口相应操作
     */
    void insertUser(User user);

    /**
     * @Author: hanyaning
     * @Email: hynkoala@163.com
     * @Date: 2018.09.17
     * @param: [user, mappingMark, user1]
     * @return: java.lang.String
     * @Description:
     */
    String checkPassword(User user, String mappingMark, User user1);

    /**
     * @Author: hanyaning
     * @Email: hynkoala@163.com
     * @Date: 2018.09.17
     * @Param: [user, mappingMark]
     * @Return: java.lang.String
     * @Description:
     */
    String checkUsernameIsExist(User user, String mappingMark);

    String checkInputData(Map inputMap, String mappingMark);

    void registerUser(User user);

    void mulDeleteUsers(String userIds);
}
