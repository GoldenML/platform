package com.yao.ssm.controller;

import com.yao.ssm.po.Aca;
import com.yao.ssm.po.Major;
import com.yao.ssm.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author shkstart
 * @create 2019-05-10 11:53
 */
@Controller
@RequestMapping("/MajorController")
public class MajorController {
    @Autowired
    private MajorService majorService;
    @ResponseBody
    @RequestMapping(value = "/findAllMajor",method = RequestMethod.GET)
    public List<Major> findByAca_id(Major major)throws Exception{
        List<Major> lists = majorService.findByAca_id(major.getAca_id());
        return lists;
    }
}
