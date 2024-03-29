package com.otoko.starteradmincontroller.shiro;

import com.otoko.starteradminentity.entity.admin.shiro.Resources;
import com.otoko.starteradminentity.entity.admin.shiro.User;
import com.otoko.starteradminservice.service.admin.shiro.ResourcesService;
import com.otoko.starteradminservice.service.admin.shiro.UserRoleService;
import com.otoko.starteradminservice.service.admin.shiro.UserService;
import com.otoko.startercommon.pojo.MagicalValue;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.mgt.RealmSecurityManager;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.crazycake.shiro.RedisSessionDAO;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * @author 81079
 */

public class MyShiroRealm extends AuthorizingRealm {

    @Resource
    private UserService userService;

    @Resource
    private ResourcesService resourcesService;

    @Autowired
    private RedisSessionDAO redisSessionDAO;

    @Autowired
    private UserRoleService userRoleService;

    //授权
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //User{id=1, username='admin', password='3ef7164d1f6167cb9f2658c07d3c2f0a', enable=1}
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        List<Resources> resourcesList = resourcesService.myLoadUserResources(user.getId());
        // 权限信息对象info,用来存放查出的用户的所有的角色（role）及权限（permission）
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        for (Resources resources : resourcesList) {
            info.addStringPermission(resources.getUrl());
        }
        return info;
    }

    //认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //获取用户的输入的账号.
        String account = (String) token.getPrincipal();
        User user = userService.selectByUserAccount(account);
        if (user == null) {
            throw new UnknownAccountException();
        }
        //如果账号被假删除
        if (true == user.getDeleted()) {
            // 帐号锁定
            throw new LockedAccountException();
        }
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                //用户
                user,
                //密码
                user.getPassword(),
                //盐值，注释掉，这里没用到
//                ByteSource.Util.bytes(username),
                //realm name
                getName()
        );
        // 当验证都通过后，把用户信息放在session里
        //根据用户id找改角色的id
        Long roleId = userRoleService.getRoleIdByUserId(user.getId());

        Session session = SecurityUtils.getSubject().getSession();
        session.setAttribute(MagicalValue.USER_SESSION, user);
        session.setAttribute(MagicalValue.USER_SESSION_ID, user.getId());
        session.setAttribute(MagicalValue.ROLE_SESSION_ID, roleId);
        session.setAttribute(MagicalValue.USER_TYPE, user.getType());
        return authenticationInfo;
    }


    /**
     * 根据userId 清除当前session存在的用户的权限缓存
     *
     * @param userIds 已经修改了权限的userId
     */
    public void clearUserAuthByUserId(List<Integer> userIds) {
        if (null == userIds || userIds.size() == 0) {
            return;
        }
        //获取所有session
        Collection<Session> sessions = redisSessionDAO.getActiveSessions();
        //定义返回
        List<SimplePrincipalCollection> list = new ArrayList<SimplePrincipalCollection>();
        for (Session session : sessions) {
            //获取session登录信息。
            Object obj = session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
            if (null != obj && obj instanceof SimplePrincipalCollection) {
                //强转
                SimplePrincipalCollection spc = (SimplePrincipalCollection) obj;
                //判断用户，匹配用户ID。
                obj = spc.getPrimaryPrincipal();
                if (null != obj && obj instanceof User) {
                    User user = (User) obj;
                    System.out.println("user:" + user);
                    //比较用户ID，符合即加入集合
                    if (null != user && userIds.contains(user.getId())) {
                        list.add(spc);
                    }
                }
            }
        }
        RealmSecurityManager securityManager =
                (RealmSecurityManager) SecurityUtils.getSecurityManager();
        MyShiroRealm realm = (MyShiroRealm) securityManager.getRealms().iterator().next();
        for (SimplePrincipalCollection simplePrincipalCollection : list) {
            realm.clearCachedAuthorizationInfo(simplePrincipalCollection);
        }
    }
}
