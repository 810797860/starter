package com.otoko.startergecco.dynamic;

import com.alibaba.fastjson.JSONObject;
import com.otoko.startergecco.annotation.PipelineName;
import com.otoko.startergecco.pipeline.JsonPipeline;
import com.otoko.startergecco.request.HttpGetRequest;
import com.otoko.startergecco.request.HttpRequest;
import com.otoko.startergecco.scheduler.SchedulerContext;
import org.apache.commons.lang3.StringUtils;

@PipelineName("productListJsonPipeline")
public class ProductListJsonPipeline extends JsonPipeline {

	@Override
	public void process(JSONObject productList) {
		HttpRequest currRequest = HttpGetRequest.fromJson(productList.getJSONObject("request"));
		//下一页继续抓取
		int currPage = productList.getIntValue("currPage");
		int nextPage = currPage + 1;
		int totalPage = productList.getIntValue("totalPage");
		if(nextPage <= totalPage) {
			String nextUrl = "";
			String currUrl = currRequest.getUrl();
			if(currUrl.indexOf("page=") != -1) {
				nextUrl = StringUtils.replaceOnce(currUrl, "page=" + currPage, "page=" + nextPage);
			} else {
				nextUrl = currUrl + "&" + "page=" + nextPage;
			}
			SchedulerContext.into(currRequest.subRequest(nextUrl));
		}
	}

}
