package com.denghb.running.service;

import com.denghb.dbhelper.paging.Paging;
import com.denghb.dbhelper.paging.PagingResult;
import com.denghb.running.domain.History;

/**
 * Created by denghb on 16/9/3.
 */
public interface HistoryService {

    History query(long id);

    void create(History history);

    PagingResult<History> list(Paging paging);
}
