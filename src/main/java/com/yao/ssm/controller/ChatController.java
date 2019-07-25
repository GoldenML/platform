package com.yao.ssm.controller;

import com.yao.ssm.po.Chat;
import com.yao.ssm.service.ChatService;
import com.yao.ssm.util.CurrentDate;
import com.yao.ssm.util.MapUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @author shkstart
 * @create 2019-05-28 14:28
 */
@Controller
@RequestMapping("/ChatController")
public class ChatController {
    @Autowired
    private ChatService chatService;
    @ResponseBody
    @RequestMapping(value = "/insert" ,method = RequestMethod.POST)
    public Map<String,Object> insert(Chat chat){
        try {
            chat.setTime(CurrentDate.currentDate());
            chatService.insert(chat);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("插入失败");
            System.out.println(chat);
        }
        return MapUtil.returnMap();
    }
    @ResponseBody
    @RequestMapping(value = "/findByTno" ,method = RequestMethod.POST)
    public Map<String,Object> findByTno(HttpServletRequest request) throws Exception {
        Map<String,Object> map = new HashMap<>();
        int tno = Integer.parseInt(request.getParameter("tno"));
        Chat chat =  chatService.findByTno(tno);
        map.put("chat",chat);
        if(chat!=null) {
            map.put("code", 1);
        }
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/findByName" ,method = RequestMethod.POST)
    public Map<String,Object> findByName(HttpServletRequest request) throws Exception {
        Map<String,Object> map = new HashMap<>();
        String chatName = request.getParameter("chatName");
        Chat chat =  chatService.findByName(chatName);
        if(chat!=null) {
            map.put("code", 1);
        }
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/deleteByTno" ,method = RequestMethod.POST)
    public Map<String,Object> deleteByTno(HttpServletRequest request) throws Exception {
        int tno = Integer.parseInt(request.getParameter("tno"));
        chatService.deleteByTno(tno);
        return MapUtil.returnMap();
    }
}
