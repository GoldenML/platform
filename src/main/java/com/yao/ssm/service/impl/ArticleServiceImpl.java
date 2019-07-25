package com.yao.ssm.service.impl;

import com.yao.ssm.mapper.ArticleMapper;
import com.yao.ssm.po.Article;
import com.yao.ssm.service.ArticleService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author shkstart
 * @create 2019-05-22 8:58
 */
@Service("articleService")
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public void deleteById(int id) throws Exception {
        articleMapper.deleteById(id);
    }

    @Override
    public void insert(Article article) throws Exception {
        articleMapper.insert(article);
    }

    @Override
    public void update(int id, String title, String content) throws Exception {
        articleMapper.update(id,title,content);
    }

    @Override
    public List<Article> findByTno(int tno, int currentPage, int pageSize) throws Exception {
        return articleMapper.findByTno(tno,currentPage,pageSize);
    }


    @Override
    public List<Article> findAllArticle(@Param("currentPage")int currentPage, @Param("pageSize") int pageSize) throws Exception {
        return articleMapper.findAllArticle(currentPage,pageSize);
    }

    @Override
    public int findCountByTno(int tno) throws Exception {
        return articleMapper.findCountByTno(tno);
    }

    @Override
    public int findArticleCount() throws Exception {
        return articleMapper.findArticleCount();
    }

    @Override
    public Article findById(int id) throws Exception {
        return articleMapper.findById(id);
    }

    @Override
    public void addPraiseNum(int id) throws Exception {
        articleMapper.addPraiseNum(id);
    }

    @Override
    public void addLookNum(int id) throws Exception {
        articleMapper.addLookNum(id);
    }

    @Override
    public void decPraiseNum(int id) throws Exception {
        articleMapper.decPraiseNum(id);
    }

    @Override
    public void addBadNum(int id) throws Exception {
        articleMapper.addBadNum(id);
    }

    @Override
    public void decBadNum(int id) throws Exception {
        articleMapper.decBadNum(id);
    }

    @Override
    public void addCollNum(int id) throws Exception {
        articleMapper.addCollNum(id);
    }

    @Override
    public void decCollNum(int id) throws Exception {
        articleMapper.decCollNum(id);
    }
}
