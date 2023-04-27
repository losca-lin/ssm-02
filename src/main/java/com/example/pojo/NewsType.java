package com.example.pojo;

public class NewsType {
    private Integer id;
    private String typeName;
    private String orderNo;
    private Integer newsCount;

    public Integer getNewsCount() {
        return newsCount;
    }

    public void setNewsCount(Integer newsCount) {
        this.newsCount = newsCount;
    }

    public NewsType(Integer id, String typeName, String orderNo) {
        this.id = id;
        this.typeName = typeName;
        this.orderNo = orderNo;
    }

    public NewsType() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    @Override
    public String toString() {
        return "NewsType{" +
                "id=" + id +
                ", typeName='" + typeName + '\'' +
                ", orderNo='" + orderNo + '\'' +
                '}';
    }
}
