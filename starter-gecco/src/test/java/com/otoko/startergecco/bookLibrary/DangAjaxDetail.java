package com.otoko.startergecco.bookLibrary;

import com.otoko.startergeccocontroller.annotation.JSONPath;
import com.otoko.startergeccocontroller.spider.JsonBean;

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
