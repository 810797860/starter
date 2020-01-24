package com.otoko.starteradmincontroller.controller.admin.shiro;

import com.baomidou.mybatisplus.plugins.Page;
import com.otoko.starteradminentity.entity.admin.shiro.Menu;
import com.otoko.starteradminentity.entity.admin.shiro.User;
import com.otoko.starteradminservice.service.admin.shiro.RoleMenuService;
import com.otoko.starteradminservice.service.admin.shiro.UserService;
import com.otoko.startercommon.jsonResult.TableJson;
import com.otoko.startercommon.pojo.MagicalValue;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @author : zhangjk
 * @description : 后台重要页面入口控制器
 * @since : Create in 2018-12-04
 */
@Controller("adminAdminPageController")
@Api(value = "/admin", description = "后台重要页面入口控制器")
@RequestMapping("/admin")
public class AdminPageController {

    @Autowired
    private RoleMenuService roleMenuService;

    /**
     * @description : 跳转到登录页面
     * @author : zhangjk
     * @since : Create in 2018-12-04
     */
    @GetMapping(value = "/login")
    @ApiOperation(value = "/login", notes = "跳转到登录页面")
    public String login() {
        return "login";
    }

    /**
     * @description : 跳转到后台首页
     * @author : zhangjk
     * @since : Create in 2018-12-04
     */
    @GetMapping(value = "/index")
    @ApiOperation(value = "/index", notes = "跳转到后台首页")
    public String index(@ApiParam(name = "session", value = "客户端会话") HttpSession session,
                        @ApiParam(name = "model", value = "Model") Model model) {
        User user = (User) session.getAttribute(MagicalValue.USER_SESSION);
        //查找该用户的角色菜单列表
        //先找改用户的角色id
        Long roleId = Long.valueOf(session.getAttribute(MagicalValue.ROLE_SESSION_ID).toString());
        List<Menu> roleMenus = roleMenuService.mySelectListWithRoleId(roleId);
        //前端没判空后台来判咯
        if (roleMenus == null) {
            roleMenus = new ArrayList<>();
        }
        //注入后台用户信息
        model.addAttribute("user", user);
        //注入该用户的菜单
        model.addAttribute("roleMenus", roleMenus);
        return "index";
    }

    @GetMapping("/demo/table/user/")
    @ResponseBody
    public String testUser(){
        return "{\"code\":0,\"msg\":\"\",\"count\":1000,\"data\":[{\"id\":10000,\"username\":\"user-0\",\"sex\":\"女\",\"city\":\"城市-0\",\"sign\":\"签名-0\",\"experience\":255,\"logins\":24,\"wealth\":82830700,\"classify\":\"作家\",\"score\":57},{\"id\":10001,\"username\":\"user-1\",\"sex\":\"男\",\"city\":\"城市-1\",\"sign\":\"签名-1\",\"experience\":884,\"logins\":58,\"wealth\":64928690,\"classify\":\"词人\",\"score\":27},{\"id\":10002,\"username\":\"user-2\",\"sex\":\"女\",\"city\":\"城市-2\",\"sign\":\"签名-2\",\"experience\":650,\"logins\":77,\"wealth\":6298078,\"classify\":\"酱油\",\"score\":31},{\"id\":10003,\"username\":\"user-3\",\"sex\":\"女\",\"city\":\"城市-3\",\"sign\":\"签名-3\",\"experience\":362,\"logins\":157,\"wealth\":37117017,\"classify\":\"诗人\",\"score\":68},{\"id\":10004,\"username\":\"user-4\",\"sex\":\"男\",\"city\":\"城市-4\",\"sign\":\"签名-4\",\"experience\":807,\"logins\":51,\"wealth\":76263262,\"classify\":\"作家\",\"score\":6},{\"id\":10005,\"username\":\"user-5\",\"sex\":\"女\",\"city\":\"城市-5\",\"sign\":\"签名-5\",\"experience\":173,\"logins\":68,\"wealth\":60344147,\"classify\":\"作家\",\"score\":87},{\"id\":10006,\"username\":\"user-6\",\"sex\":\"女\",\"city\":\"城市-6\",\"sign\":\"签名-6\",\"experience\":982,\"logins\":37,\"wealth\":57768166,\"classify\":\"作家\",\"score\":34},{\"id\":10007,\"username\":\"user-7\",\"sex\":\"男\",\"city\":\"城市-7\",\"sign\":\"签名-7\",\"experience\":727,\"logins\":150,\"wealth\":82030578,\"classify\":\"作家\",\"score\":28},{\"id\":10008,\"username\":\"user-8\",\"sex\":\"男\",\"city\":\"城市-8\",\"sign\":\"签名-8\",\"experience\":951,\"logins\":133,\"wealth\":16503371,\"classify\":\"词人\",\"score\":14},{\"id\":10009,\"username\":\"user-9\",\"sex\":\"女\",\"city\":\"城市-9\",\"sign\":\"签名-9\",\"experience\":484,\"logins\":25,\"wealth\":86801934,\"classify\":\"词人\",\"score\":75}]}";
    }
}