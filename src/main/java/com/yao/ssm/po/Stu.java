package com.yao.ssm.po;

public class Stu{
    private int id;
    private int sno;
    private String sname;
    private String passwd;
    private int sage;
    private String sgender;
    private String sphone;
    private int gno;
    private String sbirth;
    private int sign;
    private String sreg_date;
//    private PageUtil messagePageUtil;

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

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public int getSage() {
        return sage;
    }

    public void setSage(int sage) {
        this.sage = sage;
    }

    public String getSgender() {
        return sgender;
    }

    public void setSgender(String sgender) {
        this.sgender = sgender;
    }

    public String getSphone() {
        return sphone;
    }

    public void setSphone(String sphone) {
        this.sphone = sphone;
    }

    public int getGno() {
        return gno;
    }

    public void setGno(int gno) {
        this.gno = gno;
    }

    public String getSbirth() {
        return sbirth;
    }

    public void setSbirth(String sbirth) {
        this.sbirth = sbirth;
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


//    public PageUtil getMessagePageUtil() {
//        return messagePageUtil;
//    }
//
//    public void setMessagePageUtil(PageUtil messagePageUtil) {
//        this.messagePageUtil = messagePageUtil;
//    }


    @Override
    public String toString() {
        return "Stu{" +
                "id=" + id +
                ", sno=" + sno +
                ", sname='" + sname + '\'' +
                ", passwd='" + passwd + '\'' +
                ", sage=" + sage +
                ", sgender='" + sgender + '\'' +
                ", sphone='" + sphone + '\'' +
                ", gno=" + gno +
                ", sbirth='" + sbirth + '\'' +
                ", sign=" + sign +
                ", sreg_date='" + sreg_date + '\'' +
                '}';
    }
}