package com.otoko.startergecco.downloader;

import com.otoko.startergeccocontroller.request.HttpRequest;
import com.otoko.startergeccocontroller.response.HttpResponse;

public interface AfterDownload {
	
	public void process(HttpRequest request, HttpResponse response);

}
