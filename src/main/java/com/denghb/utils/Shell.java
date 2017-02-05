package com.denghb.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * Created by denghb on 2017/2/5.
 */
public class Shell {
    private static Logger log = LoggerFactory.getLogger(TaskUtils.class);

    private Process process;


    public BufferedReader exec(String shell) {
        BufferedReader bufferedReader = null;
        try {
            process = Runtime.getRuntime().exec(shell);
            //读取标准输出流
            bufferedReader = new BufferedReader(new InputStreamReader(process.getInputStream()));

            if (null == bufferedReader) {
                //读取标准错误流
                bufferedReader = new BufferedReader(new InputStreamReader(process.getErrorStream(), "gb2312"));
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }

        return bufferedReader;
    }

    public void destroy() {
        process.destroy();
    }


    public static void main(String[] args) throws IOException {
        String sh = "tail -100f /Users/denghb/Documents/tomcat/apache-tomcat-8.0.28/logs/catalina.out";

        Shell shell = new Shell();
        BufferedReader bufferedReader = shell.exec(sh);

        String line;
        while ((line = bufferedReader.readLine()) != null) {
            System.out.println(line);
        }
    }

}
