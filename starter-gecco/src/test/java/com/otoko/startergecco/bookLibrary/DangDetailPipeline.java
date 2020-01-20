package com.otoko.startergecco.bookLibrary;

import com.otoko.startergecco.StarterGeccoApplicationTests;
import com.otoko.startergecco.annotation.PipelineName;
import com.otoko.startergecco.pipeline.Pipeline;

@PipelineName("bookLibraryDetailPipeline")
public class DangDetailPipeline implements Pipeline<DangDetail>{

    @Override
    public void process(DangDetail dangDetail) {
        StarterGeccoApplicationTests.insertBookLibrary(dangDetail);
    }
}
