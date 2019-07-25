package com.yao.ssm.service;

import com.yao.ssm.po.Collect;
import com.yao.ssm.po.StuPraise;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author shkstart
 * @create 2019-05-23 9:10
 */
public interface CollectService {
    void insert(Collect collect)throws Exception;
    void delete(int id)throws Exception;
    Collect find(@Param("sno") int sno, @Param("article_id") int article_id)throws Exception;
    List<Collect> findBySno(@Param("sno") int sno, @Param("currentPage")int currentPage, @Param("pageSize")int pageSize)throws Exception;
    int findCountBySno(int sno)throws Exception;
    void deleteBySno(@Param("sno")int sno,@Param("article_id")int article_id)throws Exception;
}
