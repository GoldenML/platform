package com.yao.ssm.service;

import com.yao.ssm.po.Aca;

import java.util.List;

/**
 * @author shkstart
 * @create 2019-05-09 16:51
 */
public interface AcaService {
    List<Aca> findAllAca()throws Exception;
}
