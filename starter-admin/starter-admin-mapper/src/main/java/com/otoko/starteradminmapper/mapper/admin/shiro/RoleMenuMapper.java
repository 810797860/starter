package com.otoko.starteradminmapper.mapper.admin.shiro;

import com.otoko.starteradminentity.entity.admin.shiro.RoleMenu;
import com.otoko.startercommon.base.BaseDao.BaseDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * @author zhangjk
 * @description : RoleMenuMapper 接口
 * ---------------------------------
 * @since 2018-12-02
 */
@Repository
public interface RoleMenuMapper extends BaseDao<RoleMenu> {

    /**
     * 获取Map数据（Obj）
     * 自定化MapSql到MysqlGenerator生成
     *
     * @param roleMenuId
     * @return
     */
    Map<String, Object> selectMapById(@Param("roleMenuId") Long roleMenuId);
}