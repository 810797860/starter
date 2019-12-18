package com.otoko.startergecco.electricAppliance;

import com.otoko.startergeccocontroller.annotation.HtmlField;
import com.otoko.startergeccocontroller.spider.HtmlBean;

public class DangAjaxDetail implements HtmlBean{

    private static final long serialVersionUID = -1L;

    @HtmlField(cssPath = "body > div.descrip")
    private String detail;

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
