package com.otoko.startergecco.bookLibrary;

import com.otoko.startergeccocontroller.starterGeccoControllerApplicationTests;
import com.otoko.startergeccocontroller.annotation.PipelineName;
import com.otoko.startergeccocontroller.pipeline.Pipeline;

@PipelineName("bookLibraryDetailPipeline")
public class DangDetailPipeline implements Pipeline<DangDetail>{

    @Override
    public void process(DangDetail dangDetail) {
        starterGeccoControllerApplicationTests.insertBookLibrary(dangDetail);
    }
}
