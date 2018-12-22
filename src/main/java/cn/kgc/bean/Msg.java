package cn.kgc.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {
    //表示状态  100  成功     200 失败
    private int code;
    //显示的信息
    private String msg;
    private Map<String,Object> extend=new HashMap<String, Object>();

    public Msg() {

    }

    public Msg(int code, String msg, Map<String, Object> extend) {
        this.code = code;
        this.msg = msg;
        this.extend = extend;
    }


    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }


    public static Msg success(){
        Msg result=new Msg();
        result.setCode(100);
        result.setMsg("操作成功");
        return result;
    }

    public static Msg fail(){
        Msg result =new Msg();
        result.setCode(200);
        result.setMsg("操作失败");
        return result;
    }

    public Msg add(String key,Object value){
        this.getExtend().put(key,value);
        return this;
    }
}
