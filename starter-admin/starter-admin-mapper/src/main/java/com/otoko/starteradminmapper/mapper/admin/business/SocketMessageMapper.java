package com.otoko.starteradminmapper.mapper.admin.business;

import com.otoko.starteradminentity.entity.admin.business.SocketMessage;
import com.otoko.startercommon.base.BaseDao.BaseDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * @author zhangjk
 * @description : SocketMessageMapper 接口
 * ---------------------------------
 * @since 2018-12-25
 */
@Repository
public interface SocketMessageMapper extends BaseDao<SocketMessage> {

    /**
     * 获取Map数据（Obj）
     * 自定化MapSql到MysqlGenerator生成
     *
     * @param socketMessageId
     * @return
     */
    Map<String, Object> selectMapById(@Param("socketMessageId") Long socketMessageId);
}