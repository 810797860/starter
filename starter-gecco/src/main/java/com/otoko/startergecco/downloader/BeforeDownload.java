package com.otoko.startergecco.downloader;

import com.otoko.startergeccocontroller.request.HttpRequest;

public interface BeforeDownload {
	
	public void process(HttpRequest request);

}
