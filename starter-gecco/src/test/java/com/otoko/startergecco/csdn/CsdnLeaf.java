package com.otoko.startergecco.csdn;

import com.otoko.startergecco.annotation.HtmlField;
import com.otoko.startergecco.annotation.Text;
import com.otoko.startergecco.spider.HrefBean;
import com.otoko.startergecco.spider.HtmlBean;

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
