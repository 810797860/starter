package com.otoko.startergecco.pipeline;

import com.otoko.startergecco.spider.SpiderBean;

public interface PipelineFactory {
	
	public Pipeline<? extends SpiderBean> getPipeline(String name);

}
