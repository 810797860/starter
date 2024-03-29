package com.otoko.startergecco.electricAppliance;

import com.otoko.startergecco.annotation.HtmlField;
import com.otoko.startergecco.spider.HrefBean;
import com.otoko.startergecco.spider.HtmlBean;

import java.util.List;

public class DangList implements HtmlBean{

    private static final long serialVersionUID = -1L;

    @HtmlField(cssPath = "li p a")
    private List<HrefBean> hrefBeanList;

    public List<HrefBean> getHrefBeanList() {
        return hrefBeanList;
    }

    public void setHrefBeanList(List<HrefBean> hrefBeanList) {
        this.hrefBeanList = hrefBeanList;
    }
}
