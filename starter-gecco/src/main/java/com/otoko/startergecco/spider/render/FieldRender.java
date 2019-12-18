package com.otoko.startergecco.spider.render;

import com.otoko.startergeccocontroller.request.HttpRequest;
import com.otoko.startergeccocontroller.response.HttpResponse;
import com.otoko.startergeccocontroller.spider.SpiderBean;
import net.sf.cglib.beans.BeanMap;

public interface FieldRender {
	
	public void render(HttpRequest request, HttpResponse response, BeanMap beanMap, SpiderBean bean);

}
