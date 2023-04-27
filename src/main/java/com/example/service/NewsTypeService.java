package com.example.service;

import com.example.pojo.NewsType;

import java.util.List;
import java.util.Map;


public interface NewsTypeService {

    /**
     * 查询所有科普信息类型 以及对应的数量
     * @return
     */
    public List<NewsType> countList();

    /**
     * 分页查询类别信息
     * @param map
     * @return
     */
    public List<NewsType> list(Map<String,Object> map);

    /**
     * 获取总记录数
     * @param map
     * @return
     */
    public Long getTotal(Map<String,Object> map);

    /**
     * 添加类别信息
     * @param newsType
     * @return
     */
    public Integer add(NewsType newsType);

    /**
     * 修改类别信息
     * @param newsType
     * @return
     */
    public Integer update(NewsType newsType);

    /**
     * 删除类别信息
     * @param id
     * @return
     */
    public Integer delete(Integer id);
    /**
     * 查询指定的类别下的科普信息数量
     * @param typeId
     * @return
     */
    public Integer getNewsByTypeId(Integer typeId);

    public NewsType getById(Integer id);
}
