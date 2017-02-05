package com.denghb.running;

import com.denghb.running.domain.History;
import com.denghb.running.domain.Task;
import com.denghb.running.service.HistoryService;
import com.denghb.running.service.TaskService;
import com.denghb.utils.MailUtils;
import com.denghb.utils.SpringUtils;
import org.apache.taglibs.standard.tag.common.core.Util;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.net.ssl.*;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.cert.X509Certificate;
import java.util.Date;
import java.util.TimerTask;

/**
 * Created by denghb on 16/9/3.
 */
public class HttpConnectionTask extends TimerTask {

    private static Logger log = LoggerFactory.getLogger(HttpConnectionTask.class);

    private Task task;

    public HttpConnectionTask(Task task) {
        this.task = task;
    }

    @Override
    public void run() {
        log.info(String.format("run task:%d", task.getId()));

        Date startDate = new Date();
        int code = 500;
        String text = null;

        try {

            HttpURLConnection connection = getHttpConnection(task.getUrl());
            connection.connect();
            code = connection.getResponseCode();

            if (200 > code || 299 < code) {
                text = getResponseError(connection);
            }

        } catch (Exception e) {
            log.debug(e.getMessage(), e);

            // 获取堆栈信息
            if (null == text) {
                StringWriter sw = new StringWriter();
                PrintWriter pw = new PrintWriter(sw);
                e.printStackTrace(pw);
                text = sw.toString();
            }

        } finally {


            // 发生错误生成纪录
            if (200 != code || null != text) {
                HistoryService historyService = SpringUtils.getBean(HistoryService.class);

                History history = new History();
                history.setTaskId(task.getId());
                history.setTaskUrl(task.getUrl());

                // 获取第一行
                String line1 = null;
                int i = text.indexOf("\n");
                if (0 < i) {
                    line1 = text.substring(0, i);
                } else {
                    line1 = text;
                }

                // 编码
                line1 = Util.escapeXml(line1);
                int len = line1.length();
                history.setResponseBrief(line1.substring(0, 100 > len ? len : 100));

                history.setCode(code);
                history.setResponse(text);
                history.setCreatedBy(0);

                history.setStartTime(startDate);
                history.setEndTime(new Date());
                historyService.create(history);

                if (0 < task.getEmailSize()) {
                    String content = text;
                    if(0 > text.indexOf("<html")){
                        // 不是网页
                        content = String.format("<pre>%s</pre>");
                    }

                    String email = task.getEmailAddress();
                    if (null != email){

                        // 多个地址
                        if(0 < email.indexOf(",")){
                            String[] emails = email.split(",");
                            for(int j = 0;j< emails.length;j++){
                                if(null != emails[j]){
                                    // 发邮件纪录？
                                    MailUtils.send(emails[j], String.format("[Running](%s)>%s", code, task.getDesc()), content);
                                }
                            }
                        }else {
                            // 发邮件纪录？
                            MailUtils.send(task.getEmailAddress(), String.format("[Running](%s)>%s", code, task.getDesc()), content);
                        }
                        task.setEmailSize(task.getEmailSize() - 1);
                    }
                }
            }

            // 更新最新状态
            TaskService taskService = SpringUtils.getBean(TaskService.class);
            task.setLastStatus(code);
            task.setRunTime((int) (System.currentTimeMillis() - startDate.getTime()));
            taskService.update(task);
        }


    }

    private String getResponseError(HttpURLConnection connection) throws IOException {

        // 200
        // InputStream inputStream = connection.getInputStream();

        InputStream inputStream = connection.getErrorStream();


        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
        StringBuilder builder = new StringBuilder();

        String line = null;
        while ((line = reader.readLine()) != null) {
            builder.append(line).append("\n");
        }

        connection.disconnect();
        inputStream.close();

        return builder.toString();
    }

    private HttpURLConnection getHttpConnection(String urlString) throws IOException {
        URL url = new URL(urlString);

        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setConnectTimeout(3000);// 3秒
        connection.setReadTimeout(60000);// 1分钟

        connection.setDoOutput(true);
        connection.setDoInput(true);
        connection.setUseCaches(false);
        // TODO 将来可以设定不同浏览器user-agent来模拟请求
        connection.setRequestProperty("Connection", "Keep-Alive");
        connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36");
        connection.setRequestProperty("Charset", "UTF-8");

        if (connection instanceof HttpsURLConnection) {
            ((HttpsURLConnection) connection).setSSLSocketFactory(getTrustAllSSLSocketFactory());
        }
        return connection;
    }


    private SSLSocketFactory getTrustAllSSLSocketFactory() {
        // 信任所有证书
        TrustManager[] trustAllCerts = new TrustManager[]{
                new X509TrustManager() {
                    @Override
                    public X509Certificate[] getAcceptedIssuers() {
                        return null;
                    }

                    @Override
                    public void checkClientTrusted(X509Certificate[] certs, String authType) {
                    }

                    @Override
                    public void checkServerTrusted(X509Certificate[] certs, String authType) {
                    }
                }};
        try {
            SSLContext sslContext = SSLContext.getInstance("TLS");
            sslContext.init(null, trustAllCerts, null);
            return sslContext.getSocketFactory();
        } catch (Throwable ex) {

        }
        return null;
    }
}
