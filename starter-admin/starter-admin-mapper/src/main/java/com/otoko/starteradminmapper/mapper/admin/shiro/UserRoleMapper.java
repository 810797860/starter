package com.otoko.starteradminmapper.mapper.admin.shiro;

import com.otoko.starteradminentity.entity.admin.shiro.UserRole;
import com.otoko.startercommon.base.BaseDao.BaseDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * @author zhangjk
 * @description : UserRoleMapper 接口
 * ---------------------------------
 * @since 2018-11-22
 */
@Repository
public interface UserRoleMapper extends BaseDao<UserRole> {

    /**
     * 获取Map数据（Obj）
     * 自定化MapSql到MysqlGenerator生成
     *
     * @param userRoleId
     * @return
     */
    Map<String, Object> selectMapById(@Param("userRoleId") Long userRoleId);
}