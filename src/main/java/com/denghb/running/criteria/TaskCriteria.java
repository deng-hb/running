package com.denghb.running.criteria;

import com.denghb.dbhelper.paging.Paging;
import com.denghb.dbhelper.utils.DbHelperUtils;
import com.denghb.running.domain.Task;

/**
 * Created by denghb on 2016/12/19.
 */
public class TaskCriteria extends Paging {


    @Override
    public String[] getSorts() {

        return new String[]{"id", "sec", "run_time", "last_status", "is_run"};
    }
}
