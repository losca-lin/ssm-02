package com.example.service.impl;

import com.example.mapper.LinkMapper;
import com.example.pojo.Link;
import com.example.service.LinkService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("linkService")
public class LinkServiceImpl implements LinkService {

    @Resource
    private LinkMapper linkMapper;

    @Override
    public int add(Link link) {
        return linkMapper.add(link);
    }

    @Override
    public int update(Link link) {
        return linkMapper.update(link);
    }

    @Override
    public List<Link> list(Map<String, Object> map) {
        return linkMapper.list(map);
    }

    @Override
    public Long getTotal(Map<String, Object> map) {
        return linkMapper.getTotal(map);
    }

    @Override
    public Integer delete(Integer id) {
        return linkMapper.delete(id);
    }
}
