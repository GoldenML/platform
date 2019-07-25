package com.yao.ssm.controller;

import com.yao.ssm.po.Tea;
import com.yao.ssm.po.TleaveMessage;
import com.yao.ssm.service.SleaveMessageService;
import com.yao.ssm.service.TeaService;
import com.yao.ssm.service.TleaveMessageService;
import com.yao.ssm.util.CurrentDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author shkstart
 * @create 2019-05-18 16:13
 */
@Controller
@RequestMapping("/TleaveMessageController")
public class TleaveMessageController {
    @Autowired
    private TleaveMessageService tleaveMessageService;
    @Autowired
    private SleaveMessageService sleaveMessageService;
    @Autowired
    private TeaService teaService;
    @ResponseBody
    @RequestMapping("/insert")
    public Map<String,Object> insert(TleaveMessage tleaveMessage){
        tleaveMessage.setTlmDate(CurrentDate.currentDate());
        Tea tea = null;
        try {
            tea = teaService.findByTno(tleaveMessage.getTno());
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("根据老师账号查找老师失败");
        }
        tleaveMessage.setTname(tea.getTname());
        try {
            tleaveMessageService.insert(tleaveMessage);
            System.out.println(tleaveMessage.getId());
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("老师回复插入失败");
        }
        try {
            sleaveMessageService.updateStatues(tleaveMessage.getSleaveMessageId(),"已回复  ");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("更新留言状态失败");
            try {
                tleaveMessageService.delete(tleaveMessage.getId());
            } catch (Exception e1) {
                e1.printStackTrace();
                System.out.println("失败");
            }
        }
        Map<String,Object> map = new HashMap<>();
        map.put("code",1);
        return map;
    }
}
