package com.otoko.startergecco.spider.render;

import com.otoko.startergecco.spider.SpiderThreadLocal;

public class RenderContext {
	
	public static Render getRender(RenderType type){
		return SpiderThreadLocal.get().getEngine().getSpiderBeanFactory().getRenderFactory().getRender(type);
	}

}
