package com.otoko.startergecco.ajax;

import com.alibaba.fastjson.JSONObject;
import com.otoko.startergecco.annotation.JSONPath;
import com.otoko.startergecco.spider.JsonBean;

import java.util.List;

public class JDad implements JsonBean {

	private static final long serialVersionUID = 2250225801616402995L;

	@JSONPath("$.ads[0].ad")
	private String ad;

	@JSONPath("$.ads")
	private List<JSONObject> ads;
	
	public String getAd() {
		return ad;
	}

	public void setAd(String ad) {
		this.ad = ad;
	}
	
	public List<JSONObject> getAds() {
		return ads;
	}

	public void setAds(List<JSONObject> ads) {
		this.ads = ads;
	}

}
