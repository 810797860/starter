package com.otoko.startergecco.downloader;

import com.otoko.startergecco.request.HttpRequest;
import com.otoko.startergecco.response.HttpResponse;

public interface AfterDownload {
	
	void process(HttpRequest request, HttpResponse response);

}
