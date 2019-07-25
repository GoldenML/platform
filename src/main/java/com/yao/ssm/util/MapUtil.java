package com.yao.ssm.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author shkstart
 * @create 2019-05-22 9:02
 */
public class MapUtil {
    public static Map<String,Object> returnMap(){
        Map<String,Object> map = new HashMap<>();
        map.put("code",1);
        return map;
    }
    public static Map<String,Object> returnMap(List<Object> list){
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("list",list);
        return map;
    }
    public static Map<String,Object> returnMap(List<Object> list,String ...string){
        Map<String,Object> map = new HashMap<>();
        String[] s = new String[string.length];
        for(String str : s){
            map.put(str,str);
        }
        map.put("list",list);
        return map;
    }
    public static Map<String,Object> returnMap(List<Object> list,int ...ints){
        Map<String,Object> map = new HashMap<>();
        int[] ints1 = new int[ints.length];
        for(int ints2 : ints1){
            map.put(String.valueOf(ints2),ints2);
        }
        map.put("list",list);
        return map;
    }
    public static Map<String,Object> returnMap(int count ,int currentPage, int pageSize){
        Map<String,Object> map = new HashMap<>();
        int totlePageSize = count / pageSize;
        if (count % pageSize != 0) {
            totlePageSize++;
        }
        map.put("count",count);
        map.put("totlePageSize",totlePageSize);
        map.put("currentPage",currentPage);
        return map;
    }
}
