package com.yao.ssm.controller;

import com.yao.ssm.po.Tea;
import com.yao.ssm.po.TeaFile;
import com.yao.ssm.service.TeaFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author shkstart
 * @create 2019-05-16 10:23
 */
@Controller
@RequestMapping("/TeaFileController")
public class TeaFileController {
    @Autowired
    private TeaFileService teaFileService;

    //    插入文件
    @ResponseBody
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public Map<String, Object> insert(@RequestParam(value = "filename", required = false) MultipartFile multipartFile, HttpServletRequest request, HttpServletResponse response) {
//        获取文件名
        String fileName = multipartFile.getOriginalFilename();
//        获取当前日期
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
        Date date = new Date();
        byte[] bytes = null;
        try {
//            获取文件
            bytes = multipartFile.getBytes();
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("获取文件失败！");
        }
//        获取老师账号
//        从application域中取得tea
        ServletContext application = request.getSession().getServletContext();
        Tea tea = (Tea) application.getAttribute("tea");
        TeaFile teaFile = new TeaFile();
//        输入文件信息
        teaFile.setTname(tea.getTname());
        teaFile.setTno(tea.getTno());
        teaFile.setFileName(fileName);
        teaFile.setFile(bytes);
        teaFile.setUploadDate(format.format(date));


        try {
            teaFileService.insert(teaFile);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("文件插入失败");
        }

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 1);
        return map;
    }

    //    查找老师所有文件
    @ResponseBody
    @RequestMapping(value = "/findTeaAllFile", method = RequestMethod.POST)
    public Map<String, Object> findTeaAllFile(HttpServletRequest request) {
        int currentPage = Integer.parseInt(request.getParameter("currentPage"));
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        System.out.println("查找老师所有文件");
        int tno = Integer.parseInt(request.getParameter("id"));
        List<TeaFile> list = null;
        try {
            list = teaFileService.findTeaAllFile(tno,pageSize,(currentPage-1)*10);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("查找老师所有文件失败！");
        }
        Map<String, Object> map = new HashMap<String ,Object>();
        int count = 0;
        try {
            count = teaFileService.findTeaAllFileCount(tno);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("查找老师所有文件总数出错");
        }
        int totlePageSize = count / pageSize;
        if (count % pageSize != 0) {
            totlePageSize++;
        }
        map.put("totlePageSize",totlePageSize);
        map.put("currentPage",currentPage);
        map.put("count",count);
        map.put("list",list);
        return map;
    }

    //    查找所有老师文件
    @ResponseBody
    @RequestMapping(value = "/findAllTeaFile", method = RequestMethod.POST)
    public Map<String, Object> findAllTeaFile(HttpServletRequest request) {
        int currentPage = Integer.parseInt(request.getParameter("currentPage"));
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        Map<String, Object> map = new HashMap<>();
        List<TeaFile> list = null;
        try {
            list = teaFileService.findAllTeaFile(pageSize,(currentPage-1)*10);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("查找所有老师文件失败");
        }
        int count = 0;
        try {
            count = teaFileService.findAllTeaFileCount();
        } catch (Exception e) {
            e.printStackTrace();
        }
        int totlePageSize = count / pageSize;
        if (count % pageSize != 0) {
            totlePageSize++;
        }
        map.put("count",count);
        map.put("totlePageSize",totlePageSize);
        map.put("currentPage",currentPage);
        map.put("list",list);
        return map;
    }
//    获取学院所有文件
    @ResponseBody
    @RequestMapping(value = "/findAcaAllFile", method = RequestMethod.POST)
    public Map<String, Object> findAcaAllFile(HttpServletRequest request){
        int currentPage = Integer.parseInt(request.getParameter("currentPage"));
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        int aca_id = Integer.parseInt(request.getParameter("id"));
        Map<String, Object> map = new HashMap<>();
        List<TeaFile> list = null;
        try {
            list = teaFileService.findAcaAllFile(aca_id,pageSize,(currentPage-1)*10);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("查找学院所有文件失败");
        }
        int count = 0;
        try {
            count = teaFileService.findAcaAllFileCount(aca_id);
            System.out.println(count);
        } catch (Exception e) {
            e.printStackTrace();
        }
        int totlePageSize = count / pageSize;
        if (count % pageSize != 0) {
            totlePageSize++;
        }
        map.put("totlePageSize",totlePageSize);
        map.put("currentPage",currentPage);
        map.put("count",count);
        map.put("list",list);
        return map;
    }
//获取专业所有文件
    @ResponseBody
    @RequestMapping(value = "/findMajorAllFile", method = RequestMethod.POST)
    public Map<String, Object> findMajorAllFile(HttpServletRequest request){
        Map<String, Object> map = new HashMap<>();
        int currentPage = Integer.parseInt(request.getParameter("currentPage"));
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        System.out.println("查询专业全部文件");
        int major_id = Integer.parseInt(request.getParameter("id"));
        System.out.println("major_id="+major_id);
        List<TeaFile> list = null;
        try {
            list = teaFileService.findMajorAllFile(major_id,pageSize,(currentPage-1)*10);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("查找专业所有文件失败");
        }
        int count = 0;
        try {
            count = teaFileService.findMajorAllFileCount(major_id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        int totlePageSize = count / pageSize;
        if (count % pageSize != 0) {
            totlePageSize++;
        }
        map.put("totlePageSize",totlePageSize);
        map.put("currentPage",currentPage);
        map.put("count",count);
        map.put("list",list);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
    public Map<String,Object> deleteFile(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        Map<String,Object> map = new HashMap<>();
        try {
            teaFileService.deleteFile(id);
            map.put("code",1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

//    下载文件
    @RequestMapping("/downLoadFile")
    public ResponseEntity<byte[]> downLoadFile(HttpServletRequest request, HttpServletResponse response) {
//        获取文件id
        int id = Integer.parseInt(request.getParameter("id"));
        TeaFile teaFile = null;
        try {
            teaFile = teaFileService.findFileById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
//        获取文件名
        String filename = teaFile.getFileName();
        try {
            filename = URLEncoder.encode(filename, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            System.out.println("文件转码失败");
        }
//        获取文件
        byte[] bytes = teaFile.getFile();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentDispositionFormData("attachment", filename);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        ResponseEntity<byte[]> responseEntity = new ResponseEntity<byte[]>(bytes, headers, HttpStatus.OK);
        try {
            teaFileService.updateFileDownloadNumAdd(id,teaFile.getDownloadNumber()+1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return responseEntity;
    }

    public static Map<String,Object> useMap(List<TeaFile> list){
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("list",list);
        return map;
    }

}

