package com.yao.ssm.po;

/**
 * @author shkstart
 * @create 2019-05-28 14:15
 */
public class Chat {
    private int id;
    private int tno;
    private String chatName;
    private String time;
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

    public String getChatName() {
        return chatName;
    }

    public void setChatName(String chatName) {
        this.chatName = chatName;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Chat{" +
                "id=" + id +
                ", tno=" + tno +
                ", chatName='" + chatName + '\'' +
                ", time='" + time + '\'' +
                ", status=" + status +
                '}';
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
