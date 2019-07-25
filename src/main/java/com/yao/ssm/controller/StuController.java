package com.yao.ssm.controller;


import com.yao.ssm.po.SleaveMessage;
import com.yao.ssm.po.Stu;
import com.yao.ssm.po.StuAdd;
import com.yao.ssm.service.StuAddService;
import com.yao.ssm.service.StuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author shkstart
 * @create 2019-04-15 10:59
 */

@Controller
@RequestMapping("/StuController")
public class StuController {
    @Autowired
    private StuService stuService;
    @Autowired
    private StuAddService stuAddService;
//    注册
    @ResponseBody
    @RequestMapping(value="/insertStu",method = RequestMethod.POST)
    public Map insertStu(Stu stu,HttpServletRequest request, HttpServletResponse response) throws Exception {
//        response.setContentType("text/plain;charset=UTF-8");
//        Stu stu;
//        String sname = request.getParameter("sname");
//        String sphone = request.getParameter("sphone");
//        String passwd = request.getParameter("passwd");
//        String sno = request.getParameter("sno");
//        String gno = request.getParameter("gno");
        int gno=stu.getGno();
        Stu stu2 = stuService.findByPhone(stu.getSphone());
        Map<String,Object> map = new HashMap<String,Object>();
        Stu stu1 = null;
        if(stu2!=null){
            map.put("code",1);
            return map;
        }else {
            int sno;
            do{
                int sno_add = (int)Math.floor(Math.random() * 100000);
                String sno_s = "" + gno + sno_add ;
                sno = Integer.parseInt(sno_s);
                stu1 = stuService.findBySno(sno);
            }while(stu1!=null);
//            System.out.println(sno_s + " , " + sname + " , " + passwd + " , " + sphone + " , " + gno);
//            System.out.println(sno_s.getClass().toString() + " , " + sname.getClass().toString() + " , " + passwd.getClass().toString() + " , " + sphone.getClass().toString() + " , " + gno);
            System.out.println(sno);
            stu.setSno(sno);
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
            Date date =new Date();
            stu.setSreg_date(format.format(date));
//            System.out.println(sno + " , " + sname + " , " + passwd + " , " + sphone + " , " + gno);
            stuService.insertStu(stu);

            StuAdd stuAdd = new StuAdd();
            stuAdd.setSno(sno);
            stuAddService.insertStuAdd(stuAdd);

            ServletContext sc =request.getSession().getServletContext();
            sc.setAttribute("sno",sno);
            map.put("code",2);
            return map;
        }
    }
//    登录
    @ResponseBody
    @RequestMapping(value="/login")
    public Map login(Stu stu,HttpServletRequest request, HttpServletResponse response){
//        int sno = Integer.parseInt(request.getParameter("sno"));
//        String passwd = request.getParameter("passwd");
        Map<String,Object> map = new HashMap<String,Object>();
        Stu stu1 = null;
        try {
            stu1 = stuService.findBySno(stu.getSno());
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("根据学生账号查找学生出错");
        }
        if(stu1==null){
            map.put("code",2);
        }else if(stu1.getPasswd().equals(stu.getPasswd())){
            map.put("code",1);
            request.getSession().setAttribute("stu",stu1);
            StuAdd stuAdd = null;
            try {
                stuAdd = stuAddService.findBySno(stu.getSno());
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("根据学生账号查找学生附加属性出错");
            }
            request.getSession().setAttribute("stuAdd",stuAdd);
        }else{
            map.put("code",2);
        }
        return map;
    }
//    修改密码
    @ResponseBody
    @RequestMapping(value="/alter_passwd",method = RequestMethod.POST)
    public Map alter_passwd(HttpServletRequest request, HttpServletResponse response)throws Exception{
        Map<String,Object> map = new HashMap<String,Object>();
        int sno = Integer.parseInt(request.getParameter("sno"));
        String old_passwd = request.getParameter("old_passwd");
        String new_passwd = request.getParameter("new_passwd");
        Stu stu = stuService.findBySno(sno);
        if(stu.getPasswd().equals(old_passwd)){
            stu.setPasswd(new_passwd);
            System.out.println(new_passwd);
            stuService.updatePasswdBySno(stu);
            map.put("code",1);
            return map;
        }else{
            map.put("code",2);
            return map;
        }
    }
//    修改信息
    @ResponseBody
    @RequestMapping(value="/alter_information",method = RequestMethod.POST)
    public Map alter_information(Stu stu,StuAdd stuAdd,HttpServletRequest request, HttpServletResponse response)throws Exception{
        Map<String,Object> map = new HashMap<String,Object>();
        stuService.updateInformationBySno(stu);
        stuAddService.updateInformationBySno(stuAdd);
        request.getSession().setAttribute("stu",stu);
        request.getSession().setAttribute("stuAdd",stuAdd);
        map.put("code",1);
        return map;
    }
    @ResponseBody
    @RequestMapping(value="/findMesBySno",method = RequestMethod.POST)
    public Map findMesBySno(Stu stu,HttpServletRequest request)throws Exception{
        List<Object> list = stuService.findMesBySno(stu.getSno());
        Map<String,Object> map = new HashMap<String, Object>();
        int count = stuService.findMesCount(stu.getSno());
        int pageSize=10;
        int totlePageSize = count / pageSize;
        if (count % pageSize != 0) {
            totlePageSize++;
        }
        map.put("list",list);
        map.put("count",count);
        map.put("pageSize",pageSize);
        map.put("totlePageSize",totlePageSize);
        return map;
    }
}
