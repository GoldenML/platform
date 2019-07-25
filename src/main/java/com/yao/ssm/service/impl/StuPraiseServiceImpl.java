package com.yao.ssm.service.impl;

import com.yao.ssm.mapper.StuPraiseMapper;
import com.yao.ssm.po.StuPraise;
import com.yao.ssm.service.StuPraiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author shkstart
 * @create 2019-05-22 23:25
 */
@Service("stuPraiseService")
public class StuPraiseServiceImpl implements StuPraiseService {
    @Autowired
    private StuPraiseMapper stuPraiseMapper;
    @Override
    public void insert(int sno, int article_id) throws Exception {
        stuPraiseMapper.insert(sno,article_id);
    }

    @Override
    public StuPraise find(int sno, int article_id) throws Exception {
        return stuPraiseMapper.find(sno,article_id);
    }

    @Override
    public void delete(int id) throws Exception {
        stuPraiseMapper.delete(id);
    }
}
