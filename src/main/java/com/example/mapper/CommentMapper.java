package com.example.mapper;

import java.util.List;
import java.util.Map;

import com.example.pojo.Comment;

/**
 * 评论Dao接口
 * @author Administrator
 *
 */
public interface CommentMapper {

    /**
     * 添加评论
     * @param comment
     * @return
     */
    public int add(Comment comment);

    /**
     * 修改评论
     * @param comment
     * @return
     */
    public int update(Comment comment);

    /**
     * 查找用户评论信息
     * @param map
     * @return
     */
    public List<Comment> list(Map<String, Object> map);

    /**
     * 获取总记录数
     * @param map
     * @return
     */
    public Long getTotal(Map<String, Object> map);

    /**
     * 删除评论信息
     * @param id
     * @return
     */
    public Integer delete(Integer id);


}
