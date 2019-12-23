package com.otoko.startergecco.jd;

import com.alibaba.fastjson.JSON;
import com.otoko.startergecco.annotation.FieldRenderName;
import com.otoko.startergecco.downloader.DownloaderContext;
import com.otoko.startergecco.request.HttpRequest;
import com.otoko.startergecco.response.HttpResponse;
import com.otoko.startergecco.spider.SpiderBean;
import com.otoko.startergecco.spider.render.CustomFieldRender;
import net.sf.cglib.beans.BeanMap;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.net.URLEncoder;
import java.util.List;

@FieldRenderName("jdPricesFieldRender")
public class JdPricesFieldRender implements CustomFieldRender {

	@Override
	public void render(HttpRequest request, HttpResponse response, BeanMap beanMap, SpiderBean bean, Field field) {
		ProductList jd = (ProductList)bean;
		StringBuffer sb = new StringBuffer();
		/*for(String code : jd.getCodes()) {
			sb.append("J_").append(code).append(",");
		}*/
		String skuIds = sb.toString();
		try {
			skuIds = URLEncoder.encode(skuIds, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String url = "http://p.3.cn/prices/mgets?skuIds="+skuIds;
		HttpRequest subRequest = request.subRequest(url);
		try {
			HttpResponse subReponse = DownloaderContext.download(subRequest);
			String json = subReponse.getContent();
			List<JDPrice> prices = JSON.parseArray(json, JDPrice.class);
			beanMap.put(field.getName(), prices);
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}


}
