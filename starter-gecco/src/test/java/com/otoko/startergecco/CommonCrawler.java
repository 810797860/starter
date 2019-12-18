package com.otoko.startergecco;

import com.otoko.startergeccocontroller.annotation.Gecco;
import com.otoko.startergeccocontroller.annotation.HtmlField;
import com.otoko.startergeccocontroller.annotation.Request;
import com.otoko.startergeccocontroller.annotation.Text;
import com.otoko.startergeccocontroller.request.HttpRequest;
import com.otoko.startergeccocontroller.spider.HtmlBean;

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
		.classpath("com.otoko.startergeccocontroller.demo")
		.start("https://www.baidu.com/")
		.interval(2000)
		.start();
	}
}
