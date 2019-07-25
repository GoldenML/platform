package com.yao.ssm.service.impl;

import com.yao.ssm.mapper.ReplyArticleMapper;
import com.yao.ssm.po.ReplyArticle;
import com.yao.ssm.service.ReplyArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author shkstart
 * @create 2019-06-08 14:12
 */
@Service("replyArticleService")
public class ReplyArticleServiceImpl implements ReplyArticleService {
    @Autowired
    private ReplyArticleMapper replyArticleMapper;
    @Override
    public void insert(ReplyArticle replyArticle) throws Exception {
        replyArticleMapper.insert(replyArticle);
    }

    @Override
    public List<ReplyArticle> findByArticleId(int id) throws Exception {
        return replyArticleMapper.findByArticleId(id);
    }

    @Override
    public List<ReplyArticle> findBySourceId(int sourceId) throws Exception {
        return replyArticleMapper.findBySourceId(sourceId);
    }

    @Override
    public void insertReply(ReplyArticle replyArticle) throws Exception {
        replyArticleMapper.insertReply(replyArticle);
    }
}
