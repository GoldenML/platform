package com.yao.ssm.controller;

import org.junit.Test;

import java.io.IOException;

/**
 * @author shkstart
 * @create 2019-05-17 14:49
 */
public class EmployeeHandlerTest {

    @Test
    public void readTest() {
        EmployeeHandler employeeHandler = new EmployeeHandler();
        try {
            employeeHandler.read();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
