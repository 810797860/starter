package com.otoko.startergecco.spider.render;

import com.otoko.startergecco.annotation.Request;
import com.otoko.startergecco.request.HttpRequest;
import com.otoko.startergecco.response.HttpResponse;
import com.otoko.startergecco.spider.SpiderBean;
import net.sf.cglib.beans.BeanMap;
import org.reflections.ReflectionUtils;

import java.lang.reflect.Field;
import java.util.Set;

public class RequestFieldRender implements FieldRender {

	@Override
	@SuppressWarnings({"unchecked" })
	public void render(HttpRequest request, HttpResponse response, BeanMap beanMap, SpiderBean bean) {
		Set<Field> requestFields = ReflectionUtils.getAllFields(bean.getClass(), ReflectionUtils.withAnnotation(Request.class));
		for(Field field : requestFields) {
			beanMap.put(field.getName(), request);
		}
	}
	
}
