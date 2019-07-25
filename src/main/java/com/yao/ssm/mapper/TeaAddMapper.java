package com.yao.ssm.mapper;

import com.yao.ssm.po.StuAdd;
import com.yao.ssm.po.Tea;
import com.yao.ssm.po.TeaAdd;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author shkstart
 * @create 2019-05-10 17:00
 */
public interface TeaAddMapper {
    TeaAdd findByTno(int tno)throws Exception;
    void updateInformationByTno(TeaAdd teaAdd)throws Exception;
    List<Tea> findTeacherAddPage(@Param("currentPage") int currentPage, @Param("pageSize") int pageSize)throws Exception;
    void deleteByTno(int tno)throws Exception;
}
