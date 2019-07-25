package com.yao.ssm.service;

import com.yao.ssm.po.Announcement;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author shkstart
 * @create 2019-06-03 9:44
 */
public interface AnnouncementService {
    void insert(Announcement announcement)throws Exception;
    List<Announcement> findByTno(@Param("tno") int tno, @Param("currentPage")int currentPage, @Param("pageSize")int pageSize)throws Exception;
    int findCount(int tno)throws Exception;
    List<Announcement> findByStatus(@Param("status") int status,@Param("currentPage")int currentPage, @Param("pageSize")int pageSize)throws Exception;
    int findCountByStatus(int status)throws Exception;
    void agreeAnnounce(int id)throws Exception;
    void disagreeAnnounce(int id)throws Exception;
    List<Announcement> indexAnnounce()throws Exception;
    void deleteById(int id)throws Exception;
}
