package com.denghb.running.controller;


import com.denghb.running.HttpConnectionTask;
import com.denghb.running.domain.Task;
import com.denghb.running.service.TaskService;
import com.denghb.running.utils.TaskUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.PostConstruct;
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
    public String index(Model model) {
        List<Task> list = taskService.list();
        model.addAttribute("list", list);
        return "index";
    }

    @RequestMapping(value = "/start/{id}")
    public String start(@PathVariable int id) {

        Task task = taskService.query(id);
        if (null != task) {
            task.setIsRun(1);
            taskService.update(task);
            startTask(task);
        }

        return "redirect:/";
    }

    @RequestMapping(value = "/stop/{id}")
    public String stop(@PathVariable int id) {
        TaskUtils.stop(String.valueOf(id));

        Task task = new Task();
        task.setIsRun(0);
        task.setId(id);
        taskService.update(task);

        return "redirect:/";
    }

    /**
     * 创建
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(HttpServletRequest request) {
        return "edit";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable int id, Model model) {
        Task task = taskService.query(id);
        model.addAttribute("task", task);
        return "edit";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(Task task, Model model) {
        if(null == task){
            model.addAttribute("message", "ERROR");
            return "edit";
        }
        if(null != task.getId()){
            taskService.update(task);
            model.addAttribute("message", "UPDATE SUCCESS");
        }else{
            taskService.create(task);
            model.addAttribute("message", "CREATE SUCCESS");
        }
        return "edit";
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
        TaskUtils.start(String.valueOf(task.getId()), new HttpConnectionTask(task), task.getSec());
    }

}
