package com.yao.ssm.service.impl;

import com.yao.ssm.mapper.TeaFileMapper;
import com.yao.ssm.po.TeaFile;
import com.yao.ssm.service.TeaFileService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

/**
 * @author shkstart
 * @create 2019-05-16 10:22
 */
@Service("teaFileService")
@Transactional
public class TeaFileServiceImpl implements TeaFileService {
    @Autowired
    private TeaFileMapper teaFileMapper;
    public void insert(TeaFile teaFile) throws Exception{
        teaFileMapper.insert(teaFile);
    }

    public List<TeaFile> findTeaAllFile(@Param("tno") int tno, @Param("pageSize")int pageSize, @Param("currentPage")int currentPage) throws Exception{
        return teaFileMapper.findTeaAllFile(tno,pageSize,currentPage);
    }

    public List<TeaFile> findAllTeaFile(int pageSize,int currentPage) throws Exception {
        return teaFileMapper.findAllTeaFile(pageSize,currentPage);
    }

    public TeaFile findFileById(int id) throws Exception {
        return teaFileMapper.findFileById(id);
    }

    public List<TeaFile> findAcaAllFile(int aca_id,int pageSize,int currentPage) throws Exception {
        return teaFileMapper.findAcaAllFile(aca_id,pageSize,currentPage);
    }

    public List<TeaFile> findMajorAllFile(@Param("major_id") int major_id,@Param("pageSize")int pageSize,@Param("currentPage")int currentPage) throws Exception {
        return teaFileMapper.findMajorAllFile(major_id,pageSize,currentPage);
    }

    public void updateFileDownloadNumAdd(int id, int download_number) throws Exception {
        teaFileMapper.updateFileDownloadNumAdd(id,download_number);
    }

    @Override
    public int findTeaAllFileCount(int tno) throws Exception {
        return teaFileMapper.findTeaAllFileCount(tno);
    }

    @Override
    public void deleteFile(int id) throws Exception {
        teaFileMapper.deleteFile(id);
    }

    @Override
    public int findAllTeaFileCount() throws Exception {
        return teaFileMapper.findAllTeaFileCount();
    }

    @Override
    public int findAcaAllFileCount(int aca_id) throws Exception {
        return teaFileMapper.findAcaAllFileCount(aca_id);
    }

    @Override
    public int findMajorAllFileCount(int major_id) throws Exception {
        return teaFileMapper.findMajorAllFileCount(major_id);
    }


}
