package com.otoko.startergecco.pipeline;

import com.secondhand.tradingplatformgeccocontroller.spider.SpiderBean;

public interface Pipeline<T extends SpiderBean> {

	public void process(T bean);

}
