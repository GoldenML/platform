package com.yao.ssm.mapper;

import com.yao.ssm.po.Stu;
import com.yao.ssm.po.Tea;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author shkstart
 * @create 2019-05-10 13:15
 */
public interface TeaMapper {
    Tea findByTno(int tno)throws Exception;
    Tea findByTea(Tea tea)throws Exception;
    List<Tea> findAllTeacher(int major_id)throws Exception;
    void updateInformationByTno(Tea tea)throws Exception;
    void updatePasswdByTno(Tea tea) throws Exception;
    List<Tea> findTeacherPage(@Param("currentPage") int currentPage, @Param("pageSize") int pageSize)throws Exception;
    int findTeaCount()throws Exception;
    void deleteByTno(int tno)throws Exception;
}
