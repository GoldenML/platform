package com.yao.ssm.service.impl;

import com.yao.ssm.mapper.AnnouncementMapper;
import com.yao.ssm.po.Announcement;
import com.yao.ssm.service.AnnouncementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author shkstart
 * @create 2019-06-03 9:44
 */
@Service("announcementService")
public class AnnouncementServiceImpl implements AnnouncementService {
    @Autowired
    private AnnouncementMapper announcementMapper;
    @Override
    public void insert(Announcement announcement) throws Exception {
        announcementMapper.insert(announcement);
    }

    @Override
    public List<Announcement> findByTno(int tno, int currentPage, int pageSize) throws Exception {
        return announcementMapper.findByTno(tno,currentPage,pageSize);
    }

    @Override
    public int findCount(int tno) throws Exception {
        return announcementMapper.findCount(tno);
    }

    @Override
    public List<Announcement> findByStatus(int status, int currentPage, int pageSize) throws Exception {
        return announcementMapper.findByStatus(status,currentPage,pageSize);
    }

    @Override
    public int findCountByStatus(int status) throws Exception {
        return announcementMapper.findCountByStatus(status);
    }

    @Override
    public void agreeAnnounce(int id) throws Exception {
        announcementMapper.agreeAnnounce(id);
    }

    @Override
    public void disagreeAnnounce(int id) throws Exception {
        announcementMapper.disagreeAnnounce(id);
    }

    @Override
    public List<Announcement> indexAnnounce() throws Exception {
        return announcementMapper.indexAnnounce();
    }

    @Override
    public void deleteById(int id) throws Exception {
        announcementMapper.deleteById(id);
    }
}
