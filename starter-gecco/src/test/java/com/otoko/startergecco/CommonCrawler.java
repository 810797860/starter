package com.otoko.startergecco;

import com.otoko.startergecco.annotation.Gecco;
import com.otoko.startergecco.annotation.HtmlField;
import com.otoko.startergecco.annotation.Request;
import com.otoko.startergecco.annotation.Text;
import com.otoko.startergecco.request.HttpRequest;
import com.otoko.startergecco.spider.HtmlBean;

@Gecco(pipelines="consolePipeline")
public class CommonCrawler implements HtmlBean {

	private static final long serialVersionUID = -8870768223740844229L;

	@Request
	private HttpRequest request;
	
	@Text(own=false)
	@HtmlField(cssPath="body")
	private String body;

	public HttpRequest getRequest() {
		return request;
	}

	public void setRequest(HttpRequest request) {
		this.request = request;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}
	
	public static void main(String[] args) {
		GeccoEngine.create()
		.classpath("com.otoko.startergecco.demo")
		.start("https://www.baidu.com/")
		.interval(2000)
		.start();
	}
}
