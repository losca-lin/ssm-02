package com.example.mapper;

import com.example.pojo.Link;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface LinkMapper {
        public int add(Link link);
        public int update(Link link);
        public List<Link> list(Map<String,Object> map);
        public Long getTotal(Map<String,Object> map);
        public Integer delete(Integer id);

         // 获取总记录数


    }

