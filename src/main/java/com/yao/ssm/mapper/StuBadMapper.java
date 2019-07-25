package com.yao.ssm.mapper;

import com.yao.ssm.po.StuBad;
import com.yao.ssm.po.StuPraise;
import org.apache.ibatis.annotations.Param;

/**
 * @author shkstart
 * @create 2019-05-23 0:14
 */
public interface StuBadMapper {
    void insert(@Param("sno") int sno, @Param("article_id") int article_id)throws Exception;
    void delete(int id)throws Exception;
    StuBad find(@Param("sno") int sno, @Param("article_id") int article_id)throws Exception;
}
