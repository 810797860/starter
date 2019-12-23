package com.otoko.startergecco.bookLibrary;

import com.otoko.startergecco.annotation.JSONPath;
import com.otoko.startergecco.spider.JsonBean;

public class DangAjaxDetail implements JsonBean{

    private static final long serialVersionUID = -1L;

    @JSONPath("$.data.html")
    private String detail;

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
