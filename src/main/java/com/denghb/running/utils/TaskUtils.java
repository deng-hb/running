package com.denghb.running.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Map;
import java.util.concurrent.*;

/**
 * Created by denghb on 16/9/3.
 */
public class TaskUtils {

    private static Logger log = LoggerFactory.getLogger(TaskUtils.class);

    private static Map<String, ScheduledFuture> schedules = new ConcurrentHashMap();
    private static ScheduledExecutorService scheduExec = Executors.newScheduledThreadPool(2);


    /**
     * @param taskName
     * @param task
     * @param sec
     */
    public static void start(String taskName, Runnable task, int sec) {
        log.debug(String.format("start task:[%s] sec:[%d]", taskName, sec));

        ScheduledFuture scheduledFuture = schedules.get(taskName);
        if(null != scheduledFuture){
            scheduledFuture.cancel(true);
        }
        // 0 延迟
        scheduledFuture = scheduExec.scheduleWithFixedDelay(task, 0, sec, TimeUnit.SECONDS);

        schedules.put(taskName, scheduledFuture);

    }

    /**
     * @param taskName
     */
    public static void stop(String taskName) {
        log.debug(String.format("cancel task:[%s]", taskName));

        ScheduledFuture scheduledFuture = schedules.get(taskName);
        if (null != scheduledFuture) {
            scheduledFuture.cancel(true);
            schedules.remove(taskName);
        }
    }
}
