package com.yao.ssm.po;

/**
 * @author shkstart
 * @create 2019-05-18 16:06
 */
public class TleaveMessage {
    private int id;
    private String tname;
    private int sleaveMessageId;
    private int tno;
    private String tlmContent;
    private String tlmDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSleaveMessageId() {
        return sleaveMessageId;
    }

    public void setSleaveMessageId(int sleaveMessageId) {
        this.sleaveMessageId = sleaveMessageId;
    }

    public int getTno() {
        return tno;
    }

    public void setTno(int tno) {
        this.tno = tno;
    }

    public String getTlmContent() {
        return tlmContent;
    }

    public void setTlmContent(String tlmContent) {
        this.tlmContent = tlmContent;
    }

    public String getTlmDate() {
        return tlmDate;
    }

    public void setTlmDate(String tlmDate) {
        this.tlmDate = tlmDate;
    }

    @Override
    public String toString() {
        return "TleaveMessage{" +
                "id=" + id +
                ", tname=" + tname +
                ", sleaveMessageId=" + sleaveMessageId +
                ", tno=" + tno +
                ", tlmContent='" + tlmContent + '\'' +
                ", tlmDate='" + tlmDate + '\'' +
                '}';
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }
}
