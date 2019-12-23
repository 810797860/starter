package com.otoko.startergecco.bookLibrary;

import com.otoko.startergecco.GeccoEngine;
import com.otoko.startergecco.annotation.Gecco;
import com.otoko.startergecco.annotation.HtmlField;
import com.otoko.startergecco.annotation.Request;
import com.otoko.startergecco.request.HttpGetRequest;
import com.otoko.startergecco.request.HttpRequest;
import com.otoko.startergecco.spider.HtmlBean;

import java.util.List;

@Gecco(matchUrl = "http://book.dangdang.com/", pipelines = {"consolePipeline", "bookLibraryListPipeline"})
public class DangPage implements HtmlBean{

    private static final long serialVersionUID = -1L;

    @Request
    private HttpRequest request;

    //列表页
    @HtmlField(cssPath = "#bd_auto")
    private List<DangList> dangLists;

    public HttpRequest getRequest() {
        return request;
    }

    public void setRequest(HttpRequest request) {
        this.request = request;
    }

    public List<DangList> getDangLists() {
        return dangLists;
    }

    public void setDangLists(List<DangList> dangLists) {
        this.dangLists = dangLists;
    }

    public static void main(String[] args){

        HttpGetRequest httpGetRequest = new HttpGetRequest("http://book.dangdang.com/");
        httpGetRequest.setCharset("GBK");
        GeccoEngine.create()
                .classpath("com.otoko.startergecco.bookLibrary")
                .start(httpGetRequest)
                .thread(1)
                .interval(4000)
                .run();

        GeccoEngine.create()
                .classpath("com.otoko.startergecco.bookLibrary")
                .start(DangListPipeline.httpRequests)
                .thread(1)
                .interval(4000)
                .run();
    }
}