package com.yao.ssm.po;

/**
 * @author shkstart
 * @create 2019-05-09 10:37
 */
public class StuAdd {
    private int id;
    private int sno;
    private String saddress;
    private String semail;
    private String sintro;

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

    public String getSaddress() {
        return saddress;
    }

    public void setSaddress(String saddress) {
        this.saddress = saddress;
    }

    public String getSemail() {
        return semail;
    }

    public void setSemail(String semail) {
        this.semail = semail;
    }

    public String getSintro() {
        return sintro;
    }

    public void setSintro(String sintro) {
        this.sintro = sintro;
    }

    @Override
    public String toString() {
        return "StuAdd{" +
                "id=" + id +
                ", sno=" + sno +
                ", saddress='" + saddress + '\'' +
                ", semail='" + semail + '\'' +
                ", sintro='" + sintro + '\'' +
                '}';
    }
}
