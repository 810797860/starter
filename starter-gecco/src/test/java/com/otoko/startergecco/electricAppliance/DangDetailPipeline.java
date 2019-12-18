package com.otoko.startergecco.electricAppliance;

import com.otoko.startergeccocontroller.starterGeccoControllerApplicationTests;
import com.otoko.startergeccocontroller.annotation.PipelineName;
import com.otoko.startergeccocontroller.pipeline.Pipeline;

@PipelineName("electricApplianceDetailPipeline")
public class DangDetailPipeline implements Pipeline<DangDetail>{

    @Override
    public void process(DangDetail dangDetail) {
        starterGeccoControllerApplicationTests.insertElectricAppliance(dangDetail);
    }
}
