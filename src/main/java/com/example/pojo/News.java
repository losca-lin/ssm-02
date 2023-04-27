package com.example.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/**
 * 科普信息实体
 * @author Administrator
 *
 */
public class News implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

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

    private List<String> imagesList=new LinkedList<String>(); // 科普信息里存在的图片 主要用于列表展示显示缩略图

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getSummary() {
        return summary;
    }
    public void setSummary(String summary) {
        this.summary = summary;
    }
    public Date getReleaseDate() {
        return releaseDate;
    }
    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }
    public Integer getClickHit() {
        return clickHit;
    }
    public void setClickHit(Integer clickHit) {
        this.clickHit = clickHit;
    }
    public Integer getReplyHit() {
        return replyHit;
    }
    public void setReplyHit(Integer replyHit) {
        this.replyHit = replyHit;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getContentNoTag() {
        return contentNoTag;
    }
    public void setContentNoTag(String contentNoTag) {
        this.contentNoTag = contentNoTag;
    }
    public NewsType getNewsType() {
        return newsType;
    }
    public void setNewsType(NewsType newsType) {
        this.newsType = newsType;
    }
    public Integer getNewsCount() {
        return newsCount;
    }
    public void setNewsCount(Integer newsCount) {
        this.newsCount = newsCount;
    }
    public String getReleaseDateStr() {
        return releaseDateStr;
    }
    public void setReleaseDateStr(String releaseDateStr) {
        this.releaseDateStr = releaseDateStr;
    }
    public String getKeyWord() {
        return keyWord;
    }
    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }

    public List<String> getImagesList() {
        return imagesList;
    }
    public void setImagesList(List<String> imagesList) {
        this.imagesList = imagesList;
    }



}
