package com.yao.ssm.service.impl;

import com.yao.ssm.mapper.ChatMapper;
import com.yao.ssm.po.Chat;
import com.yao.ssm.service.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author shkstart
 * @create 2019-05-28 14:25
 */
@Service("chatService")
public class ChatServiceImpl implements ChatService {
    @Autowired
    private ChatMapper chatMapper;
    @Override
    public void insert(Chat chat) throws Exception {
        chatMapper.insert(chat);
    }


    @Override
    public Chat findByTno(int tno) throws Exception {
        return chatMapper.findByTno(tno);
    }

    @Override
    public void deleteByTno(int tno) throws Exception {
        chatMapper.deleteByTno(tno);
    }

    @Override
    public Chat findByName(String chatName) throws Exception {
        return chatMapper.findByName(chatName);
    }
}
