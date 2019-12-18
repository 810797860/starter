package com.otoko.startergecco.sogouwx;

import com.otoko.startergeccocontroller.annotation.GeccoClass;
import com.otoko.startergeccocontroller.downloader.BeforeDownload;
import com.otoko.startergeccocontroller.request.HttpRequest;

@GeccoClass(Article.class)
public class BeforeArticleDownloader implements BeforeDownload {

	@Override
	public void process(HttpRequest request) {
		request.clearCookie();
		request.clearHeader();
	}

}
