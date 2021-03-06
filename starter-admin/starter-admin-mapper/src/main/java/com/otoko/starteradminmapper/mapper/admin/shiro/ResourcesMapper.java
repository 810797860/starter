package com.otoko.starteradminmapper.mapper.admin.shiro;

import com.otoko.starteradminentity.entity.admin.shiro.Resources;
import com.otoko.startercommon.base.BaseDao.BaseDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author zhangjk
 * @description : ResourcesMapper 接口
 * ---------------------------------
 * @since 2018-11-12
 */
@Repository
public interface ResourcesMapper extends BaseDao<Resources> {

    /**
     * 获取Map数据（Obj）
     * 自定化MapSql到MysqlGenerator生成
     *
     * @param resourcesId
     * @return
     */
    Map<String, Object> selectMapById(@Param("resourcesId") Long resourcesId);

    /**
     * 加载所有的user_resources(MyShiroRealm)
     *
     * @param userId
     * @return
     */
    List<Resources> loadUserResources(@Param("userId") Long userId);
}