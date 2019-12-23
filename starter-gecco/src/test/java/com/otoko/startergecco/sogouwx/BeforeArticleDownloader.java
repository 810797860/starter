package com.otoko.startergecco.sogouwx;

import com.otoko.startergecco.annotation.GeccoClass;
import com.otoko.startergecco.downloader.BeforeDownload;
import com.otoko.startergecco.request.HttpRequest;

@GeccoClass(Article.class)
public class BeforeArticleDownloader implements BeforeDownload {

	@Override
	public void process(HttpRequest request) {
		request.clearCookie();
		request.clearHeader();
	}

}
