package com.yao.ssm.mapper;

import com.yao.ssm.po.Chat;

/**
 * @author shkstart
 * @create 2019-05-28 14:17
 */
public interface ChatMapper {
    void insert(Chat chat)throws Exception;
    Chat findByTno(int tno)throws Exception;
    void deleteByTno(int tno)throws Exception;
    Chat findByName(String chatName)throws Exception;
}
