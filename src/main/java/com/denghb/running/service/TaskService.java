package com.denghb.running.service;

import com.denghb.running.domain.Task;

import java.util.List;

/**
 * Created by denghb on 16/9/3.
 */
public interface TaskService {
    void create(Task task);

    List<Task> list();

    void update(Task task);

    Task query(int id);
}
