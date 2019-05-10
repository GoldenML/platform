package com.yao.ssm.service;

import com.yao.ssm.po.Major;

import java.util.List;

/**
 * @author shkstart
 * @create 2019-05-10 11:49
 */
public interface MajorService {
    List<Major> findByAca_id(int aca_id)throws Exception;
}
