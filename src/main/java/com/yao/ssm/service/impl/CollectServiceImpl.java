package com.yao.ssm.service.impl;

import com.yao.ssm.mapper.CollectMapper;
import com.yao.ssm.po.Collect;
import com.yao.ssm.po.StuPraise;
import com.yao.ssm.service.CollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author shkstart
 * @create 2019-05-23 9:11
 */
@Service("collectService")
public class CollectServiceImpl implements CollectService {
    @Autowired
    private CollectMapper collectMapper;
    @Override
    public void insert(Collect collect) throws Exception {
        collectMapper.insert(collect);
    }
    @Override
    public void delete(int id) throws Exception {
        collectMapper.delete(id);
    }
    @Override
    public Collect find(int sno, int article_id) throws Exception {
        return collectMapper.find(sno,article_id);
    }

    @Override
    public List<Collect> findBySno(int sno, int currentPage, int pageSize) throws Exception {
        return collectMapper.findBySno(sno,currentPage,pageSize);
    }

    @Override
    public int findCountBySno(int sno) throws Exception {
        return collectMapper.findCountBySno(sno);
    }

    @Override
    public void deleteBySno(int sno, int article_id) throws Exception {
        collectMapper.deleteBySno(sno,article_id);
    }

}
