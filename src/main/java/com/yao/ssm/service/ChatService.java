package com.yao.ssm.service;

import com.yao.ssm.po.Chat;

/**
 * @author shkstart
 * @create 2019-05-28 14:25
 */
public interface ChatService {
    void insert(Chat chat)throws Exception;
    Chat findByTno(int tno)throws Exception;
    void deleteByTno(int tno)throws Exception;
    Chat findByName(String chatName)throws Exception;
}
