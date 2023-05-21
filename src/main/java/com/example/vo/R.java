package com.example.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class R {
    private Integer code;
    private String message;
    private Object data;

    public static R ok(Object data){
        return new R(0, "成功",data);
    }

    public static R fail(String message){
        return new R(-1, message,null);
    }
}
