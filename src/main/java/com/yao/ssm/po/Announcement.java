package com.yao.ssm.po;

/**
 * @author shkstart
 * @create 2019-06-03 9:36
 */
public class Announcement {
    private int id;
    private int tno;
    private String content;
    private String time;
    private String handleStatus;
    private int status;

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Announcement{" +
                "id=" + id +
                ", tno=" + tno +
                ", content='" + content + '\'' +
                ", time='" + time + '\'' +
                ", time='" + handleStatus + '\'' +
                ", status=" + status +
                '}';
    }

    public String getHandleStatus() {
        return handleStatus;
    }

    public void setHandleStatus(String handleStatus) {
        this.handleStatus = handleStatus;
    }
}
