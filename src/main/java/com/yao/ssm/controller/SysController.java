package com.yao.ssm.controller;

import com.yao.ssm.po.Sys;
import com.yao.ssm.po.Tea;
import com.yao.ssm.po.TeaAdd;
import com.yao.ssm.service.SysService;
import com.yao.ssm.service.TeaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * @author shkstart
 * @create 2019-05-09 15:02
 */
@Controller
@RequestMapping("/SysController")
public class SysController {
    @Autowired
    private SysService sysService;
    @Autowired
    private TeaService teaService;
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(Sys sys, HttpServletResponse response, HttpServletRequest request)throws Exception{
        Sys sys1 = sysService.findBySysno(sys.getSysno());
        System.out.println(sys1);
        if(sys1.getPasswd().equals(sys.getPasswd())){
            return "adminSuccess";
        }
        else{
            return "";
        }
    }
    @ResponseBody
    @RequestMapping(value ="/addTeacher",method = RequestMethod.POST)
    public Map addTeacher(Tea tea, TeaAdd teaAdd)throws Exception{
        Map<String,Object> map = new HashMap<String,Object>();
        Tea tea1 = null;
        int tno;
        do{
            int tno_add = (int)Math.floor(Math.random() * 100000);
            String sno_s = "" + 520 + tno_add ;
            tno = Integer.parseInt(sno_s);
            tea1 = teaService.findByTno(tno);
        }while(tea1!=null);
        tea.setTno(tno);
        tea.setPasswd(tea.getTphone().substring(5,11));
        teaAdd.setTno(tno);
        sysService.addTeacher(tea);
        sysService.addTeacherAdd(teaAdd);
        map.put("code",1);
        return map;
    }
}
