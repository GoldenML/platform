package com.yao.ssm.service.impl;

import com.sun.org.apache.bcel.internal.generic.RETURN;
import com.yao.ssm.mapper.SleaveMessageMapper;
import com.yao.ssm.po.SleaveMessage;
import com.yao.ssm.po.Stu;
import com.yao.ssm.service.SleaveMessageService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author shkstart
 * @create 2019-05-14 11:33
 */
@Service("sleaveMessageService")
@Transactional
public class SleaveMessageServiceImpl implements SleaveMessageService {
    @Autowired
    private SleaveMessageMapper sleaveMessageMapper;
    public List<Object> findAllMesByStu(@Param("no") int no, @Param("pageSize")int pageSize, @Param("currentPage")int currentPage)throws Exception{
        return sleaveMessageMapper.findAllMesByStu(no,pageSize,currentPage);
    }

    public List<Object> findAllMesByTea(@Param("no") int no,@Param("pageSize")int pageSize,@Param("currentPage")int currentPage)throws Exception{
        return sleaveMessageMapper.findAllMesByTea(no,pageSize,currentPage);
    }

    public int findMesCountBySno(int sno) throws Exception {
        return sleaveMessageMapper.findMesCountBySno(sno);
    }

    public int findMesCountByTno(int tno) throws Exception {
        return sleaveMessageMapper.findMesCountByTno(tno);
    }

    public void insertMes(SleaveMessage sleaveMessage) throws Exception {
        sleaveMessageMapper.insertMes(sleaveMessage);
    }

    public SleaveMessage findAddMes(int sno) throws Exception {
        return sleaveMessageMapper.findAddMes(sno);
    }

    public void deleteMes(int id) throws Exception {
        sleaveMessageMapper.deleteMes(id);
    }

    public List<Object> lookMesContent(int id) throws Exception {
        return sleaveMessageMapper.lookMesContent(id);
    }

    @Override
    public void updateStatues(@Param("id") int id,@Param("slm_status")String slm_status) throws Exception {
        sleaveMessageMapper.updateStatues(id,slm_status);
    }
}
