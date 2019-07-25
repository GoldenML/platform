package com.yao.ssm.po;

/**
 * @author shkstart
 * @create 2019-05-22 8:44
 */
public class Article {
    private int id;
    private int tno;
    private String tname;
    private String title;
    private String content;
    private String uploadDate;
    private int praiseNumber;
    private int badNumber;
    private int collNumber;
    private int status;
    private int lookNumber;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTno() {
        return tno;
    }

    public void setTno(int tno) {
        this.tno = tno;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(String uploadDate) {
        this.uploadDate = uploadDate;
    }

    public int getPraiseNumber() {
        return praiseNumber;
    }

    public void setPraiseNumber(int praiseNumber) {
        this.praiseNumber = praiseNumber;
    }

    public int getBadNumber() {
        return badNumber;
    }

    public void setBadNumber(int badNumber) {
        this.badNumber = badNumber;
    }

    public int getCollNumber() {
        return collNumber;
    }

    public void setCollNumber(int collNumber) {
        this.collNumber = collNumber;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", tno=" + tno +
                ", tname='" + tname + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", uploadDate='" + uploadDate + '\'' +
                ", praiseNumber=" + praiseNumber +
                ", badNumber=" + badNumber +
                ", collNumber=" + collNumber +
                ", lookNumber=" + lookNumber +
                ", status=" + status +
                '}';
    }

    public int getLookNumber() {
        return lookNumber;
    }

    public void setLookNumber(int lookNumber) {
        this.lookNumber = lookNumber;
    }
}
