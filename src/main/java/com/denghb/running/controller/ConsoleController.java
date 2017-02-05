package com.denghb.running.controller;

import com.denghb.running.domain.Task;
import com.denghb.running.service.TaskService;
import com.denghb.utils.Shell;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by denghb on 2017/2/5.
 */
@Controller
@RequestMapping("/console")
public class ConsoleController {

    private static Logger log = LoggerFactory.getLogger(ConsoleController.class);

    @Autowired
    private TaskService taskService;

    @Autowired
    private SimpMessagingTemplate template;

    private Map<String, Shell> shells = new HashMap<String, Shell>();


    @RequestMapping("/restart/{id}")
    public String restart(Model model, @PathVariable long id) {
        model.addAttribute("id",id);
        model.addAttribute("exec","restart");
        return "console";
    }

    @MessageMapping("restart")
    public void execRestart(long id) throws Exception {
        log.info("start ws restart ...");
        String key = "restart-" + id;

        // 销毁原有的执行命令
        Shell shell = shells.get(key);
        if (null != shell) {
            shell.destroy();
        }

        Task task = taskService.query(id);
        if (null != task && StringUtils.hasText(task.getRestartShell())) {

            shell = new Shell();
            BufferedReader bufferedReader = shell.exec(task.getRestartShell());
            shells.put(key, shell);// 保存
            String line;
            try {
                while ((line = bufferedReader.readLine()) != null) {
                    System.out.println(line);
                    template.convertAndSend("/topic/restart", line);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            // 没有脚本
            template.convertAndSend("/topic/restart", "not found shell...");
        }

    }

    @RequestMapping("/log/{id}")
    public String log(Model model,@PathVariable long id) {
        model.addAttribute("id",id);
        model.addAttribute("exec","log");
        return "console";
    }

    @MessageMapping("log")
    public void execLog(long id) throws Exception {
        log.info("start ws log ...");
        String key = "log-" + id;

        // 销毁原有的执行命令
        Shell shell = shells.get(key);
        if (null != shell) {
            shell.destroy();
        }

        //
        Task task = taskService.query(id);
        if (null != task && StringUtils.hasText(task.getLogShell())) {

            shell = new Shell();
            BufferedReader bufferedReader = shell.exec(task.getLogShell());
            shells.put(key, shell);// 保存
            String line;
            try {
                while ((line = bufferedReader.readLine()) != null) {
                    System.out.println(line);
                    template.convertAndSend("/topic/log", line);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            // 没有脚本
            template.convertAndSend("/topic/log", "not found shell...");
        }

    }
}
