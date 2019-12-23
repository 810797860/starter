package com.otoko.startergecco.pipeline;

import com.alibaba.fastjson.JSON;
import com.otoko.startergecco.annotation.PipelineName;
import com.otoko.startergecco.spider.SpiderBean;

@PipelineName("consolePipeline")
public class ConsolePipeline implements Pipeline<SpiderBean> {

	@Override
	public void process(SpiderBean bean) {
		System.out.println(JSON.toJSONString(bean));
	}

}
