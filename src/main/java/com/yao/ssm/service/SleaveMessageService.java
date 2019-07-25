package com.yao.ssm.service;

import com.yao.ssm.po.SleaveMessage;
import com.yao.ssm.po.Stu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author shkstart
 * @create 2019-05-14 11:32
 */
public interface SleaveMessageService {
    List<Object> findAllMesByStu(@Param("no") int no, @Param("pageSize")int pageSize, @Param("currentPage")int currentPage)throws Exception;
    List<Object> findAllMesByTea(@Param("no") int no,@Param("pageSize")int pageSize,@Param("currentPage")int currentPage)throws Exception;
    int findMesCountBySno(int sno)throws Exception;
    int findMesCountByTno(int tno)throws Exception;
    void insertMes(SleaveMessage sleaveMessage)throws Exception;
    SleaveMessage findAddMes(int sno)throws Exception;
    void deleteMes(int id)throws Exception;
    List<Object> lookMesContent(int id)throws Exception;
    void updateStatues(@Param("id") int id,@Param("slm_status")String slm_status) throws Exception;
}
