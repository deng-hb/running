package com.denghb.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by denghb on 2016/12/16.
 */
public class PropUtils {

    private static Logger log = LoggerFactory.getLogger(PropUtils.class);


    /**
     * 获取属性
     *
     * @param name
     * @return
     */
    public static String getValue(String name) {


        String value = null;

        try {
            InputStream in = PropUtils.class.getClassLoader().getResourceAsStream(
                    "env.properties");
            Properties properties = new Properties();
            properties.load(in);

            value = properties.getProperty(name);

        } catch (IOException e) {
            log.error(e.getMessage(), e);
        }
        return value;
    }
}
