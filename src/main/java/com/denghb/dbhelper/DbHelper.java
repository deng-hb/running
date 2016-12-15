package com.denghb.dbhelper;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.denghb.dbhelper.annotation.Column;
import com.denghb.dbhelper.utils.DbHelperUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.denghb.dbhelper.annotation.Id;

/**
 * <pre>
 * 常用的一些数据库操作
 * </pre>
 * <p>
 * {@link https://github.com/deng-hb/dbhelper}
 *
 * @author denghb
 */
public interface DbHelper {

    /**
     * 创建一条纪录
     *
     * @param object
     * @return
     */
    public boolean insert(Object object);
    /**
     * 更新一条纪录
     *
     * @param object
     * @return
     */
    public boolean updateById(Object object);
    /**
     * 执行一条SQL
     *
     * @param sql
     * @param args
     * @return
     */
    public int execute(String sql, Object... args);

    /**
     * 查询列表
     * <p>
     * <p>
     * <pre>
     *
     * Example
     *
     * Bean:
     * public class User implements Serializable {
     *
     * 	private String name;
     *
     * 	public String getName() {
     * 		return name;
     *    }
     *
     * 	public void setName(String name) {
     * 		this.name = name;
     *    }
     * }
     *
     * SQL:
     * select c_name_v as name from user;
     *
     * 只要是列名和对象字段名一致就能反射赋值
     *
     * @see {@link org.springframework.jdbc.core.BeanPropertyRowMapper}
     * </pre>
     *
     * @param sql
     * @param clazz
     * @param args
     * @return
     */
    public <T> List<T> list(String sql, Class<T> clazz, Object... args);

    /**
     * 指定参数查询返回对象
     *
     * @param sql
     * @param clazz
     * @param args
     * @return
     */
    public <T> T queryForObject(String sql, Class<T> clazz, Object... args);
    /**
     * 查询一条纪录
     *
     * @param clazz
     * @param id
     * @return
     */
    public <T> T queryById(Class<T> clazz, Object id);
    /**
     * 删除
     *
     * @param clazz
     * @param id
     * @return
     */
    public <T> boolean deleteById(Class<T> clazz, Object id);

}
