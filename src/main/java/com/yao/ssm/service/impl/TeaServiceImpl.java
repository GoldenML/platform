package com.yao.ssm.service.impl;

import com.yao.ssm.mapper.TeaMapper;
import com.yao.ssm.po.Tea;
import com.yao.ssm.service.TeaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author shkstart
 * @create 2019-05-10 13:16
 */
@Service("teaService")
public class TeaServiceImpl implements TeaService {
    @Autowired
    private TeaMapper teaMapper;
    public Tea findByTno(int tno) throws Exception {
        return teaMapper.findByTno(tno);
    }
}
