package com.otoko.startergecco.bookLibrary;

import com.otoko.startergecco.annotation.PipelineName;
import com.otoko.startergecco.pipeline.Pipeline;
import com.otoko.startergecco.request.HttpRequest;
import com.otoko.startergecco.spider.HrefBean;

import java.util.ArrayList;
import java.util.List;

@PipelineName("bookLibraryListPipeline")
public class DangListPipeline implements Pipeline<DangPage> {

    public static List<HttpRequest> httpRequests = new ArrayList<>();

    @Override
    public void process(DangPage dangPage) {
        List<DangList> dangList = dangPage.getDangLists();
        if (dangList == null){
            return;
        }
        for (DangList list : dangList){
            List<HrefBean> hrefBeans = list.getHrefBeanList();
            for (HrefBean hrefBean : hrefBeans){
                String url = hrefBean.getUrl();
                if (url.indexOf("http://product.dangdang.com") == -1){
                    continue;
                }
                HttpRequest httpRequest = dangPage.getRequest();
                httpRequests.add(httpRequest.subRequest(url));
            }
        }
    }
}
