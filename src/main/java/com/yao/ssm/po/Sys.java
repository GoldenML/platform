package com.yao.ssm.po;

/**
 * @author shkstart
 * @create 2019-05-09 14:57
 */
public class Sys {
    private int id;
    private int sysno;
    private String passwd;
    private String name;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSysno() {
        return sysno;
    }

    public void setSysno(int sysno) {
        this.sysno = sysno;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Sys{" +
                "id=" + id +
                ", sysno=" + sysno +
                ", passwd='" + passwd + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
