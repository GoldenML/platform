package com.yao.ssm.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * @author shkstart
 * @create 2019-05-17 14:25
 */
@Controller
@RequestMapping("/EmployeeHandler")
public class EmployeeHandler {
    @RequestMapping("/testDownloadFile")
    public ResponseEntity<byte[]> testDownloadFile(HttpSession session) throws IOException {
        System.out.println("testDownloadFile");
        byte[] body = {1,2,3};


        HttpHeaders headers = new HttpHeaders();
        //headers.add("Content-Disposition", "attachment;filename=abc.txt");
        headers.setContentDispositionFormData("attachment", "abc.txt");
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        ResponseEntity<byte[]> responseEntity = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);

        return responseEntity;
    }

    public void read() throws IOException {
        File file = new File("abc.txt");
        if(file.exists()) {
            System.out.println(file.getAbsolutePath());
        } else {
            file.createNewFile();
        }
        InputStream inputStream = new FileInputStream("abc.txt");
    }
}
