package com.example.service.impl;

import com.example.mapper.NewsTypeMapper;
import com.example.pojo.NewsType;
import com.example.service.NewsTypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("newsTypeService")
public class NewsTypeServiceImpl implements NewsTypeService {

    @Resource
    private NewsTypeMapper newsTypeMapper;

    @Override
    public List<NewsType> countList() {
        return newsTypeMapper.countList();
    }

    @Override
    public List<NewsType> list(Map<String, Object> map) {
        return newsTypeMapper.list(map);
    }

    @Override
    public Long getTotal(Map<String, Object> map) {
        return newsTypeMapper.getTotal(map);
    }

    @Override
    public Integer add(NewsType newsType) {
        return newsTypeMapper.add(newsType);
    }

    @Override
    public Integer update(NewsType newsType) {
        return newsTypeMapper.update(newsType);
    }

    @Override
    public Integer delete(Integer id) {
        return newsTypeMapper.delete(id);
    }

    @Override
    public Integer getNewsByTypeId(Integer typeId) {
        return newsTypeMapper.getNewsByTypeId(typeId);
    }

    @Override
    public NewsType getById(Integer id) {
        return newsTypeMapper.getById(id);
    }
}
