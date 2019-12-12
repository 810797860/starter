package com.otoko.startergecco.sogouwx;

import com.secondhand.tradingplatformgeccocontroller.annotation.GeccoClass;
import com.secondhand.tradingplatformgeccocontroller.downloader.BeforeDownload;
import com.secondhand.tradingplatformgeccocontroller.request.HttpRequest;

@GeccoClass(Article.class)
public class BeforeArticleDownloader implements BeforeDownload {

	@Override
	public void process(HttpRequest request) {
		request.clearCookie();
		request.clearHeader();
	}

}
