package com.yao.ssm.service;


import com.yao.ssm.po.Stu;

/**
 * @author shkstart
 * @create 2019-04-15 12:30
 */
public interface StuService {
    void insertStu(Stu stu)throws Exception;
    Stu findBySno(int sno)throws Exception;
    void findByStu(Stu stu)throws Exception;
    Stu findByPhone(String phone)throws Exception;
    void updatePasswdBySno(Stu stu) throws Exception;
    void updateInformationBySno(Stu stu)throws Exception;
}
