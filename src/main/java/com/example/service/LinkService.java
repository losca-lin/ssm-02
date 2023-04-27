package com.example.service;

import com.example.pojo.Link;

import java.util.List;
import java.util.Map;

public interface LinkService {
    public int add(Link link);
    public int update(Link link);
    public List<Link> list(Map<String,Object> map);
    public Integer delete(Integer id);
    //获取总记录数
    public Long getTotal(Map<String,Object> map);

}
