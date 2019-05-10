package com.yao.ssm.service.impl;

import com.yao.ssm.mapper.SysMapper;
import com.yao.ssm.po.Sys;
import com.yao.ssm.po.Tea;
import com.yao.ssm.po.TeaAdd;
import com.yao.ssm.service.SysService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author shkstart
 * @create 2019-05-09 15:01
 */
@Service("sysService")
@Transactional
public class SysServiceImpl implements SysService {
    @Autowired
    private SysMapper sysMapper;

    public Sys findBySysno(int sysno) throws Exception {
        return sysMapper.findBySysno(sysno);
    }

    public void addTeacher(Tea tea) throws Exception {
        sysMapper.addTeacher(tea);
    }

    public void addTeacherAdd(TeaAdd teaAdd) throws Exception {
        sysMapper.addTeacherAdd(teaAdd);
    }
}
