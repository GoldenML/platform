package com.yao.ssm.service.impl;


import com.yao.ssm.mapper.StuMapper;
import com.yao.ssm.po.SleaveMessage;
import com.yao.ssm.po.Stu;
import com.yao.ssm.po.Tea;
import com.yao.ssm.service.StuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * @author shkstart
 * @create 2019-04-15 12:30
 */
@Service("stuService")
@Transactional
public class StuServiceImpl implements StuService {
    @Autowired
    private StuMapper stuMapper;

    public void insertStu(Stu stu) throws Exception {
        stuMapper.insertStu(stu);
    }
//
//
    public Stu findBySno(int sno) throws Exception {
        return stuMapper.findBySno(sno);
    }

    public void findByStu(Stu stu) throws Exception {
        stuMapper.findByStu(stu);
    }

    //
//
    public Stu findByPhone(String phone) throws Exception {
        return stuMapper.findByPhone(phone);
    }
//
//
    public void updatePasswdBySno(Stu stu) throws Exception {
        stuMapper.updatePasswdBySno(stu);
    }

    public void updateInformationBySno(Stu stu) throws Exception {
        stuMapper.updateInformationBySno(stu);
    }

    public int findMesCount(int sno) throws Exception {
        return stuMapper.findMesCount(sno);
    }

    public List<Object> findMesBySno(int sno) throws Exception {
        return stuMapper.findMesBySno(sno);
    }


}
