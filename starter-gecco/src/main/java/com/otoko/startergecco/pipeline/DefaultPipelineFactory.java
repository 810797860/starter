package com.otoko.startergecco.pipeline;

import com.secondhand.tradingplatformgeccocontroller.annotation.PipelineName;
import com.secondhand.tradingplatformgeccocontroller.spider.SpiderBean;
import org.reflections.Reflections;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class DefaultPipelineFactory implements PipelineFactory {

	private Map<String, Pipeline<? extends SpiderBean>> pipelines;

	@SuppressWarnings({ "unchecked" })
	public DefaultPipelineFactory(Reflections reflections) {
		this.pipelines = new HashMap<String, Pipeline<? extends SpiderBean>>();
		Set<Class<?>> pipelineClasses = reflections.getTypesAnnotatedWith(PipelineName.class);
		for (Class<?> pipelineClass : pipelineClasses) {
			PipelineName spiderFilter = pipelineClass.getAnnotation(PipelineName.class);
			try {
				pipelines.put(spiderFilter.value(), (Pipeline<? extends SpiderBean>) pipelineClass.newInstance());
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
	}

	@Override
	public Pipeline<? extends SpiderBean> getPipeline(String name) {
		return pipelines.get(name);
	}

}
