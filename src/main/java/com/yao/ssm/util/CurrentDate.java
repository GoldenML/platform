package com.yao.ssm.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author shkstart
 * @create 2019-05-20 10:27
 */
public class CurrentDate {
    public static String currentDate(){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        return format.format(date);
    }
}
