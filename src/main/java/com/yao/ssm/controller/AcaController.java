package com.yao.ssm.controller;

import com.yao.ssm.po.Aca;
import com.yao.ssm.service.AcaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author shkstart
 * @create 2019-05-09 16:49
 */
@Controller
@RequestMapping("/AcaController")
public class AcaController {
    @Autowired
    private AcaService acaService;
    @ResponseBody
    @RequestMapping(value = "/findAllAca",method = RequestMethod.GET)
    public List<Aca> findAllAca()throws Exception{
        List<Aca> lists = acaService.findAllAca();
        return lists;
    }
}
