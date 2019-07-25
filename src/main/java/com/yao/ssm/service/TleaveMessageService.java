package com.yao.ssm.service;

import com.yao.ssm.po.TleaveMessage;
import org.apache.ibatis.annotations.Param;

/**
 * @author shkstart
 * @create 2019-05-18 16:11
 */
public interface TleaveMessageService {
//    void insert(@Param("slmId") int sleaveMessageId,@Param("tno") int tno,@Param("tlmContent")String tlmContent) throws Exception;
    void delete(int id)throws Exception;
    TleaveMessage findBySlmId(@Param("slmId") int slm_id)throws Exception;
    void insert(TleaveMessage tleaveMessage) throws Exception;
}
