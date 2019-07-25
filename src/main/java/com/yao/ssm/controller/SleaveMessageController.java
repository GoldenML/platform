package com.yao.ssm.controller;

import com.yao.ssm.po.SleaveMessage;
import com.yao.ssm.po.Stu;
import com.yao.ssm.po.Tea;
import com.yao.ssm.po.TleaveMessage;
import com.yao.ssm.service.SleaveMessageService;
import com.yao.ssm.service.StuService;
import com.yao.ssm.service.TeaService;
import com.yao.ssm.service.TleaveMessageService;
import com.yao.ssm.util.CurrentDate;
import com.yao.ssm.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author shkstart
 * @create 2019-05-14 11:30
 */
@Controller
@RequestMapping("/SleaveMessageController")
public class SleaveMessageController {
    @Autowired
    private SleaveMessageService sleaveMessageService;
    @Autowired
    private TleaveMessageService tleaveMessageService;
    @Autowired
    private TeaService teaService;
    @Autowired
    private StuService stuService;
    @ResponseBody
    @RequestMapping(value = "/findAllMesByStu",method = RequestMethod.POST)
    public Map<String, Object> findAllMesByStu(Stu stu, PageUtil pageUtil, HttpServletRequest request){
        System.out.println(stu.getSno());
        System.out.println(pageUtil.getPageSize());
        System.out.println(pageUtil.getCurrentPage());
        List<Object> list= null;
        try {
            list = sleaveMessageService.findAllMesByStu(stu.getSno(), pageUtil.getPageSize(),(pageUtil.getCurrentPage()-1)*10);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("查找全部留言失败");
        }
        int count = 0;
        try {
            count = sleaveMessageService.findMesCountBySno(stu.getSno());
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("查找留言总数出错");
        }
        Map<String,Object> map = new HashMap<String, Object>();
        int pageSize = pageUtil.getPageSize();
        int currentPage = pageUtil.getCurrentPage();
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
    @ResponseBody
    @RequestMapping(value = "/findAllMesByTea",method = RequestMethod.POST)
    public Map<String, Object> findAllMesByTea(Tea tea, PageUtil pageUtil, HttpServletRequest request){
        Map<String,Object> map = new HashMap<String, Object>();
        List<Object> list= null;
        try {
            list = sleaveMessageService.findAllMesByTea(tea.getTno(), pageUtil.getPageSize(),(pageUtil.getCurrentPage()-1)*10);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("查找全部留言失败");
        }
        int count = 0;

        try {
            count = sleaveMessageService.findMesCountByTno(tea.getTno());
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("查找留言总数出错");
        }
        int currentPage = pageUtil.getCurrentPage();
        int pageSize = pageUtil.getPageSize();
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
//    学生留言
    @ResponseBody
    @RequestMapping(value = "/insertMes",method = RequestMethod.POST)
    public Map<String, Object> insertMes(SleaveMessage sleaveMessage, HttpServletRequest request){
        Map<String,Object> map = new HashMap<String, Object>();
        Tea tea = null;
        try {
            tea = teaService.findByTno(sleaveMessage.getTno());
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("根据老师账号查找老师失败");
        }
        Stu stu = null;
        try {
            stu = stuService.findBySno(sleaveMessage.getSno());
        } catch (Exception e) {
            e.printStackTrace();
        }
        sleaveMessage.setSname(stu.getSname());
        sleaveMessage.setTname(tea.getTname());
        sleaveMessage.setSlm_time(CurrentDate.currentDate());
        sleaveMessage.setTleave_message_id(0);
        try {
            sleaveMessageService.insertMes(sleaveMessage);
            map.put("code",1);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("插入留言失败");
        }
//        SleaveMessage sleaveMessage1 = sleaveMessageService.findAllMesByTno();
//        TleaveMessageController tleaveMessageController = new TleaveMessageController();
//
//        tleaveMessageController.insert(sleaveMessage.getId(),sleaveMessage.getTno());
        return map;
    }
//    学生回复
    @ResponseBody
    @RequestMapping(value = "/insert",method = RequestMethod.POST)
    public Map<String, Object> insert(SleaveMessage sleaveMessage, HttpServletRequest request) throws Exception {

        TleaveMessage tleaveMessage = null;
        try {
            tleaveMessage = tleaveMessageService.findBySlmId(sleaveMessage.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
        sleaveMessage.setTleave_message_id(tleaveMessage.getId());
        sleaveMessage.setSlm_time(CurrentDate.currentDate());
        sleaveMessage.setTno(tleaveMessage.getTno());
        sleaveMessage.setTname(teaService.findByTno(tleaveMessage.getTno()).getTname());
        sleaveMessage.setSname(stuService.findBySno(sleaveMessage.getSno()).getSname());
        sleaveMessageService.insertMes(sleaveMessage);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("code",1);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/findAddMes",method = RequestMethod.POST)
    public SleaveMessage findAddMes(HttpServletRequest request){
        int sno = Integer.parseInt(request.getParameter("sno"));
        SleaveMessage sleaveMessage = null;
        try {
            sleaveMessage = sleaveMessageService.findAddMes(sno);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("查找失败");
        }
        return sleaveMessage;
    }
    @ResponseBody
    @RequestMapping(value = "/deleteMes",method = RequestMethod.POST)
    public Map<String, Object> deleteMes(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        Map<String, Object> map = new HashMap<String, Object>();
        try {

            sleaveMessageService.deleteMes(id);
            map.put("code",1);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("删除失败！");
        }
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/lookMesContent",method = RequestMethod.POST)
    public Map<String, Object> lookMesContent(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("slm_id"));
        System.out.println(id);
        List<Object> list = null;
//        SleaveMessage sleaveMessage = null;
        try {
            list = sleaveMessageService.lookMesContent(id);
            System.out.println(list);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("查看留言失败");
        }
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("list",list);
        return map;
    }
}
