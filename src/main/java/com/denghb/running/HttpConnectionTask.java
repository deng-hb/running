package com.denghb.running;

import com.denghb.running.domain.History;
import com.denghb.running.domain.Task;
import com.denghb.running.service.HistoryService;
import com.denghb.running.service.TaskService;
import com.denghb.running.utils.MailUtils;
import com.denghb.running.utils.SpringUtils;
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
        int code = 0;
        String text = null;

        try {

            HttpURLConnection connection = getHttpConnection(task.getUrl());
            connection.connect();
            code = connection.getResponseCode();

            if (200 != code) {
                text = getResponseBody(connection);
            }

        } catch (Exception e) {
            log.debug(e.getMessage(), e);

            // 获取堆栈信息
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            e.printStackTrace(pw);
            text = sw.toString();

        } finally {

            // 更新最新状态
            TaskService taskService = SpringUtils.getBean(TaskService.class);
            task.setLastStatus(code);
            task.setRunTime((int) (System.currentTimeMillis() - startDate.getTime()));
            taskService.update(task);

            // 发生错误生成纪录
            if (200 != code || null != text) {
                HistoryService historyService = SpringUtils.getBean(HistoryService.class);

                History history = new History();
                history.setTaskId(task.getId());
                history.setTaskUrl(task.getUrl());

                history.setResponseCode(code);
                history.setResponseText(text);
                history.setCreatedBy(0);

                history.setStartTime(startDate);
                history.setEndTime(new Date());
                historyService.create(history);

                if (1 == task.getIsEmail()) {
                    // 发邮件
                    MailUtils.send(task.getEmailAddress(), task.getDesc(), String.format("<pre>%s</pre>", text));
                }
            }
        }


    }

    private String getResponseBody(HttpURLConnection connection) throws IOException {


        InputStream inputStream = connection.getInputStream();

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
        // 请求头
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
