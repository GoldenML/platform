package com.yao.ssm.mapper;

import com.yao.ssm.po.StuPraise;
import org.apache.ibatis.annotations.Param;

/**
 * @author shkstart
 * @create 2019-05-22 23:22
 */
public interface StuPraiseMapper {
    void insert(@Param("sno") int sno,@Param("article_id") int article_id)throws Exception;
    void delete(int id)throws Exception;
    StuPraise find(@Param("sno") int sno, @Param("article_id") int article_id)throws Exception;
}
