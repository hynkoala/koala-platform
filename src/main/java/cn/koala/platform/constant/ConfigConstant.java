package cn.koala.platform.constant;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.PostConstruct;

/**
 * Created by hanyaning
 * Email:hynkoala@163.com
 * Date: 2018.11.12
 * Time:12:35
 * Description:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@Component
@ContextConfiguration("classpath:else/platform-config.properties")
public class ConfigConstant {
    @Value("${platform.url}")
    public String PLATFORM_URL_CONF;

    public static String PLATFORM_URL;

    @PostConstruct
    public void init() {
        PLATFORM_URL = PLATFORM_URL_CONF;
    }

}