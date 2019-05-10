package com.yao.ssm.mapper;

import com.yao.ssm.po.Sys;
import com.yao.ssm.po.Tea;
import com.yao.ssm.po.TeaAdd;

/**
 * @author shkstart
 * @create 2019-05-09 14:58
 */
public interface SysMapper {
    Sys findBySysno(int sysno)throws Exception;
    void addTeacher(Tea tea)throws Exception;
    void addTeacherAdd(TeaAdd teaAdd)throws Exception;
}
