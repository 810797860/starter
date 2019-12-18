package com.otoko.startergecco.monitor;

import com.otoko.startergeccocontroller.downloader.DownloadException;
import com.otoko.startergeccocontroller.downloader.DownloadServerException;
import com.otoko.startergeccocontroller.request.HttpRequest;
import net.sf.cglib.proxy.MethodInterceptor;
import net.sf.cglib.proxy.MethodProxy;

import java.lang.reflect.Method;

public class DownloadMointorIntercetor implements MethodInterceptor {

	@Override
	public Object intercept(Object obj, Method method, Object[] args, MethodProxy proxy) throws Throwable {
		if(method.getName().equals("download")) {
			HttpRequest request = (HttpRequest)args[0];
			try {
				Object o = proxy.invokeSuper(obj, args);
				DownloadMonitor.incrSuccess(request.getUrl());
				return o;
			} catch(DownloadServerException ex) {
				DownloadMonitor.incrServerError(request.getUrl());
				throw ex;
			} catch(DownloadException ex) {
				DownloadMonitor.incrException(request.getUrl());
				throw ex;
			}
			
		} else {
			return proxy.invokeSuper(obj, args);
		}
	}
}
