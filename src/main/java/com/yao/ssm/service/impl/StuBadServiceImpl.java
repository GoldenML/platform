package com.yao.ssm.service.impl;

import com.yao.ssm.mapper.StuBadMapper;
import com.yao.ssm.mapper.StuPraiseMapper;
import com.yao.ssm.po.StuBad;
import com.yao.ssm.service.StuBadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author shkstart
 * @create 2019-05-23 0:17
 */
@Service("StuBadService")
public class StuBadServiceImpl implements StuBadService {
    @Autowired
    private StuBadMapper stuBadMapper;
    @Override
    public void insert(int sno, int article_id) throws Exception {
        stuBadMapper.insert(sno,article_id);
    }

    @Override
    public StuBad find(int sno, int article_id) throws Exception {
        return stuBadMapper.find(sno,article_id);
    }

    @Override
    public void delete(int id) throws Exception {
        stuBadMapper.delete(id);
    }
}
