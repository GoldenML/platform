package com.yao.ssm.service;

import com.yao.ssm.po.Tea;

/**
 * @author shkstart
 * @create 2019-05-10 13:16
 */
public interface TeaService {
    Tea findByTno(int tno)throws Exception;
}
