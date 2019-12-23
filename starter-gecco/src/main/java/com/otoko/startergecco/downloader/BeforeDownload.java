package com.otoko.startergecco.downloader;

import com.otoko.startergecco.request.HttpRequest;

public interface BeforeDownload {
	
	public void process(HttpRequest request);

}
