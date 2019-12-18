package com.otoko.startergecco.pipeline;

import com.otoko.startergeccocontroller.spider.SpiderBean;

public interface PipelineFactory {
	
	public Pipeline<? extends SpiderBean> getPipeline(String name);

}
