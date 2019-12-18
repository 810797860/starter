package com.otoko.startergecco.images;

import com.otoko.startergeccocontroller.GeccoEngine;
import com.otoko.startergeccocontroller.annotation.Gecco;
import com.otoko.startergeccocontroller.annotation.HtmlField;
import com.otoko.startergeccocontroller.annotation.Image;
import com.otoko.startergeccocontroller.annotation.PipelineName;
import com.otoko.startergeccocontroller.pipeline.Pipeline;
import com.otoko.startergeccocontroller.spider.HtmlBean;

import java.util.List;

@PipelineName("imageListDemo")
@Gecco(matchUrl = "http://canlian.jiading.gov.cn/gyzc/zcxmdt/content_430614", pipelines = "imageListDemo")
public class ImageListDemo implements HtmlBean, Pipeline<ImageListDemo> {

	private static final long serialVersionUID = -5583524962096502124L;
	
	@Image
	@HtmlField(cssPath = ".conTxt p img")
	public List<String> pics;

	public List<String> getPics() {
		return pics;
	}

	public void setPics(List<String> pics) {
		this.pics = pics;
	}

	@Override
	public void process(ImageListDemo test) {
		System.out.println(test.getPics());
	}

	public static void main(String[] args) {
        GeccoEngine.create()
                .classpath("com.otoko.startergeccocontroller.demo.images")
                .start("http://canlian.jiading.gov.cn/gyzc/zcxmdt/content_430614")
                .interval(1000)
                .run();
	}
}
