package cn.koala.platform.service.impl;

import cn.koala.platform.constant.UserConstant;
import cn.koala.platform.mapper.UserMapper;
import cn.koala.platform.model.User;
import cn.koala.platform.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Map;
import java.util.UUID;

import static org.apache.commons.codec.digest.DigestUtils.md5Hex;

/**
 * Created by user
 * Email:hynkoala@163.com
 * Date: 2018.07.19
 * Time:16:59
 * Description:
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    /**
     * @Author:Hanyaning
     * @Email:hynkoala@163.com
     * @Date:2018.07.19
     * @Description:用户注册
     */
    @Override
    public void insertUser(User user) {
        user.setLastUpdateTime(new Date());
        user.setRegTime(new Date());
        user.setUserId(UUID.randomUUID().toString().replace("-", "1"));
        userMapper.insertUser(user);

    }

    /**
     * @Author:Hanyaning
     * @Email:hynkoala@163.com
     * @Date:2018.07.19
     * @Description:用户登录验证
     */
    @Override
    public String checkPassword(User user, String mappingMark, User localUser) {
        String checkInfo = "";
        String userPassword = user.getUserPassword();
        if (localUser.getUserPassword().equals(userPassword)) {
            checkInfo = UserConstant.PASS_CHECK;
        } else {
            checkInfo = UserConstant.PASSWORD_ERROR;
        }
        return checkInfo;
    }

    /**
     * @Author: hanyaning
     * @Email: hynkoala@163.com
     * @Date: 2018.08.04
     * @Param: [newUsername]
     * @Return: 验证结果
     * @Description: 用户注册时验证用户名是否已经存在
     */
    @Override
    public String checkUsernameIsExist(User newUser, String mappingMark) {
        String checkInfo = "";
        String newUsername = newUser.getUserName();
        User user = userMapper.queryUserByUserName(newUsername);
        // 注册时验证，判断用户名是否已经存在
        if (user != null) {
            checkInfo = UserConstant.USERNAME_EXIST;
        } else {
            checkInfo = UserConstant.NO_SUCH_USER_NAME;
        }

        return checkInfo;
    }

    /**
     * @Author: hanyaning
     * @Email: hynkoala@163.com
     * @Date: 2018.08.04
     * @Description: 登录和注册时检查用户名密码等信息不可为空
     */

    @Override
    public String checkInputData(Map inputMap, String mappingMark) {
        String checkInfo = null;
        if (StringUtils.isNotBlank(mappingMark)) {
            User user = (User) inputMap.get("user");
            User localUser = null;
            if (StringUtils.equals(mappingMark, UserConstant.MAPPING_LOGIN)) {
                if (StringUtils.isBlank(user.getUserName())) {
                    checkInfo = UserConstant.USERNAME_NOT_EXIST;
                } else {
                    localUser = userMapper.queryUserByUserName(user.getUserName());
                    if (localUser == null) {
                        checkInfo = UserConstant.NO_SUCH_USER_NAME;
                    } else if (StringUtils.isBlank(user.getUserPassword())) {
                        checkInfo = UserConstant.PASSWORD_NOT_EXIST;
                    } else if (!StringUtils.equals(localUser.getUserPassword(), md5Hex(user.getUserPassword()))) {
                        checkInfo = UserConstant.PASSWORD_ERROR;
                    } else {
                        checkInfo = UserConstant.PASS_CHECK;
                    }
                }
            } else if (StringUtils.equals(mappingMark, UserConstant.MAPPING_REGISTER)) {
                if (StringUtils.isBlank(user.getUserName())) {
                    checkInfo = UserConstant.USERNAME_NOT_EXIST;
                } else {
                    localUser = userMapper.queryUserByUserName(user.getUserName());
                    if (localUser != null) {
                        checkInfo = UserConstant.USERNAME_EXIST;
                    } else if (StringUtils.isBlank(user.getUserPassword())) {
                        checkInfo = UserConstant.PASSWORD_NOT_EXIST;
                    } else if (StringUtils.isBlank(user.getUserEmail())) {
                        checkInfo = UserConstant.EMAIL_NOT_EXIST;
                    } else if (StringUtils.isBlank(user.getPasswordHint())) {
                        checkInfo = UserConstant.PASSWORD_HINT_NOT_EXIST;
                    } else {
                        checkInfo = UserConstant.PASS_CHECK;
                    }
                }
            } else if (StringUtils.equals(mappingMark, UserConstant.MAPPING_ALTER_PASSWORD)) {
                String confirmPassword = inputMap.get("confirmPassword").toString();
                if (StringUtils.isBlank(user.getUserName())) {
                    checkInfo = "用户名跑丢了！";
                } else {
                    localUser = userMapper.queryUserByUserName(user.getUserName());
                    if (localUser != null) {
                        if (StringUtils.isBlank(user.getUserPassword())) {
                            checkInfo = UserConstant.PASSWORD_NOT_EXIST;
                        } else if (StringUtils.isBlank(confirmPassword)) {
                            checkInfo = UserConstant.CONFIRM_PASSWORD_NOT_EXIST;
                        } else if (!StringUtils.equals(user.getUserPassword(), confirmPassword)) {
                            checkInfo = UserConstant.PASSWORD_NOT_EQUAL;
                        } else {
                            checkInfo = UserConstant.PASS_CHECK;
                        }
                    }
                }
            }
        }
        return checkInfo;
    }

    @Override
    public void registerUser(User user) {
        if (user != null) {
            user.setRegTime(new Date());
            user.setLastUpdateTime(new Date());
            user.setLastLoginTime(new Date());
            user.setUserId(UUID.randomUUID().toString().replace("-", "1"));
            //对密码进行加密
            user.setUserPassword(md5Hex(user.getUserPassword()));
            userMapper.insertUser(user);
        }
    }

    @Override
    public void mulDeleteUsers(String userIds) {
        if (StringUtils.isNotBlank(userIds)) {
            String[] userIdArray = userIds.split(",");
            for (String userId : userIdArray) {
                userMapper.deleteUserByUserId(userId);
            }
        }
    }
}
