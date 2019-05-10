package com.yao.ssm.service.impl;

import com.yao.ssm.mapper.StuAddMapper;
import com.yao.ssm.po.Stu;
import com.yao.ssm.po.StuAdd;
import com.yao.ssm.service.StuAddService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author shkstart
 * @create 2019-05-09 10:42
 */
@Service("stuAddService")
public class StuAddServiceImpl implements StuAddService {
    @Autowired
    private StuAddMapper stuAddMapper;
    public StuAdd findBySno(int sno) throws Exception {
        return stuAddMapper.findBySno(sno);
    }

    public void insertStuAdd(StuAdd stuAdd) throws Exception {
        stuAddMapper.insertStuAdd(stuAdd);
    }

    public void updateInformationBySno(StuAdd stuAdd) throws Exception {
        stuAddMapper.updateInformationBySno(stuAdd);
    }
}
