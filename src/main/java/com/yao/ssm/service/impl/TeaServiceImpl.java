package com.yao.ssm.service.impl;

import com.yao.ssm.mapper.TeaMapper;
import com.yao.ssm.po.Tea;
import com.yao.ssm.service.TeaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author shkstart
 * @create 2019-05-10 13:16
 */
@Service("teaService")
@Transactional
public class TeaServiceImpl implements TeaService {
    @Autowired
    private TeaMapper teaMapper;
    public Tea findByTno(int tno) throws Exception {
        return teaMapper.findByTno(tno);
    }

    public Tea findByTea(Tea tea) throws Exception {
        return teaMapper.findByTea(tea);
    }
    public List<Tea> findAllTeacher(int major_id) throws Exception {
        return teaMapper.findAllTeacher(major_id);
    }

    @Override
    public void updateInformationByTno(Tea tea) throws Exception {
        teaMapper.updateInformationByTno(tea);
    }

    @Override
    public void updatePasswdByTno(Tea tea) throws Exception {
        teaMapper.updatePasswdByTno(tea);
    }

    @Override
    public List<Tea> findTeacherPage(int currentPage, int pageSize) throws Exception {
        return teaMapper.findTeacherPage(currentPage,pageSize);
    }

    @Override
    public int findTeaCount() throws Exception {
        return teaMapper.findTeaCount();
    }

    @Override
    public void deleteByTno(int tno) throws Exception {
        teaMapper.deleteByTno(tno);
    }
}
