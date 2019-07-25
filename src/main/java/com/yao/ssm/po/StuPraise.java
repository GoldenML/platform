package com.yao.ssm.po;

/**
 * @author shkstart
 * @create 2019-05-22 23:20
 */
public class StuPraise {
    private int id;
    private int sno;
    private int article_id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public int getArticle_id() {
        return article_id;
    }

    public void setArticle_id(int article_id) {
        this.article_id = article_id;
    }

    @Override
    public String toString() {
        return "StuPraise{" +
                "id=" + id +
                ", sno=" + sno +
                ", article_id=" + article_id +
                '}';
    }
}
