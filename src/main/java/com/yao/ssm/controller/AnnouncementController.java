package com.yao.ssm.controller;

import com.yao.ssm.po.Announcement;
import com.yao.ssm.po.Tea;
import com.yao.ssm.service.AnnouncementService;
import com.yao.ssm.service.TeaService;
import com.yao.ssm.util.CurrentDate;
import com.yao.ssm.util.MapUtil;
import com.yao.ssm.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author shkstart
 * @create 2019-06-03 9:59
 */
@Controller
@RequestMapping("/AnnouncementController")
public class AnnouncementController {
    @Autowired
    private AnnouncementService announcementService;
    @Autowired
    private TeaService teaService;
    @ResponseBody
    @RequestMapping(value = "/insert",method = RequestMethod.POST)
    public Map<String,Object> insert(Announcement announcement) throws Exception {
        announcement.setTime(CurrentDate.currentDate());
        announcementService.insert(announcement);
        return MapUtil.returnMap();
    }
    @ResponseBody
    @RequestMapping(value = "/findByTno",method = RequestMethod.POST)
    public Map<String,Object> findByTno(PageUtil pageUtil, HttpServletRequest request) throws Exception {
        Map<String,Object> map = new HashMap<>();
        int tno = Integer.parseInt(request.getParameter("tno"));
        List<Announcement> list = announcementService.findByTno(tno,pageUtil.getCurrentPage()-1,pageUtil.getPageSize());
        int count = announcementService.findCount(tno);
        map = MapUtil.returnMap(count,pageUtil.getCurrentPage(),pageUtil.getPageSize());
        map.put("list",list);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/findByStatus",method = RequestMethod.POST)
    public Map<String,Object> findByStatus(PageUtil pageUtil, HttpServletRequest request) throws Exception{
        Map<String,Object> map = new HashMap<>();
        int status = Integer.parseInt(request.getParameter("status"));
        List<Announcement> list = announcementService.findByStatus(status,(pageUtil.getCurrentPage()-1)*pageUtil.getPageSize(),pageUtil.getPageSize());
        List<Tea> list1 = new ArrayList<>();
        for(Announcement announcement : list){
            list1.add(teaService.findByTno(announcement.getTno()));
        }
        int count = announcementService.findCountByStatus(status);
//        int count2 = announcementService.findCountByStatus(0);
        map = MapUtil.returnMap(count,pageUtil.getCurrentPage(),pageUtil.getPageSize());
        map.put("list",list);
        map.put("list2",list1);
//        map.put("count2",count2);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/findCount0",method = RequestMethod.GET)
    public Map<String,Object> findCount0() throws Exception{
        Map<String,Object> map = new HashMap<>();
        int count = announcementService.findCountByStatus(0);
        map.put("count",count);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/agreeAnnounce",method = RequestMethod.POST)
    public Map<String,Object> agreeAnnounce(HttpServletRequest request) throws Exception{
        int id = Integer.parseInt(request.getParameter("id"));
        announcementService.agreeAnnounce(id);
        return MapUtil.returnMap();
    }
    @ResponseBody
    @RequestMapping(value = "/disagreeAnnounce",method = RequestMethod.POST)
    public Map<String,Object> disagreeAnnounce(HttpServletRequest request) throws Exception{
        int id = Integer.parseInt(request.getParameter("id"));
        announcementService.disagreeAnnounce(id);
        return MapUtil.returnMap();
    }
    @ResponseBody
    @RequestMapping(value = "/indexAnnounce",method = RequestMethod.GET)
    public Map<String,Object> indexAnnounce(HttpServletRequest request) throws Exception{
        Map<String,Object> map = new HashMap<>();
        List<Announcement> list = announcementService.indexAnnounce();
        List<Tea> list2 = new ArrayList<>();
        for(Announcement announcement : list){
            Tea tea = teaService.findByTno(announcement.getTno());
            list2.add(tea);
        }
        map.put("list",list);
        map.put("list2",list2);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/deleteById",method = RequestMethod.POST)
    public Map<String,Object> deleteById(HttpServletRequest request)throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        announcementService.deleteById(id);
        return MapUtil.returnMap();
    }
}
