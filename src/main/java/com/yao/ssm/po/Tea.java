package com.yao.ssm.po;

/**
 * @author shkstart
 * @create 2019-05-09 16:14
 */
public class Tea {
    private int id;
    private int tno;
    private String tname;
    private String passwd;
    private int tage;
    private String tgender;
    private String tphone;
    private String tbirth;
    private int major_id;
    private int sign;
    private String sreg_date;

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

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public int getTage() {
        return tage;
    }

    public void setTage(int tage) {
        this.tage = tage;
    }

    public String getTgender() {
        return tgender;
    }

    public void setTgender(String tgender) {
        this.tgender = tgender;
    }

    public String getTphone() {
        return tphone;
    }

    public void setTphone(String tphone) {
        this.tphone = tphone;
    }

    public String getTbirth() {
        return tbirth;
    }

    public void setTbirth(String tbirth) {
        this.tbirth = tbirth;
    }

    public int getMajor_id() {
        return major_id;
    }

    public void setMajor_id(int major_id) {
        this.major_id = major_id;
    }

    public int getSign() {
        return sign;
    }

    public void setSign(int sign) {
        this.sign = sign;
    }

    public String getSreg_date() {
        return sreg_date;
    }

    public void setSreg_date(String sreg_date) {
        this.sreg_date = sreg_date;
    }

    @Override
    public String toString() {
        return "Tea{" +
                "id=" + id +
                ", tno=" + tno +
                ", tname='" + tname + '\'' +
                ", passwd='" + passwd + '\'' +
                ", tage=" + tage +
                ", tgender='" + tgender + '\'' +
                ", tphone='" + tphone + '\'' +
                ", tbirth='" + tbirth + '\'' +
                ", major_id=" + major_id +
                ", sign=" + sign +
                ", sreg_date='" + sreg_date + '\'' +
                '}';
    }
}
