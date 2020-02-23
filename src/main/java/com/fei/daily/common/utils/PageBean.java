package com.fei.daily.common.utils;

import java.util.List;

/**
 * 分页类
 */
public class PageBean {

    private int totalCount; //总记录数  105 条
    private int totalPage;  //总页数
    private int size = 5;    // 每页显示条数
    private int currPage; //当前页数
    private int beginNum; // 页码的起点和终点
    private int endNum;
    private List data;   // 存一页数据

    public List getData() {
        return data;
    }

    public void setData(List data) {
        this.data = data;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        //设置总记录时，同时算出总页数
        this.totalPage = totalCount / size;
        if (totalCount % size != 0) {
            this.totalPage++;
        }
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getCurrPage() {
        return currPage;
    }

    public void setCurrPage(int currPage) {
        this.currPage = currPage;
        //设置当前页，自动算出 首尾页码
        if (this.totalPage <= 10) {
            this.beginNum = 1;
            this.endNum = this.totalPage;
        } else {
            beginNum = currPage - 5;
            endNum = currPage + 4;
            if (beginNum <= 0) {  //头部超出
                beginNum = 1;
                endNum = 10;
            }
            //尾部超出
            if (endNum > totalPage) {
                beginNum = totalPage - 9;
                endNum = totalPage;
            }
        }

    }

    public int getBeginNum() {
        return beginNum;
    }

    public void setBeginNum(int beginNum) {
        this.beginNum = beginNum;
    }

    public int getEndNum() {
        return endNum;
    }

    public void setEndNum(int endNum) {
        this.endNum = endNum;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", size=" + size +
                ", currPage=" + currPage +
                ", beginNum=" + beginNum +
                ", endNum=" + endNum +
                ", data=" + data +
                '}';
    }
}
