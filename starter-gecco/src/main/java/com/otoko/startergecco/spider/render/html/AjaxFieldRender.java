package com.otoko.startergecco.spider.render.html;

import com.otoko.startergecco.annotation.Ajax;
import com.otoko.startergecco.downloader.DownloadException;
import com.otoko.startergecco.downloader.DownloaderContext;
import com.otoko.startergecco.request.HttpRequest;
import com.otoko.startergecco.response.HttpResponse;
import com.otoko.startergecco.spider.JsonBean;
import com.otoko.startergecco.spider.SpiderBean;
import com.otoko.startergecco.spider.render.*;
import com.otoko.startergecco.utils.ReflectUtils;
import com.otoko.startergecco.utils.UrlMatcher;
import net.sf.cglib.beans.BeanMap;
import org.reflections.ReflectionUtils;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * 渲染@Ajax属性
 * 
 * @author huchengyi
 *
 */
public class AjaxFieldRender implements FieldRender {

	@Override
	@SuppressWarnings("unchecked")
	public void render(HttpRequest request, HttpResponse response, BeanMap beanMap, SpiderBean bean) {
		Map<String, Object> fieldMap = new HashMap<String, Object>();
		Set<Field> ajaxFields = ReflectionUtils.getAllFields(bean.getClass(), ReflectionUtils.withAnnotation(Ajax.class));
		for (Field ajaxField : ajaxFields) {
			Object value = injectAjaxField(request, beanMap, ajaxField);
			if(value != null) {
				fieldMap.put(ajaxField.getName(), value);
			}
		}
		beanMap.putAll(fieldMap);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	private Object injectAjaxField(HttpRequest request, BeanMap beanMap, Field field) {
		Class clazz = field.getType();
		// ajax的属性类型必须是spiderBean
		Ajax ajax = field.getAnnotation(Ajax.class);
		String url = ajax.url();
		url = UrlMatcher.replaceParams(url, request.getParameters());
		url = UrlMatcher.replaceFields(url, beanMap);
		HttpRequest subRequest = request.subRequest(url);
		HttpResponse subReponse = null;
		try {
			subReponse = DownloaderContext.download(subRequest);
			RenderType type = RenderType.HTML;
			if (ReflectUtils.haveSuperType(clazz, JsonBean.class)) {
				type = RenderType.JSON;
			}
			Render render = RenderContext.getRender(type);
			return render.inject(clazz, subRequest, subReponse);
		} catch (DownloadException ex) {
			//throw new FieldRenderException(field, ex.getMessage(), ex);
			FieldRenderException.log(field, ex.getMessage(), ex);
			return null;
		} finally {
			if(subReponse != null) {
				subReponse.close();
			}
		}
	}
}
