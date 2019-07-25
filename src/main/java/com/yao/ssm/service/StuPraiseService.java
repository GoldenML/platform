package com.yao.ssm.service;

import com.yao.ssm.po.StuPraise;
import org.apache.ibatis.annotations.Param;

/**
 * @author shkstart
 * @create 2019-05-22 23:24
 */
public interface StuPraiseService {
    void insert(@Param("sno") int sno, @Param("article_id") int article_id)throws Exception;
    StuPraise find(@Param("sno") int sno, @Param("article_id") int article_id)throws Exception;
    void delete(int id)throws Exception;
}
