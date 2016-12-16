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
import org.springframework.web.bind.annotation.ResponseBody;

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
    public String list(@PathVariable("id") long id, @PathVariable("page") long page, Model model) {

        return load(id, page, model);
    }

    private String load(long taskId, long page, Model model) {
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
        model.addAttribute("pageUrl", "/history/" + taskId);// 分页链接

        return "history";

    }

    @RequestMapping(value = "/err/{id}", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String err(@PathVariable long id) {
        History history = historyService.query(id);
        if (null != history) {
            String content = history.getResponse();
            if(0 > content.indexOf("<html")){
                // 不是网页
                content = String.format("<pre>%s</pre>",content);
            }
            return content;
        }
        return "error";
    }
}
