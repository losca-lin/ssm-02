package com.example.service.impl;

import com.example.mapper.NewsMapper;
import com.example.pojo.News;
import com.example.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;
import java.util.Map;

@Service("newsService")
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsMapper newsMapper;;
    @Override
    public List<News> countList() {
        return newsMapper.countList();
    }
    @Override
    public List<News> list(Map<String, Object> map) {
        return newsMapper.list(map);
    }
    @Override
    public Long getTotal(Map<String, Object> map) {
        return newsMapper.getTotal(map);
    }
    @Override
    public News getById(Integer id) {
        return newsMapper.getById(id);
    }
    @Override
    public Integer update(News news) {
        return newsMapper.update(news);
    }
    @Override
    public News getLastNews(Integer id) {
        return newsMapper.getLastNews(id);
    }
    @Override
    public News getNextNews(Integer id) {
        return newsMapper.getNextNews(id);
    }
    @Override
    public Integer add(News news) {
        return newsMapper.add(news);
    }
    @Override
    public Integer delete(Integer id) {
        return newsMapper.delete(id);
    }
    @Override
    public Integer getNewsByTypeId(Integer typeId) {
        return newsMapper.getNewsByTypeId(typeId);
    }



}
