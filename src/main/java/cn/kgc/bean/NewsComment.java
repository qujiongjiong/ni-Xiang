package cn.kgc.bean;

import java.util.Date;

public class NewsComment {
    private Integer id;

    private Integer newsid;

    private String content;

    private String author;

    private Date createdate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNewsid() {
        return newsid;
    }

    public void setNewsid(Integer newsid) {
        this.newsid = newsid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public NewsComment() {

    }

    public NewsComment(Integer id, Integer newsid, String content, String author, Date createdate) {

        this.id = id;
        this.newsid = newsid;
        this.content = content;
        this.author = author;
        this.createdate = createdate;
    }


}