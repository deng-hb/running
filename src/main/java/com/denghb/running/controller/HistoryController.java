package com.denghb.running.controller;

import com.denghb.dbhelper.paging.Paging;
import com.denghb.dbhelper.paging.PagingResult;
import com.denghb.dbhelper.utils.DbHelperUtils;
import com.denghb.running.domain.History;
import com.denghb.running.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by denghb on 2016/12/14.
 */
@Controller
@RequestMapping("/history")
public class HistoryController {

    @Autowired
    private HistoryService historyService;

    @RequestMapping(value = "/{id}")
    public String list(@PathVariable("id") int id, Model model) {

        return load(id, 1L, model);

    }

    @RequestMapping(value = "/{id}/{page}")
    public String list(@PathVariable("id") int id, @PathVariable("page") long page, Model model) {

        return load(id, page, model);
    }

    private String load(int taskId, long page, Model model) {
        Paging paging = new Paging() {
            @Override
            public String[] getSorts() {
                return new String[]{DbHelperUtils.getIdColumn(History.class)};
            }
        };
        paging.setPage(page);
        paging.getParams().add(taskId);// 参数id

        PagingResult<History> result = historyService.list(paging);

        model.addAttribute("result", result);

        return "history";

    }
}
