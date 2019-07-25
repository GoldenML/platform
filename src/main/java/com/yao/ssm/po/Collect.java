package com.yao.ssm.po;

/**
 * @author shkstart
 * @create 2019-05-23 9:08
 */
public class Collect {
    private int id;
    private int article_id;
    private int sno;
    private String col_date;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getArticle_id() {
        return article_id;
    }

    public void setArticle_id(int article_id) {
        this.article_id = article_id;
    }

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public String getCol_date() {
        return col_date;
    }

    public void setCol_date(String col_date) {
        this.col_date = col_date;
    }

    @Override
    public String toString() {
        return "Collect{" +
                "id=" + id +
                ", article_id=" + article_id +
                ", sno=" + sno +
                ", col_date='" + col_date + '\'' +
                '}';
    }
}
