package com.otoko.startergecco.csdn;

import com.otoko.startergeccocontroller.annotation.HtmlField;
import com.otoko.startergeccocontroller.spider.HrefBean;
import com.otoko.startergeccocontroller.spider.HtmlBean;

import java.util.List;

public class CsdnLeaf implements HtmlBean{

    private static final long serialVersionUID = -1L;

    @HtmlField(cssPath = "#content_views > p:nth-child(2) > font > b > a")
    private List<HrefBean> hrefBeanList;

    public List<HrefBean> getHrefBeanList() {
        return hrefBeanList;
    }

    public void setHrefBeanList(List<HrefBean> hrefBeanList) {
        this.hrefBeanList = hrefBeanList;
    }
}
