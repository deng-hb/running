package com.denghb.running.service.impl;

import com.denghb.dbhelper.DbHelper;
import com.denghb.dbhelper.DbHelperUtils;
import com.denghb.running.domain.Task;
import com.denghb.running.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by denghb on 16/9/3.
 */
@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    private DbHelper dbHelper;

    @Override
    public void create(Task task) {
        dbHelper.insert(task);
    }

    @Override
    public List<Task> list() {
        return dbHelper.list(DbHelperUtils.getSelectSql(Task.class), Task.class);
    }

    @Override
    public void update(Task task) {
        dbHelper.updateById(task);
    }

    @Override
    public Task query(int id) {
        return dbHelper.queryById(Task.class, id);
    }
}