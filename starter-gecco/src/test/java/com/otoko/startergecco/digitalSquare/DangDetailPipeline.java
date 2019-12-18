package com.otoko.startergecco.digitalSquare;

import com.otoko.startergeccocontroller.starterGeccoControllerApplicationTests;
import com.otoko.startergeccocontroller.annotation.PipelineName;
import com.otoko.startergeccocontroller.pipeline.Pipeline;

@PipelineName("digitalSquareDetailPipeline")
public class DangDetailPipeline implements Pipeline<DangDetail>{

    @Override
    public void process(DangDetail dangDetail) {
        starterGeccoControllerApplicationTests.insertDigitalSquare(dangDetail);
    }
}
