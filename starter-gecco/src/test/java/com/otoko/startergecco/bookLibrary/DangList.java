package com.otoko.startergecco.bookLibrary;

import com.otoko.startergeccocontroller.annotation.HtmlField;
import com.otoko.startergeccocontroller.spider.HrefBean;
import com.otoko.startergeccocontroller.spider.HtmlBean;

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
