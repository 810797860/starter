package com.otoko.starteradminmapper.mapper.admin.business;

import com.otoko.starteradminentity.entity.admin.business.Annex;
import com.otoko.startercommon.base.BaseDao.BaseDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * @author zhangjk
 * @description : AnnexMapper 接口
 * ---------------------------------
 * @since 2018-12-14
 */
@Repository
public interface AnnexMapper extends BaseDao<Annex> {

    /**
     * 获取Map数据（Obj）
     * 自定化MapSql到MysqlGenerator生成
     *
     * @param annexId
     * @return
     */
    Map<String, Object> selectMapById(@Param("annexId") Long annexId);
}