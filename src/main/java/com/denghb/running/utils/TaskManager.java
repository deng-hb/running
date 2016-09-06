package com.denghb.running.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;

/**
 * Created by denghb on 16/9/3.
 */
public class TaskManager {

    private static Logger log = LoggerFactory.getLogger(TaskManager.class);

    private static Map<String, Timer> timers = new ConcurrentHashMap();


    /**
     * @param taskName
     * @param task
     * @param sec
     */
    public static void start(String taskName, TimerTask task, int sec) {
        log.debug(String.format("start task:[%s] sec:[%d]", taskName, sec));

        Timer timer = timers.get(taskName);
        if (null != timer) {
            timer.cancel();
        } else {
            timer = new Timer();
        }
        timer.schedule(task, 0, sec * 1000);
        timers.put(taskName, timer);

    }

    /**
     * @param taskName
     */
    public static void cancel(String taskName) {
        log.debug(String.format("cancel task:[%s]", taskName));

        Timer timer = timers.get(taskName);
        if (null != timer) {
            timer.cancel();
            timers.remove(taskName);
        }
    }
}
