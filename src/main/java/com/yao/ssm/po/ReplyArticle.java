package com.yao.ssm.po;

/**
 * @author shkstart
 * @create 2019-06-08 13:55
 */
public class ReplyArticle {
    private int id;
    private int articleId;
    private int no;
    private int sourceId;
    private int sourceNo;
    private String peoToPeo;
    private String content;
    private String time;

    @Override
    public String toString() {
        return "ReplyArticle{" +
                "id=" + id +
                ", articleId=" + articleId +
                ", no=" + no +
                ", sourceId=" + sourceId +
                ", sourceNo=" + sourceNo +
                ", peoToPeo='" + peoToPeo + '\'' +
                ", content='" + content + '\'' +
                ", time='" + time + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getArticleId() {
        return articleId;
    }

    public void setArticleId(int articleId) {
        this.articleId = articleId;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public int getSourceId() {
        return sourceId;
    }

    public void setSourceId(int sourceId) {
        this.sourceId = sourceId;
    }

    public int getSourceNo() {
        return sourceNo;
    }

    public void setSourceNo(int sourceNo) {
        this.sourceNo = sourceNo;
    }

    public String getPeoToPeo() {
        return peoToPeo;
    }

    public void setPeoToPeo(String peoToPeo) {
        this.peoToPeo = peoToPeo;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
