package com.example.pojo;

public class Link {
    private Integer id;
    private String linkName;
    private String linkUrl;
    private Integer orderNo;

    public Link() {
    }

    public Link(Integer id, String linkName, String likUrl, Integer orderNo) {
        this.id = id;
        this.linkName = linkName;
        this.linkUrl = likUrl;
        this.orderNo = orderNo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLinkName() {
        return linkName;
    }

    public void setLinkName(String linkName) {
        this.linkName = linkName;
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    @Override
    public String toString() {
        return "Link{" +
                "id=" + id +
                ", linkName='" + linkName + '\'' +
                ", likUrl='" + linkUrl + '\'' +
                ", orderNo=" + orderNo +
                '}';
    }
}
