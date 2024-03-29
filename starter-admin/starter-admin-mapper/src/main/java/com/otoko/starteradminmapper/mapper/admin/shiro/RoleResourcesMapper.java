package com.otoko.starteradminmapper.mapper.admin.shiro;

import com.otoko.starteradminentity.entity.admin.shiro.RoleResources;
import com.otoko.startercommon.base.BaseDao.BaseDao;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * @author zhangjk
 * @description : RoleResourcesMapper 接口
 * ---------------------------------
 * @since 2018-11-12
 */
@Repository
public interface RoleResourcesMapper extends BaseDao<RoleResources> {

    /**
     * 获取Map数据（Obj）
     * 自定化MapSql到MysqlGenerator生成
     *
     * @param roleResourcesId
     * @return
     */
    Map<String, Object> selectMapById(@Param("roleResourcesId") Long roleResourcesId);

    /**
     * 当权限表中的权限被假删除时，相应的RoleResources中的权限也要跟着假删除
     *
     * @param resourcesId
     * @return
     */
    @Update("update s_base_role_resources set deleted = true where resources_id = #{resourcesId}")
    int deleteWithResourcesById(@Param("resourcesId") Long resourcesId);
}