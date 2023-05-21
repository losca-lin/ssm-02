package com.example.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

import java.io.Serializable;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/**
 * 科普信息实体
 * @author Administrator
 *
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class News {

    private Integer id; // 编号
    private String title; // 标题
    private String summary; // 摘要
    private Date releaseDate; // 发布日期
    private Integer clickHit; // 查看次数
    private Integer replyHit; // 回复次数
    private String content; // 内容
    private String contentNoTag; // 内容 无网页标签 Lucene分词用
    private NewsType newsType; // 类型

    private Integer newsCount; // 数量 非科普信息实际属性，主要是 根据发布日期归档查询科普信息数量用
    private String releaseDateStr; // 发布日期字符串 只取年和月
    private String keyWord; // 关键字 空格隔开

    private Integer pid;

    private String pname;

    private String file;


    private List<String> imagesList=new LinkedList<String>(); // 科普信息里存在的图片 主要用于列表展示显示缩略图



}
