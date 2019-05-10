package com.yao.ssm.po;

/**
 * @author shkstart
 * @create 2019-05-09 16:10
 */
public class Aca {
    private int id;
    private String name;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Aca{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
