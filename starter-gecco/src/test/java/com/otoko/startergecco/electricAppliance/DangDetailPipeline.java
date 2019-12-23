package com.otoko.startergecco.electricAppliance;

import com.otoko.startergecco.startergeccoApplicationTests;
import com.otoko.startergecco.annotation.PipelineName;
import com.otoko.startergecco.pipeline.Pipeline;

@PipelineName("electricApplianceDetailPipeline")
public class DangDetailPipeline implements Pipeline<DangDetail>{

    @Override
    public void process(DangDetail dangDetail) {
        startergeccoApplicationTests.insertElectricAppliance(dangDetail);
    }
}
