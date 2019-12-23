package com.otoko.startergecco.sportsSpecial;

import com.otoko.startergecco.startergeccoApplicationTests;
import com.otoko.startergecco.annotation.PipelineName;
import com.otoko.startergecco.pipeline.Pipeline;

@PipelineName("sportsSpecialDetailPipeline")
public class DangDetailPipeline implements Pipeline<DangDetail>{

    @Override
    public void process(DangDetail dangDetail) {
        startergeccoApplicationTests.insertSportsSpecial(dangDetail);
    }
}
