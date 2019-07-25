package com.yao.ssm.service.impl;

import com.yao.ssm.mapper.TeaAddMapper;
import com.yao.ssm.po.Tea;
import com.yao.ssm.po.TeaAdd;
import com.yao.ssm.service.TeaAddService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author shkstart
 * @create 2019-05-10 16:58
 */
@Service("teaAddService")
@Transactional
public class TeaAddServiceImpl implements TeaAddService {
    @Autowired
    private TeaAddMapper teaAddMapper;
    public TeaAdd findByTno(int tno) throws Exception {
        return teaAddMapper.findByTno(tno);
    }

    @Override
    public void updateInformationByTno(TeaAdd teaAdd) throws Exception {
        teaAddMapper.updateInformationByTno(teaAdd);
    }

    @Override
    public void deleteByTno(int tno) throws Exception {
        teaAddMapper.deleteByTno(tno);
    }

    @Override
    public List<Tea> findTeacherAddPage(int currentPage, int pageSize) throws Exception {
        return teaAddMapper.findTeacherAddPage(currentPage,pageSize);
    }
}
