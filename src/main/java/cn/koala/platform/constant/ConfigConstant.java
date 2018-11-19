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
@ContextConfiguration("classpath:else/home-config.properties")
public class ConfigConstant {
    @Value("${photo.path}")
    public String PHOTO_PATH_CONF;
    @Value("${photo.raw.path}")
    public String PHOTO_RAW_PATH_CONF;

    public static String PHOTO_PATH;
    public static String PHOTO_RAW_PATH;

    @PostConstruct
    public void init() {
        PHOTO_PATH = PHOTO_PATH_CONF;
        PHOTO_RAW_PATH = PHOTO_RAW_PATH_CONF;
    }

}