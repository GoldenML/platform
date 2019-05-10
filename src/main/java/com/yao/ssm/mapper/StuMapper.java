package com.yao.ssm.mapper;

import com.yao.ssm.po.Stu;

public interface StuMapper{
      void insertStu(Stu stu)throws Exception;
      Stu findBySno(int sno)throws Exception;
      void findByStu(Stu stu)throws Exception;
      Stu findByPhone(String phone)throws Exception;
      void updatePasswdBySno(Stu stu) throws Exception;
      void updateInformationBySno(Stu stu)throws Exception;
}