package com.example.pojo;

import java.util.Date;

/**
 * 评论实体
 * @author Administrator
 *
 */
public class Comment {

    private Integer id; // 编号
    private String userIp; // 用户IP
    private String content; // 评论内容
    private News news; // 被评论的科普信息
    private Date commentDate; // 评论日期
    private Integer state; // 审核状态  0 待审核 1 审核通过 2 审核未通过

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    private String username;

    public Comment() {
    }

    public Comment(Integer id, String userIp, String content, News news, Date commentDate, Integer state, String username) {
        this.id = id;
        this.userIp = userIp;
        this.content = content;
        this.news = news;
        this.commentDate = commentDate;
        this.state = state;
        this.username = username;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserIp() {
        return userIp;
    }

    public void setUserIp(String userIp) {
        this.userIp = userIp;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", userIp='" + userIp + '\'' +
                ", content='" + content + '\'' +
                ", news=" + news +
                ", commentDate=" + commentDate +
                ", state=" + state +
                '}';
    }
}
