package com.yao.ssm.po;

/**
 * @author shkstart
 * @create 2019-05-09 16:13
 */
public class Grade {
    private int id;
    private int gno;
    private String edu_degree;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGno() {
        return gno;
    }

    public void setGno(int gno) {
        this.gno = gno;
    }

    public String getEdu_degree() {
        return edu_degree;
    }

    public void setEdu_degree(String edu_degree) {
        this.edu_degree = edu_degree;
    }

    @Override
    public String toString() {
        return "Grade{" +
                "id=" + id +
                ", gno=" + gno +
                ", edu_degree='" + edu_degree + '\'' +
                '}';
    }
}
