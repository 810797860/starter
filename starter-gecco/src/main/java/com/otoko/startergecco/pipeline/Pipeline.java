package com.otoko.startergecco.pipeline;

import com.otoko.startergecco.spider.SpiderBean;

public interface Pipeline<T extends SpiderBean> {

	public void process(T bean);

}
