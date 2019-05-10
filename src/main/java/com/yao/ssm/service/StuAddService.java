package com.yao.ssm.service;

import com.yao.ssm.po.Stu;
import com.yao.ssm.po.StuAdd;

/**
 * @author shkstart
 * @create 2019-05-09 10:42
 */
public interface StuAddService {
    StuAdd findBySno(int sno)throws Exception;
    void insertStuAdd(StuAdd stuAdd)throws Exception;
    void updateInformationBySno(StuAdd stuAdd)throws Exception;
}
