package com.otoko.starteradmincontroller.serviceimpl.shiro;

import com.baomidou.mybatisplus.enums.SqlLike;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.otoko.starteradminentity.entity.admin.shiro.Resources;
import com.otoko.starteradminentity.entity.admin.shiro.RoleResources;
import com.otoko.starteradminmapper.mapper.admin.shiro.RoleResourcesMapper;
import com.otoko.starteradminservice.service.admin.shiro.ResourcesService;
import com.otoko.starteradminservice.service.admin.shiro.RoleResourcesService;
import com.otoko.startercommon.base.BaseEntity.Sort;
import com.otoko.startercommon.base.BaseServiceImpl.BaseServiceImpl;
import com.otoko.startercommon.util.ToolUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * @author zhangjk
 * @description : RoleResources 服务实现类
 * ---------------------------------
 * @since 2018-11-12
 */

@Service
@CacheConfig(cacheNames = "roleResources")
public class RoleResourcesServiceImpl extends BaseServiceImpl<RoleResourcesMapper, RoleResources> implements RoleResourcesService {

    @Autowired
    private RoleResourcesMapper roleResourcesMapper;

    @Autowired
    private ResourcesService resourcesService;

    @Override
    @CacheEvict(allEntries = true)
    public Integer myFakeDeleteByRoleResources(RoleResources roleResources) {
        Wrapper<RoleResources> wrapper = new EntityWrapper<>();
        wrapper.where("role_id = {0}", roleResources.getRoleId());
        wrapper.where("resources_id = {0}", roleResources.getResourcesId());
        roleResources.setDeleted(true);
        return roleResourcesMapper.update(roleResources, wrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    @CacheEvict(allEntries = true)
    public boolean myFakeBatchDelete(Long roleId, List<Integer> resourcesIds) {
        RoleResources roleResources = new RoleResources();
        roleResources.setDeleted(true);
        resourcesIds.forEach(resourcesId -> {
            //这里就直接遍历假删除了，不去调用myFakeDelete
            Wrapper<RoleResources> wrapper = new EntityWrapper<>();
            wrapper.where("role_id = {0}", roleId);
            wrapper.where("resources_id = {0}", resourcesId.longValue());
            roleResourcesMapper.update(roleResources, wrapper);
        });
        return true;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    @CacheEvict(allEntries = true)
    public Integer myUpdateRoleResources(Long roleId, List<Long> resourcesIds) {

        //先删除旧的roleResources
        Wrapper<RoleResources> wrapper = new EntityWrapper<>();
        wrapper.where("role_id = {0}", roleId);
        Integer deleteResult = roleResourcesMapper.delete(wrapper);

        //再更新新的进去
        resourcesIds.forEach(resourcesId -> {
            RoleResources roleResources = new RoleResources();
            roleResources.setRoleId(roleId);
            roleResources.setResourcesId(resourcesId);
            roleResources.setUuid(ToolUtil.getUUID());
            roleResourcesMapper.insert(roleResources);
        });
        return deleteResult;
    }

    @Override
    @Cacheable(key = "#p0")
    public Map<String, Object> mySelectMapById(Long roleResourcesId) {
        return roleResourcesMapper.selectMapById(roleResourcesId);
    }

    @Override
    @CacheEvict(allEntries = true)
    public RoleResources myRoleResourcesCreateUpdate(RoleResources roleResources) {
        Long roleResourcesId = roleResources.getId();
        if (roleResourcesId == null) {
            roleResources.setUuid(ToolUtil.getUUID());
            roleResourcesMapper.insert(roleResources);
        } else {
            roleResourcesMapper.updateById(roleResources);
        }
        return roleResources;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    @CacheEvict(allEntries = true)
    public boolean myRoleResourcesBatchCreate(Long roleId, List<Integer> resourcesIds) {
        resourcesIds.forEach(resourcesId -> {
            //这里就自己写了，为了快一点(因为都是新增)
            RoleResources roleResources = new RoleResources();
            roleResources.setUuid(ToolUtil.getUUID());
            roleResources.setRoleId(roleId);
            roleResources.setResourcesId(resourcesId.longValue());
            roleResourcesMapper.insert(roleResources);
        });
        return true;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    @Cacheable(key = "'EnableCreate' + #p0 + ',' + #p1 + ',' + #p1.sorts")
    public Page<Resources> mySelectEnableCreatePage(Page<Resources> page, RoleResources roleResources) {

        //先找出resourcesIds
        Wrapper<RoleResources> wrapper = new EntityWrapper<>(roleResources);
        wrapper.setSqlSelect("resources_id");
        List<Object> resourcesIds = this.selectObjs(wrapper);
        //再根据id找resourcesPage
        Wrapper<Resources> resourcesWrapper = new EntityWrapper<>();
        resourcesWrapper.notIn("id", resourcesIds);
        //判空
        resourcesWrapper.where("deleted = {0}", false);
        //遍历排序
        List<Sort> sorts = roleResources.getSorts();
        if (sorts == null) {
            //为null时，默认按created_at倒序
            resourcesWrapper.orderBy("id", false);
        } else {
            //遍历排序
            sorts.forEach(sort -> {
                resourcesWrapper.orderBy(sort.getField(), sort.getAsc());
            });
        }
        //这里用service，既能redis又只能用redis
        return resourcesService.selectPage(page, resourcesWrapper);
    }

    //以下是继承BaseServiceImpl

    @Override
    @Transactional(rollbackFor = Exception.class)
    @Cacheable(key = "'MyResources' + #p0 + ',' + #p1")
    public Page<Resources> mySelectPageWithParam(Page<Resources> page, Map<String, Object> roleResources) throws IllegalAccessException, JSONException, InstantiationException {

        //先找出resourcesIds
        Wrapper<RoleResources> wrapper = new EntityWrapper<>();
        wrapper.setSqlSelect("resources_id")
                .eq("role_id", roleResources.get("roleId"))
                .eq("deleted", false);
        List<Object> resourcesIds = this.selectObjs(wrapper);
        //如果resourcesIds为空，返回空的对象
        if (resourcesIds.size() == 0) {
            return new Page<>();
        }
        //再根据id找resourcesPage
        Wrapper<Resources> resourcesWrapper = new EntityWrapper<>();
        String title = roleResources.containsKey("title") ? roleResources.get("title").toString() : null;
        String url = roleResources.containsKey("url") ? roleResources.get("url").toString() : null;
        resourcesWrapper.in("id", resourcesIds)
                //判空
                .where("deleted = {0}", false)
                .like("title", title, SqlLike.DEFAULT)
                .like("url", url, SqlLike.DEFAULT);
        //遍历排序
        List<Sort> sorts = ToolUtil.mapObjectToList(roleResources.get("sorts"), Sort.class);
        if (sorts == null) {
            //为null时，默认按created_at倒序
            resourcesWrapper.orderBy("id", false);
        } else {
            //遍历排序
            sorts.forEach(sort -> {
                resourcesWrapper.orderBy(sort.getField(), sort.getAsc());
            });
        }
        //这里用service，既能redis又只能用redis
        return resourcesService.selectPage(page, resourcesWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    @Cacheable(key = "'myAddSelectPageWithParam' + #p0 + ',' + #p1")
    public Page<Resources> myAddSelectPageWithParam(Page<Resources> page, Map<String, Object> roleResources) throws IllegalAccessException, JSONException, InstantiationException {
        //先找出resourcesIds
        Wrapper<RoleResources> wrapper = new EntityWrapper<>();
        String title = roleResources.containsKey("title") ? roleResources.get("title").toString() : null;
        String url = roleResources.containsKey("url") ? roleResources.get("url").toString() : null;
        wrapper.setSqlSelect("resources_id")
                .eq("role_id", roleResources.get("roleId"))
                .eq("deleted", false)
                .like("title", title, SqlLike.DEFAULT)
                .like("url", url, SqlLike.DEFAULT);
        List<Object> resourcesIds = this.selectObjs(wrapper);
        //如果resourcesIds为空，返回空的对象
        if (resourcesIds.size() == 0) {
            return new Page<>();
        }
        //再根据id找resourcesPage
        Wrapper<Resources> resourcesWrapper = new EntityWrapper<>();
        //判空
        resourcesWrapper.where("deleted = {0}", false);
        if (!ToolUtil.objIsEmpty(resourcesIds)){
            resourcesWrapper.notIn("id", resourcesIds);
        }
        //遍历排序
        List<Sort> sorts = ToolUtil.mapObjectToList(roleResources.get("sorts"), Sort.class);
        if (sorts == null) {
            //为null时，默认按created_at倒序
            resourcesWrapper.orderBy("id", false);
        } else {
            //遍历排序
            sorts.forEach(sort -> {
                resourcesWrapper.orderBy(sort.getField(), sort.getAsc());
            });
        }
        //这里用service，既能redis又只能用redis
        return resourcesService.selectPage(page, resourcesWrapper);
    }


    @Override
    @Cacheable(key = "#p0")
    public List<RoleResources> mySelectListWithMap(Map<String, Object> map) {
        return roleResourcesMapper.selectByMap(map);
    }

    //以下是继承BaseMapper

    @Override
    @Cacheable(key = "#p0.paramNameValuePairs")
    public Map<String, Object> mySelectMap(Wrapper<RoleResources> wrapper) {
        return this.selectMap(wrapper);
    }

    @Override
    @Cacheable(key = "#p0.paramNameValuePairs")
    public List<RoleResources> mySelectList(Wrapper<RoleResources> wrapper) {
        return roleResourcesMapper.selectList(wrapper);
    }

    @Override
    @CacheEvict(allEntries = true)
    public boolean myInsert(RoleResources roleResources) {
        roleResources.setUuid(ToolUtil.getUUID());
        return this.insert(roleResources);
    }

    @Override
    @CacheEvict(allEntries = true)
    public boolean myInsertBatch(List<RoleResources> roleResourcesList) {
        for (RoleResources roleResources : roleResourcesList) {
            roleResources.setUuid(ToolUtil.getUUID());
        }
        return this.insertBatch(roleResourcesList);
    }

    @Override
    @CacheEvict(allEntries = true)
    public boolean myInsertOrUpdate(RoleResources roleResources) {
        //没有uuid的话要加上去
        if (roleResources.getUuid().equals(null)) {
            roleResources.setUuid(ToolUtil.getUUID());
        }
        return this.insertOrUpdate(roleResources);
    }

    @Override
    @CacheEvict(allEntries = true)
    public boolean myInsertOrUpdateBatch(List<RoleResources> roleResourcesList) {
        for (RoleResources roleResources : roleResourcesList) {
            //没有uuid的话要加上去
            if (roleResources.getUuid().equals(null)) {
                roleResources.setUuid(ToolUtil.getUUID());
            }
        }
        return this.insertOrUpdateBatch(roleResourcesList);
    }

    @Override
    @Cacheable(key = "#p0")
    public List<RoleResources> mySelectBatchIds(Collection<? extends Serializable> roleResourcesIds) {
        return roleResourcesMapper.selectBatchIds(roleResourcesIds);
    }

    @Override
    @Cacheable(key = "#p0")
    public RoleResources mySelectById(Serializable roleResourcesId) {
        return roleResourcesMapper.selectById(roleResourcesId);
    }

    @Override
    @Cacheable(key = "#p0.paramNameValuePairs")
    public int mySelectCount(Wrapper<RoleResources> wrapper) {
        return roleResourcesMapper.selectCount(wrapper);
    }

    @Override
    @Cacheable(key = "#p0.paramNameValuePairs")
    public RoleResources mySelectOne(Wrapper<RoleResources> wrapper) {
        return this.selectOne(wrapper);
    }

    @Override
    @Cacheable(key = "#p0.paramNameValuePairs")
    public List<Object> mySelectObjs(Wrapper<RoleResources> wrapper) {
        return this.selectObjs(wrapper);
    }

    @Override
    @CacheEvict(allEntries = true)
    public boolean myUpdate(RoleResources roleResources, Wrapper<RoleResources> wrapper) {
        return this.update(roleResources, wrapper);
    }

    @Override
    @CacheEvict(allEntries = true)
    public boolean myUpdateBatchById(List<RoleResources> roleResourcesList) {
        return this.updateBatchById(roleResourcesList);
    }

    @Override
    @CacheEvict(allEntries = true)
    public boolean myUpdateById(RoleResources roleResources) {
        return this.updateById(roleResources);
    }

    @Override
    @Cacheable(key = "#p0")
    public List<Object> mySelectSelectedList(Long roleId) {

        //找出resourcesIds
        Wrapper<RoleResources> wrapper = new EntityWrapper<>();
        wrapper.setSqlSelect("resources_id");
        wrapper.where("role_id = {0}", roleId);
        wrapper.where("deleted = {0}", false);
        return this.mySelectObjs(wrapper);
    }
}