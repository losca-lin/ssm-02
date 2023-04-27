package com.example.service;

import com.example.pojo.News;

import java.util.List;
import java.util.Map;

public interface NewsService {

    /**
     * 根据日期月份分组查询
     * @return
     */
     List<News> countList();

    /**
     * 分页查询
     * @return
     */
     List<News> list(Map<String, Object> map);

    /**
     * 获取总记录数
     * @param map
     * @return
     */
     Long getTotal(Map<String, Object> map);

    /**
     * 通过Id查找实体
     * @param id
     * @return
     */
     News getById(Integer id);

    /**
     * 更新信息
     * @param news
     * @return
     */
      Integer update(News news);

    /**
     * 获取上一个
     * @param id
     * @return
     */
     News getLastNews(Integer id);

    /**
     * 获取下一个
     * @param id
     * @return
     */
     News getNextNews(Integer id);

    /**
     * 添加信息
     * @param news
     * @return
     */
     Integer add(News news);

    /**
     * 删除信息
     * @param id
     * @return
     */
     Integer delete(Integer id);

    /**
     * 查询指定类别下的数量
     * @param typeId
     * @return
     */
     Integer getNewsByTypeId(Integer typeId);
}
