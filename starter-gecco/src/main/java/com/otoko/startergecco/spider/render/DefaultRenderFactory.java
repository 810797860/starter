package com.otoko.startergecco.spider.render;

import com.otoko.startergecco.spider.render.html.HtmlRender;
import com.otoko.startergecco.spider.render.json.JsonRender;
import org.reflections.Reflections;

public class DefaultRenderFactory extends RenderFactory {
	
	public DefaultRenderFactory(Reflections reflections) {
		super(reflections);
	}

	public HtmlRender createHtmlRender() {
		return new HtmlRender();
	}
	
	public JsonRender createJsonRender() {
		return new JsonRender();
	}
	
}
