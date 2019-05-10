package com.yao.ssm.service;

import com.yao.ssm.po.Sys;
import com.yao.ssm.po.Tea;
import com.yao.ssm.po.TeaAdd;

/**
 * @author shkstart
 * @create 2019-05-09 15:00
 */
public interface SysService {
    Sys findBySysno(int sysno)throws Exception;
    void addTeacher(Tea tea)throws Exception;
    void addTeacherAdd(TeaAdd teaAdd)throws Exception;
}
