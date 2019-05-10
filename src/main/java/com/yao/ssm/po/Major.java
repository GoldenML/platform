package com.yao.ssm.po;

/**
 * @author shkstart
 * @create 2019-05-09 16:11
 */
public class Major {
    private int id;
    private int aca_id;
    private String name;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAca_id() {
        return aca_id;
    }

    public void setAca_id(int aca_id) {
        this.aca_id = aca_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Major{" +
                "id=" + id +
                ", aca_id=" + aca_id +
                ", name='" + name + '\'' +
                '}';
    }
}
