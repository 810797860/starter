package com.otoko.startergecco.utils;

import com.otoko.startergeccocontroller.spider.SpiderThreadLocal;

public class EngineRetUtil{

    public static Object getRet(){
        return SpiderThreadLocal.get().getEngine().getRet();
    }

    public static void setRet(Object o){
        SpiderThreadLocal.get().getEngine().setRet(o);
    }

}
