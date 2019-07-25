package com.yao.ssm.po;

import java.util.Arrays;
import java.util.Date;

/**
 * @author shkstart
 * @create 2019-05-16 10:03
 */
public class TeaFile {
    private Integer id;

    private Integer tno;

    private String tname;

    private String fileName;

    private String uploadDate;

    private Integer praiseNumber;

    private Integer badNumber;

    private Integer collNumber;

    private Integer downloadNumber;


    private byte[] file;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTno() {
        return tno;
    }

    public void setTno(Integer tno) {
        this.tno = tno;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(String uploadDate) {
        this.uploadDate = uploadDate;
    }

    public Integer getPraiseNumber() {
        return praiseNumber;
    }

    public void setPraiseNumber(Integer praiseNumber) {
        this.praiseNumber = praiseNumber;
    }

    public Integer getBadNumber() {
        return badNumber;
    }

    public void setBadNumber(Integer badNumber) {
        this.badNumber = badNumber;
    }

    public Integer getCollNumber() {
        return collNumber;
    }

    public void setCollNumber(Integer collNumber) {
        this.collNumber = collNumber;
    }

    public byte[] getFile() {
        return file;
    }

    public void setFile(byte[] file) {
        this.file = file;
    }

    @Override
    public String toString() {
        return "TeaFile{" +
                "id=" + id +
                ", tno=" + tno +
                ", tname=" + tname +
                ", fileName='" + fileName + '\'' +
                ", uploadDate=" + uploadDate +
                ", praiseNumber=" + praiseNumber +
                ", badNumber=" + badNumber +
                ", collNumber=" + collNumber +
                ", downloadNumber=" + downloadNumber +
                ", file=" + Arrays.toString(file) +
                '}';
    }

    public Integer getDownloadNumber() {
        return downloadNumber;
    }

    public void setDownloadNumber(Integer downloadNumber) {
        this.downloadNumber = downloadNumber;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }
}
