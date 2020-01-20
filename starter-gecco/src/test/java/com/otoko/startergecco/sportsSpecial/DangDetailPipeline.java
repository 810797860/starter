package com.otoko.startergecco.sportsSpecial;

import com.otoko.startergecco.StarterGeccoApplicationTests;
import com.otoko.startergecco.annotation.PipelineName;
import com.otoko.startergecco.pipeline.Pipeline;

@PipelineName("sportsSpecialDetailPipeline")
public class DangDetailPipeline implements Pipeline<DangDetail>{

    @Override
    public void process(DangDetail dangDetail) {
        StarterGeccoApplicationTests.insertSportsSpecial(dangDetail);
    }
}
