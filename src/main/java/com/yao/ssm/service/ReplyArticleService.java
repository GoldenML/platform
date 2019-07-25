package com.yao.ssm.service;

import com.yao.ssm.po.ReplyArticle;

import java.util.List;

/**
 * @author shkstart
 * @create 2019-06-08 14:12
 */
public interface ReplyArticleService {
    void insert(ReplyArticle replyArticle) throws Exception;
    List<ReplyArticle> findByArticleId(int id)throws Exception;
    List<ReplyArticle> findBySourceId(int sourceId)throws Exception;
    void insertReply(ReplyArticle replyArticle) throws Exception;
}
