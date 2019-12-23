package com.otoko.startergecco.listener;

import com.otoko.startergecco.GeccoEngine;

/**
 * 简单的引擎时间兼容实现类，可以继承该类覆盖需要的方法
 * 
 * @author LiuJunGuang
 */
public abstract class SimpleEventListener implements EventListener {

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.otoko.startergecco.listener.EventListener#onStart(com.otoko.startergecco.GeccoEngine)
	 */
	@Override
	public void onStart(GeccoEngine ge) {
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.otoko.startergecco.listener.EventListener#onPause(com.otoko.startergecco.GeccoEngine)
	 */
	@Override
	public void onPause(GeccoEngine ge) {
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.otoko.startergecco.listener.EventListener#onRestart(com.otoko.startergecco.GeccoEngine)
	 */
	@Override
	public void onRestart(GeccoEngine ge) {
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.otoko.startergecco.listener.EventListener#onStop(com.otoko.startergecco.GeccoEngine)
	 */
	@Override
	public void onStop(GeccoEngine ge) {
	}

}
