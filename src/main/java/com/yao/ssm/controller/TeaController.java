package com.yao.ssm.controller;

import com.yao.ssm.po.*;
import com.yao.ssm.service.TeaAddService;
import com.yao.ssm.service.TeaService;
import com.yao.ssm.util.MapUtil;
import com.yao.ssm.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author shkstart
 * @create 2019-05-10 16:54
 */
@Controller
@RequestMapping("/TeaController")
public class TeaController {
    @Autowired
    private TeaService teaService;
    @Autowired
    private TeaAddService teaAddService;
    @ResponseBody
    @RequestMapping("/login")
    public Map login(Tea tea, HttpServletRequest request)throws Exception{
        System.out.println(tea);
        Tea tea1 = teaService.findByTno(tea.getTno());
        Map<String,Object> map = new HashMap<String,Object>();
        if(tea1.getPasswd().equals(tea.getPasswd())){
            request.getSession().setAttribute("tea",tea1);
            TeaAdd teaAdd = teaAddService.findByTno(tea.getTno());
            request.getSession().setAttribute("teaAdd",teaAdd);
            map.put("code",1);
        }else{
            map.put("code",2);
        }
        return map;
    }
    @ResponseBody
    @RequestMapping("/findAllTeacher")
    public List<Tea> findAllTeacher(Tea tea)throws Exception{
        List<Tea> lists = teaService.findAllTeacher(tea.getMajor_id());
        return lists;
    }
    @ResponseBody
    @RequestMapping(value = "/findTeacherPage",method = RequestMethod.POST)
    public Map<String,Object> findTeacherPage(PageUtil pageUtil)throws Exception{
        Map<String,Object> map = new HashMap<>();
        List<Tea> lists = new ArrayList<>();
        List<Tea> lists2 = new ArrayList<>();
        lists = teaService.findTeacherPage(10*(pageUtil.getCurrentPage()-1),pageUtil.getPageSize());
        lists2 = teaAddService.findTeacherAddPage((pageUtil.getCurrentPage()-1)*10,pageUtil.getPageSize());
        int count = teaService.findTeaCount();
        map = MapUtil.returnMap(count,pageUtil.getCurrentPage(),pageUtil.getPageSize());
        map.put("list",lists);
        map.put("list2",lists2);
        return map;
    }
    @ResponseBody
    @RequestMapping(value="/alter_information",method = RequestMethod.POST)
    public Map alter_information(Tea tea, TeaAdd teaAdd, HttpServletRequest request, HttpServletResponse response)throws Exception{
        Map<String,Object> map = new HashMap<String,Object>();
        teaService.updateInformationByTno(tea);
        teaAddService.updateInformationByTno(teaAdd);
        request.getSession().setAttribute("tea",tea);
        request.getSession().setAttribute("teaAdd",teaAdd);
        map.put("code",1);
        return map;
    }

    @ResponseBody
    @RequestMapping(value="/alter_passwd",method = RequestMethod.POST)
    public Map alter_passwd(HttpServletRequest request, HttpServletResponse response)throws Exception{
        Map<String,Object> map = new HashMap<String,Object>();
        int tno = Integer.parseInt(request.getParameter("tno"));
        String old_passwd = request.getParameter("old_passwd");
        String new_passwd = request.getParameter("new_passwd");
        Tea tea = teaService.findByTno(tno);
        if(tea.getPasswd().equals(old_passwd)){
            tea.setPasswd(new_passwd);
            System.out.println(new_passwd);
            teaService.updatePasswdByTno(tea);
            map.put("code",1);
            return map;
        }else{
            map.put("code",2);
            return map;
        }
    }

    @ResponseBody
    @RequestMapping(value="/deleteByTno",method = RequestMethod.POST)
    public Map<String,Object> deleteByTno(HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        int tno = Integer.parseInt(request.getParameter("tno"));
        try {
            teaAddService.deleteByTno(tno);
            teaService.deleteByTno(tno);
            map.put("code",1);
        } catch (Exception e) {
            map.put("code",2);
            e.printStackTrace();
        }
        return map;
    }

}
