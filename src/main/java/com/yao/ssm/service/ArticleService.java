package com.yao.ssm.service;

import com.yao.ssm.po.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author shkstart
 * @create 2019-05-22 8:58
 */
public interface ArticleService {
    void deleteById(int id)throws Exception;
    void insert(Article article)throws Exception;
    void update(@Param("id") int id, @Param("title")String title, @Param("content")String content)throws Exception;
    List<Article> findByTno(@Param("tno") int tno,@Param("currentPage")int currentPage,@Param("pageSize") int pageSize) throws Exception;
    List<Article> findAllArticle(@Param("currentPage")int currentPage,@Param("pageSize") int pageSize) throws Exception;
    int findCountByTno(int tno)throws Exception;
    int findArticleCount()throws Exception;
    Article findById(int id)throws Exception;
    void addPraiseNum(int id)throws Exception;
    void addLookNum(int id)throws Exception;
    void decPraiseNum(int id)throws Exception;

    void addBadNum(int id)throws Exception;
    void decBadNum(int id)throws Exception;

    void addCollNum(int id)throws Exception;
    void decCollNum(int id)throws Exception;
}
