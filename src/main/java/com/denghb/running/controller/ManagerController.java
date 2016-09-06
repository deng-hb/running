package com.denghb.running.controller;


import com.denghb.running.HttpConnectionTask;
import com.denghb.running.domain.Task;
import com.denghb.running.service.TaskService;
import com.denghb.running.utils.TaskManager2;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by denghb on 16/9/2.
 */
@Controller
public class ManagerController {

    private static Logger log = LoggerFactory.getLogger(ManagerController.class);

    @Autowired
    private TaskService taskService;

    @RequestMapping(value = "/")
    public String index(Model model, HttpServletRequest request) {
        List<Task> list = taskService.list();
        model.addAttribute("list", list);
        return "index";
    }

    @RequestMapping(value = "/start")
    @ResponseBody
    public String start(HttpServletRequest request, HttpServletResponse response) {

        String id = request.getParameter("id");
        Task task = taskService.query(Integer.parseInt(id));
        if (null != task) {
            task.setIsRun(1);
            taskService.update(task);

            startTask(task);
            return "SUCCESS";
        }

        return "ERROR";
    }

    @RequestMapping(value = "/cancel")
    @ResponseBody
    public String cancel(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        TaskManager2.cancel(id);
        Task task = new Task();
        task.setIsRun(0);
        task.setId(Integer.parseInt(id));
        taskService.update(task);
        return "SUCCESS";
    }

    @PostConstruct
    public void init() {
        log.info(String.format("Task init start"));
        List<Task> list = taskService.list();

        for (Task task : list) {
            if (1 == task.getIsRun()) {
                startTask(task);
                log.info(String.format("Task start %s", task.getId()));
            }
        }

        log.info(String.format("Task init end"));

    }

    private void startTask(Task task) {
        TaskManager2.start(String.valueOf(task.getId()), new HttpConnectionTask(task), task.getSec());
    }

}
