package com.yao.ssm.mapper;

import com.yao.ssm.po.Tea;

/**
 * @author shkstart
 * @create 2019-05-10 13:15
 */
public interface TeaMapper {
    Tea findByTno(int tno)throws Exception;
}
