package com.denghb.running.service.impl;

import com.denghb.dbhelper.DbHelper;
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
    public void create(History history) {
        dbHelper.insert(history);
    }
}
