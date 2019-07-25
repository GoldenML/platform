package com.yao.ssm.po;

/**
 * @author shkstart
 * @create 2019-05-11 17:09
 */
public class SleaveMessage {
    private int id;
    private int tleave_message_id;
    ;private int sno;
    private String sname;
    private int tno;
    private String tname;
    private String slm_time;
    private String slm_content;
    private String slm_status;

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

    public String getSlm_time() {
        return slm_time;
    }

    public void setSlm_time(String slm_time) {
        this.slm_time = slm_time;
    }

    public String getSlm_content() {
        return slm_content;
    }

    public void setSlm_content(String slm_content) {
        this.slm_content = slm_content;
    }

    @Override
    public String toString() {
        return "SleaveMessage{" +
                "id=" + id +
                ", sno=" + sno +
                ", sname=" + sname +
                ", tno=" + tno +
                ", tname='" + tname + '\'' +
                ", slm_time='" + slm_time + '\'' +
                ", slm_content='" + slm_content + '\'' +
                ", slm_status='" + slm_status + '\'' +
                ", tleave_message_id='" + tleave_message_id + '\'' +
                '}';
    }

    public String getSlm_status() {
        return slm_status;
    }

    public void setSlm_status(String slm_status) {
        this.slm_status = slm_status;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public int getTleave_message_id() {
        return tleave_message_id;
    }

    public void setTleave_message_id(int tleave_message_id) {
        this.tleave_message_id = tleave_message_id;
    }
}
