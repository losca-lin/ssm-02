package com.example.mapper;

import com.example.pojo.NewsType;

import java.util.List;
import java.util.Map;

public interface NewsTypeMapper {

    public List<NewsType> countList();

    public List<NewsType> list(Map<String,Object> map);

    public Long getTotal(Map<String,Object> map);

    public Integer add(NewsType newsType);

    public Integer update(NewsType newsType);

    public Integer delete(Integer id);

    public Integer getNewsByTypeId(Integer typeId);

    public NewsType getById(Integer id);
}
