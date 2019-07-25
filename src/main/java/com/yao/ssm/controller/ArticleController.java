package com.yao.ssm.controller;

import com.yao.ssm.po.Article;
import com.yao.ssm.po.Collect;
import com.yao.ssm.po.StuBad;
import com.yao.ssm.po.StuPraise;
import com.yao.ssm.service.ArticleService;
import com.yao.ssm.service.CollectService;
import com.yao.ssm.service.StuBadService;
import com.yao.ssm.service.StuPraiseService;
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
 * @create 2019-05-22 8:59
 */
@Controller
@RequestMapping("/ArticleController")
public class ArticleController {
    @Autowired
    private ArticleService articleService;
    @Autowired
    private StuPraiseService stuPraiseService;
    @Autowired
    private StuBadService stuBadService;
    @Autowired
    private CollectService collectService;
    @ResponseBody
    @RequestMapping(value = "/insert",method = RequestMethod.POST)
    public Map<String,Object> insert(Article article, HttpServletRequest request){
//        int tno = Integer.parseInt(request.getParameter("tno"));
//        System.out.println(tno);
//        System.out.println(article);
        article.setUploadDate(CurrentDate.currentDate());
//        article.setTno(tno);
        Map<String,Object> map = new HashMap<>();
        try {
            articleService.insert(article);
            map.put("code",1);
            int id = article.getId();
            System.out.println("articleId:"+id);
            map.put("id",id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    public Map<String,Object> upload(Article article , HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        article.setStatus(1);
        if(request.getParameter("articleId") == null || request.getParameter("articleId") ==""){
            article.setUploadDate(CurrentDate.currentDate());
            try {
                articleService.insert(article);
                int id = article.getId();
                map.put("id",id);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }else{
            int id = Integer.parseInt(request.getParameter("articleId"));
            String title = article.getTitle() ;
            String content = article.getContent();
            try {
                articleService.update(id,title,content);
                map.put("id",id);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        map.put("code",1);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/findArticle",method = RequestMethod.POST)
    public Map<String,Object> findArticle(PageUtil pageUtil,HttpServletRequest request) throws Exception {
        int tno = Integer.parseInt(request.getParameter("tno"));
        System.out.println(pageUtil.getCurrentPage());
        List<Article> list = null;
        list = articleService.findByTno(tno,pageUtil.getPageSize()*(pageUtil.getCurrentPage()-1),pageUtil.getPageSize());
        int count = articleService.findCountByTno(tno);
        Map<String,Object> map = new HashMap<String,Object>();
        map = MapUtil.returnMap(count,pageUtil.getCurrentPage(),pageUtil.getPageSize());
        map.put("list",list);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/findAllArticle",method = RequestMethod.POST)
    public Map<String,Object> findAllArticle(PageUtil pageUtil,HttpServletRequest request){
        int currentPage = pageUtil.getCurrentPage();
        int pageSize = pageUtil.getPageSize();
        List<Article> list = null;
        try {
            list = articleService.findAllArticle((currentPage-1)*pageSize,pageSize);
        } catch (Exception e) {
            e.printStackTrace();
        }
        int count = 0;
        try {
            count = articleService.findArticleCount();
        } catch (Exception e) {
            e.printStackTrace();
        }
        Map<String,Object> map = new HashMap<String,Object>();
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
    @RequestMapping(value = "/findById",method = RequestMethod.POST)
    public  Map<String,Object> findById(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        Map<String,Object> map = new HashMap<String,Object>();
        Article article = null;
        try {
            article = articleService.findById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        map.put("article2",article);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/addPraiseNum",method = RequestMethod.POST)
    public  Map<String,Object> addPraiseNum(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        int sno = Integer.parseInt(request.getParameter("sno"));
        Map<String,Object> map = new HashMap<String,Object>();
        StuBad stuBad = null;
        try {
            stuBad = stuBadService.find(sno,id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(stuBad != null){
            map.put("code",1);
            return map;
        }

        StuPraise stuPraise = null;
        try {
            stuPraise = stuPraiseService.find(sno,id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if(stuPraise == null){
            try {
                articleService.addPraiseNum(id);
                stuPraiseService.insert(sno,id);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }else{
            try {
                stuPraiseService.delete(stuPraise.getId());
                articleService.decPraiseNum(id);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        Article article = null;
        try {
            article = articleService.findById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        map.put("article3",article);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/addBadNum",method = RequestMethod.POST)
    public  Map<String,Object> addBadNum(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        int sno = Integer.parseInt(request.getParameter("sno"));
        Map<String,Object> map = new HashMap<String,Object>();

        StuPraise stuPraise = null;
        try {
            stuPraise = stuPraiseService.find(sno,id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(stuPraise != null){
            map.put("code",1);
            return map;
        }

        StuBad stuBad = null;
        try {
            stuBad = stuBadService.find(sno,id);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("没有找到");
        }

        if(stuBad == null){
            try {
                articleService.addBadNum(id);
                stuBadService.insert(sno,id);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }else{
            try {
                stuBadService.delete(stuBad.getId());
                articleService.decBadNum(id);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }


        Article article = null;
        try {
            article = articleService.findById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        map.put("article3",article);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/addLookNum",method = RequestMethod.POST)
    public  Map<String,Object> addLookNum(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));

        Map<String,Object> map = new HashMap<String,Object>();
        try {
            articleService.addLookNum(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        Article article = null;
        try {
            article = articleService.findById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        map.put("article4",article);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/addCollNum",method = RequestMethod.POST)
    public  Map<String,Object> addCollNum(Collect collect,HttpServletRequest request){
        int id = collect.getArticle_id();
        int sno = collect.getSno();
        Map<String,Object> map = new HashMap<String,Object>();

        Collect collect1 = null;
        try {
            collect1 = collectService.find(sno,id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(collect1 == null){
            try {
                articleService.addCollNum(id);
                collect.setCol_date(CurrentDate.currentDate());
                collectService.insert(collect);
                map.put("code",1);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else{
            try {
                collectService.delete(collect1.getId());
                articleService.decCollNum(id);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }


        Article article = null;
        try {
            article = articleService.findById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        map.put("article5",article);

        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/findBySno",method = RequestMethod.POST)
    public Map<String,Object> findBySno(PageUtil pageUtil, HttpServletRequest request)throws Exception{
        Map<String,Object> map = null;
        int sno = Integer.parseInt(request.getParameter("sno"));
        int currentPage = pageUtil.getCurrentPage();
        int pageSize= pageUtil.getPageSize();
        List<Collect> list = collectService.findBySno(sno,pageSize*(currentPage-1),pageSize);
        List<Article> list1 = new ArrayList<Article>();
        for (Collect c : list){
            list1.add(articleService.findById(c.getArticle_id()));
        }

        int count = collectService.findCountBySno(sno);
        map = MapUtil.returnMap(count,currentPage,pageSize);
        map.put("list",list1);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/cancelCol",method = RequestMethod.POST)
    public Map<String,Object> cancelCol(Collect collect)throws Exception{
        collectService.deleteBySno(collect.getSno(),collect.getArticle_id());
        articleService.decCollNum(collect.getArticle_id());
        return MapUtil.returnMap();
    }
    @ResponseBody
    @RequestMapping(value = "/deleteArticle",method = RequestMethod.POST)
    public Map<String,Object> deleteArticle(HttpServletRequest request) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        articleService.deleteById(id);
        return MapUtil.returnMap();
    }
}
