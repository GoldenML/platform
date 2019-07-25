package com.yao.ssm.service.impl;

import com.yao.ssm.mapper.TleaveMessageMapper;
import com.yao.ssm.po.TleaveMessage;
import com.yao.ssm.service.TleaveMessageService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
/**
 * @author shkstart
 * @create 2019-05-18 16:11
 */
@Service("tleaveMessageService")
@Transactional
public class TleaveMessageServiceImpl implements TleaveMessageService {
    @Autowired
    private TleaveMessageMapper tleaveMessageMapper;

//    @Override
//    public void insert(@Param("slmId") int sleaveMessageId, @Param("tno") int tno, @Param("tlmContent")String tlmContent) throws Exception{
//        tleaveMessageMapper.insert(sleaveMessageId,tno,tlmContent);
//    }

    @Override
    public void delete(int id) throws Exception{
        tleaveMessageMapper.delete(id);
    }

    @Override
    public TleaveMessage findBySlmId(int slm_id) throws Exception {
        return tleaveMessageMapper.findBySlmId(slm_id);
    }

    @Override
    public void insert(TleaveMessage tleaveMessage) throws Exception {
        tleaveMessageMapper.insert(tleaveMessage);
    }
}
