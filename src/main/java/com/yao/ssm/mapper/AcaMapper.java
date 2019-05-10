package com.yao.ssm.mapper;

import com.yao.ssm.po.Aca;

import java.util.List;

/**
 * @author shkstart
 * @create 2019-05-09 16:50
 */
public interface AcaMapper {
    List<Aca> findAllAca()throws Exception;
}
