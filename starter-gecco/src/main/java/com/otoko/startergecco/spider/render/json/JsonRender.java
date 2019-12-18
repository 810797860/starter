package com.otoko.startergecco.spider.render.json;

import com.otoko.startergeccocontroller.request.HttpRequest;
import com.otoko.startergeccocontroller.response.HttpResponse;
import com.otoko.startergeccocontroller.spider.SpiderBean;
import com.otoko.startergeccocontroller.spider.render.AbstractRender;
import net.sf.cglib.beans.BeanMap;

/**
 * 将下载下来的json映射到bean中
 * 
 * @author huchengyi
 *
 */
public class JsonRender extends AbstractRender {
	
	private JsonFieldRender jsonFieldRender;
	
	public JsonRender() {
		super();
		this.jsonFieldRender = new JsonFieldRender();
	}

	@Override
	public void fieldRender(HttpRequest request, HttpResponse response, BeanMap beanMap, SpiderBean bean) {
		jsonFieldRender.render(request, response, beanMap, bean);
	}

}