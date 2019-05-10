package com.yao.ssm.service.impl;

import com.yao.ssm.mapper.AcaMapper;
import com.yao.ssm.po.Aca;
import com.yao.ssm.service.AcaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author shkstart
 * @create 2019-05-09 16:52
 */
@Service("acaService")
public class AcaServiceImpl implements AcaService {
    @Autowired
    private AcaMapper acaMapper;
    public List<Aca> findAllAca() throws Exception {
        return acaMapper.findAllAca();
    }
}
