package com.otoko.startergecco.sportsSpecial;

import com.otoko.startergecco.annotation.HtmlField;
import com.otoko.startergecco.annotation.JSONPath;
import com.otoko.startergecco.spider.HtmlBean;
import com.otoko.startergecco.spider.JsonBean;

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
