package cn.koala.platform.mapper;

import cn.koala.platform.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by user
 * Email:hynkoala@163.com
 * Date: 2018.07.19
 * Time:17:02
 * Description:
 */
@Repository
public interface UserMapper {
    /**
     * @Author: hanyaning
     * @Email: hynkoala@163.com
     * @Date: 2018.09.17
     * @Param: [user]
     * @Return: void
     * @Description: 插入用户操作
     */
    void insertUser(User user);

    /**
     *@Author: hanyaning
     *@Email: hynkoala@163.com
     *@Date: 2018.09.17
     *@Param: [userName]
     *@Return: cn.koala.platform.model.User
     *@Description: 通过用户名查询用户操作
     */
    User queryUserByUserName(String userName);

    List<User> queryAllUser();

    List<User> queryUsers(Map map);

    /**
     *@Author: hanyaning
     *@Email: hynkoala@163.com
     *@Date: 2018.09.17
     *@Param: [user]
     *@Return: void
     *@Description: 通过user对象更新用户错作
     */
    void updateUser(User user);

    /**
     * @Author: hanyaning
     * @Email: hynkoala@163.com
     * @Date: 2018.09.29
     * @Param: user
     * @Return: void
     * @Description: 改变用户密码
     */
    void alterPassword(User user);

    void deleteUserByUserId(String userId);

    void updateLoginTime(User user);
}
