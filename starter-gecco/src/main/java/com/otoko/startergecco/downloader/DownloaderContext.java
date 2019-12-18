package com.otoko.startergecco.downloader;

import com.otoko.startergeccocontroller.request.HttpRequest;
import com.otoko.startergeccocontroller.response.HttpResponse;
import com.otoko.startergeccocontroller.spider.SpiderBeanContext;
import com.otoko.startergeccocontroller.spider.SpiderThreadLocal;

/**
 * 获得当前线程，正在抓取的SpiderBean的下载器
 * 
 * @author huchengyi
 *
 */
public class DownloaderContext {
	
	public static HttpResponse download(HttpRequest request) throws DownloadException {
		SpiderBeanContext context = SpiderThreadLocal.get().getSpiderBeanContext();
		return context.getDownloader().download(request, context.getTimeout());
	}
	
	public static HttpResponse defaultDownload(HttpRequest request) throws DownloadException {
		SpiderBeanContext context = SpiderThreadLocal.get().getSpiderBeanContext();
		Downloader downloader = SpiderThreadLocal.get().getEngine().getSpiderBeanFactory().getDownloaderFactory().defaultDownloader();
		return downloader.download(request, context.getTimeout());
	}
	

}
