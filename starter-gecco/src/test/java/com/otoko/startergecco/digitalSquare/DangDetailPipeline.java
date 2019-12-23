package com.otoko.startergecco.digitalSquare;

import com.otoko.startergecco.startergeccoApplicationTests;
import com.otoko.startergecco.annotation.PipelineName;
import com.otoko.startergecco.pipeline.Pipeline;

@PipelineName("digitalSquareDetailPipeline")
public class DangDetailPipeline implements Pipeline<DangDetail>{

    @Override
    public void process(DangDetail dangDetail) {
        startergeccoApplicationTests.insertDigitalSquare(dangDetail);
    }
}
