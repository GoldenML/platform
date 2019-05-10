package com.yao.ssm.mapper;

import com.yao.ssm.po.Aca;
import com.yao.ssm.po.Major;

import java.util.List;

/**
 * @author shkstart
 * @create 2019-05-10 11:48
 */
public interface MajorMapper {
    List<Major> findByAca_id(int aca_id)throws Exception;
}
