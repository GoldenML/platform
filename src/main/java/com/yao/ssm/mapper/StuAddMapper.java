package com.yao.ssm.mapper;

import com.yao.ssm.po.Stu;
import com.yao.ssm.po.StuAdd;

/**
 * @author shkstart
 * @create 2019-05-09 10:39
 */
public interface StuAddMapper {
    StuAdd findBySno(int sno)throws Exception;
    void insertStuAdd(StuAdd stuAdd)throws Exception;
    void updateInformationBySno(StuAdd stuAdd)throws Exception;
}
