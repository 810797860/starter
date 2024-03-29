package com.otoko.starteradminservice.service.admin.business;

import com.otoko.starteradminentity.entity.admin.business.OperationLog;
import com.otoko.startercommon.base.BaseService.BaseService;

import java.util.List;
import java.util.Map;

/**
 * @author zhangjk
 * @description : OperationLog 服务接口
 * ---------------------------------
 * @since 2018-10-28
 */
public interface OperationLogService extends BaseService<OperationLog> {

    /**
     * 根据id进行假删除
     *
     * @param operationLogId
     * @return
     */
    boolean fakeDeleteById(Long operationLogId);

    /**
     * 根据ids进行批量假删除
     *
     * @param operationLogIds
     * @return
     */
    boolean fakeBatchDelete(List<Long> operationLogIds);

    /**
     * 获取Map数据（Obj）
     *
     * @param operationLogId
     * @return
     */
    Map<String, Object> selectMapById(Long operationLogId);

    /**
     * 新增或修改operationLog
     *
     * @param operationLog
     * @return
     */
    OperationLog operationLogCreateUpdate(OperationLog operationLog);

}
