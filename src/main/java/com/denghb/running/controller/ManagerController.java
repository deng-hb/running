package com.denghb.running.controller;


import com.denghb.dbhelper.paging.PagingResult;
import com.denghb.running.HttpConnectionTask;
import com.denghb.running.criteria.TaskCriteria;
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
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
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
    public String index(Model model, @RequestParam(required = false, defaultValue = "0") int sortIndex,
                        @RequestParam(required = false, defaultValue = "true") Boolean desc) {

        return load(model, 1, sortIndex, desc);
    }

    @RequestMapping(value = "/{page}")
    public String index(Model model, @PathVariable("page") long page,
                        @RequestParam(required = false, defaultValue = "0") int sortIndex,
                        @RequestParam(required = false, defaultValue = "true") Boolean desc) {

        return load(model, page, sortIndex, desc);
    }

    private String load(Model model, long page, int sortIndex, boolean desc) {
        TaskCriteria criteria = new TaskCriteria();
        criteria.setSortIndex(sortIndex);
        criteria.setPage(page);
        criteria.setDesc(desc);

        PagingResult<Task> result = taskService.list(criteria);
        model.addAttribute("result", result);

        // 分页参数 中文自己decode
        if (0 != sortIndex) {
            model.addAttribute("urlParas", "?sortIndex=" + sortIndex + "&desc=" + String.valueOf(desc));
        }

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
    public String stop(@PathVariable long id) {
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
    public String edit(@PathVariable long id, Model model) {
        Task task = taskService.query(id);
        model.addAttribute("task", task);
        return "edit";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(Task task, Model model) {
        if (null == task) {
            model.addAttribute("message", "ERROR");
            return "edit";
        }
        try {
            if (null != task.getId()) {
                taskService.update(task);
                model.addAttribute("message", "UPDATE SUCCESS");
            } else {
                taskService.create(task);
                model.addAttribute("message", "CREATE SUCCESS");
            }
            // 运行
            if (1 == task.getIsRun()) {
                startTask(task);
            } else {
                TaskUtils.stop(String.valueOf(task.getId()));
            }
        } catch (Exception e) {
            log.error("ERROR", e);
        }
        return "redirect:/edit/" + task.getId();
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
