package com.yao.ssm.service.impl;

import com.yao.ssm.mapper.MajorMapper;
import com.yao.ssm.po.Major;
import com.yao.ssm.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author shkstart
 * @create 2019-05-10 11:49
 */
@Service("majorService")
@Transactional
public class MajorServiceImpl implements MajorService {
    @Autowired
    private MajorMapper majorMapper;

    public List<Major> findByAca_id(int aca_id) throws Exception {
        return majorMapper.findByAca_id(aca_id);
    }
}
