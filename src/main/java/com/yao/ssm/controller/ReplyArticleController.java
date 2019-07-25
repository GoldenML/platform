package com.yao.ssm.controller;

import com.sun.org.apache.bcel.internal.generic.RETURN;
import com.yao.ssm.po.ReplyArticle;
import com.yao.ssm.po.Stu;
import com.yao.ssm.service.ReplyArticleService;
import com.yao.ssm.service.StuService;
import com.yao.ssm.service.TeaService;
import com.yao.ssm.util.CurrentDate;
import com.yao.ssm.util.MapUtil;
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
 * @create 2019-06-08 14:17
 */
@Controller
@RequestMapping("/ReplyArticleController")
public class ReplyArticleController {
    @Autowired
    private ReplyArticleService replyArticleService;
    @Autowired
    private StuService stuService;
    @Autowired
    private TeaService teaService;
    @ResponseBody
    @RequestMapping(value = "/insert",method = RequestMethod.POST)
    public Map<String,Object> insert(ReplyArticle replyArticle) throws Exception {
        System.out.println(replyArticle);
        replyArticle.setTime(CurrentDate.currentDate());
        String str = replyArticle.getContent();
        int begin = str.indexOf("@");
        int last = str.indexOf(" ");
        if(begin == 0){
            String str1 = str.substring(begin,last);
            replyArticle.setContent(str.substring(last+1,str.length()));
            Stu stu =stuService.findBySno(replyArticle.getNo());
            if(stu !=null){
                replyArticle.setPeoToPeo(stu.getSname()+str1);
            }else{
                replyArticle.setPeoToPeo(teaService.findByTno(replyArticle.getNo()).getTname()+str1);
            }
            System.out.println(replyArticle);
            replyArticleService.insertReply(replyArticle);
        }else {
            replyArticleService.insert(replyArticle);
        }
        return MapUtil.returnMap();
    }
    @ResponseBody
    @RequestMapping(value = "/findById",method = RequestMethod.POST)
    public Map<String,Object> findById(HttpServletRequest request)throws Exception{
        Map<String,Object> map = new HashMap<>();
        int id = Integer.parseInt(request.getParameter("id"));
        List<ReplyArticle> list = replyArticleService.findByArticleId(id);
        List<ReplyArticle> list1 = new ArrayList<>();
        List<List> listList = new ArrayList<>();
        List list2 = new ArrayList<>();
        List list4 = new ArrayList();
        for(ReplyArticle replyArticle : list){
            Stu stu = stuService.findBySno(replyArticle.getNo());
            if(stu != null){
                list2.add(stu);
                map.put("code",1);
            }else{
                list2.add(teaService.findByTno(replyArticle.getNo()));
                map.put("code",2);
            }
            list1 = replyArticleService.findBySourceId(replyArticle.getId());
            listList.add(list1);
            for(ReplyArticle replyArticle1 : list1){
                Stu stu1 = stuService.findBySno(replyArticle1.getNo());
                if(stu1!=null){
                    list4.add(stu1);
                    map.put("code2",1);
                }else{
                    list4.add(teaService.findByTno(replyArticle.getNo()));
                    map.put("code2",2);
                }
            }
        }
        map.put("list",list);
        map.put("listList",listList);
        map.put("list2",list2);
        map.put("list4",list4);
        return map;
    }
}
