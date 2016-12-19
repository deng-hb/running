package com.denghb.running.service.impl;

import com.denghb.dbhelper.DbHelper;
import com.denghb.dbhelper.paging.Paging;
import com.denghb.dbhelper.paging.PagingResult;
import com.denghb.running.domain.History;
import com.denghb.running.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by denghb on 16/9/3.
 */
@Service
public class HistoryServiceImpl implements HistoryService {

    @Autowired
    private DbHelper dbHelper;

    @Override
    public History query(long id) {
        return dbHelper.queryById(History.class, id);
    }

    @Override
    public void create(History history) {
        dbHelper.insert(history);
    }

    @Override
    public PagingResult<History> list(Paging paging) {

        StringBuffer sql = new StringBuffer("select * from history where task_id = ?");


        return dbHelper.list(sql, History.class, paging);
    }
}
