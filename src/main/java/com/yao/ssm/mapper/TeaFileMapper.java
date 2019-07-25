package com.yao.ssm.mapper;

import com.yao.ssm.po.TeaFile;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author shkstart
 * @create 2019-05-16 10:13
 */
public interface TeaFileMapper {
    void insert(TeaFile teaFile)throws Exception;
    List<TeaFile> findTeaAllFile(@Param("tno") int tno,@Param("pageSize")int pageSize,@Param("currentPage")int currentPage) throws Exception;
    List<TeaFile> findAllTeaFile(@Param("pageSize")int pageSize,@Param("currentPage")int currentPage) throws Exception;
    TeaFile findFileById(int id)throws Exception;
    List<TeaFile> findAcaAllFile(@Param("aca_id") int aca_id,@Param("pageSize")int pageSize,@Param("currentPage")int currentPage)throws Exception;
    void updateFileDownloadNumAdd(@Param("id") int id,@Param("downloadNumber") int download_number) throws Exception;
    int findTeaAllFileCount(int tno)throws Exception;
    int findAllTeaFileCount()throws Exception;
    void deleteFile(int id)throws Exception;
    int findAcaAllFileCount(int aca_id) throws Exception;
    List<TeaFile> findMajorAllFile(@Param("major_id") int major_id,@Param("pageSize")int pageSize,@Param("currentPage")int currentPage)throws Exception;
    int findMajorAllFileCount(int major_id)throws Exception;
}
