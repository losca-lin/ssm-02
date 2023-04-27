package com.example.mapper;

import com.example.pojo.News;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Dao接口
 * @author Administrator
 *
 */
@Mapper
@Repository
public interface NewsMapper {

    /**
     * 根据日期月份分组查询
     * @return
     */
     List<News> countList();

    /**
     * 分页查询科普信息
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
     * 更新科普信息信息
     * @param news
     * @return
     */
     Integer update(News news);

    /**
     * 获取上一个科普信息
     * @param id
     * @return
     */
     News getLastNews(Integer id);

    /**
     * 获取下一条科普信息
     * @param id
     * @return
     */
     News getNextNews(Integer id);

    /**
     * 添加科普信息信息
     * @param news
     * @return
     */
     Integer add(News news);

    /**
     * 删除科普信息信息
     * @param id
     * @return
     */
     Integer delete(Integer id);

    /**
     * 查询指定的科普信息类别下的科普信息数量
     * @param typeId
     * @return
     */
     Integer getNewsByTypeId(Integer typeId);


}
