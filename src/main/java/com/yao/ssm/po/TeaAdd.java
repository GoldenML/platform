package com.yao.ssm.po;

/**
 * @author shkstart
 * @create 2019-05-09 16:14
 */
public class TeaAdd {
    private int id;
    private int tno;
    private String taddress;
    private String temail;
    private String tintro;

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

    public String getTaddress() {
        return taddress;
    }

    public void setTaddress(String taddress) {
        this.taddress = taddress;
    }

    public String getTemail() {
        return temail;
    }

    public void setTemail(String temail) {
        this.temail = temail;
    }

    public String getTintro() {
        return tintro;
    }

    public void setTintro(String tintro) {
        this.tintro = tintro;
    }

    @Override
    public String toString() {
        return "TeaAdd{" +
                "id=" + id +
                ", tno=" + tno +
                ", taddress='" + taddress + '\'' +
                ", temail='" + temail + '\'' +
                ", tintro='" + tintro + '\'' +
                '}';
    }
}
