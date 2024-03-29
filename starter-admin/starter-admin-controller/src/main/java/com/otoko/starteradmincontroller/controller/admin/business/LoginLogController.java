package com.otoko.starteradmincontroller.controller.admin.business;

import com.baomidou.mybatisplus.plugins.Page;
import com.otoko.starteradminentity.entity.admin.business.LoginLog;
import com.otoko.starteradminservice.service.admin.business.LoginLogService;
import com.otoko.startercommon.base.BaseController.BaseController;
import com.otoko.startercommon.jsonResult.JsonResult;
import com.otoko.startercommon.jsonResult.TableJson;
import com.otoko.startercommon.pojo.MagicalValue;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @author : zhangjk
 * @description : LoginLog 控制器
 * @since : Create in 2018-10-28
 */
@RestController("adminLoginLogController")
@Api(value = "/admin/loginLog", description = "LoginLog 控制器")
@RequestMapping("/admin/loginLog")
public class LoginLogController extends BaseController {
    @Autowired
    private LoginLogService loginLogService;

    /**
     * @description : 获取分页列表
     * @author : zhangjk
     * @since : Create in 2018-10-28
     */
    @PostMapping(value = "/query", produces = {MediaType.APPLICATION_JSON_VALUE}, consumes = {MediaType.APPLICATION_JSON_VALUE})
    @ApiOperation(value = "/query", notes = "获取分页列表")
    public TableJson<LoginLog> getLoginLogList(@ApiParam(name = "LoginLog", value = "LoginLog 实体类") @RequestBody LoginLog loginLog) {
        TableJson<LoginLog> resJson = new TableJson<>();
        Page resPage = loginLog.getPage();
        Integer current = resPage.getCurrent();
        Integer size = resPage.getSize();
        if (current == null || size == null) {
            resJson.setSuccess(false);
            resJson.setMessage("异常信息：页数和页的大小不能为空");
            return resJson;
        }
        Page<LoginLog> loginLogPage = new Page<LoginLog>(current, size);
        loginLogPage = loginLogService.selectPageWithParam(loginLogPage, loginLog);
        resJson.setRecordsTotal(loginLogPage.getTotal());
        resJson.setData(loginLogPage.getRecords());
        resJson.setSuccess(true);
        return resJson;
    }

    /**
     * @description : 通过id获取loginLog
     * @author : zhangjk
     * @since : Create in 2018-10-28
     */
    @GetMapping(value = "/get_by_id/{loginLogId}", produces = {MediaType.APPLICATION_JSON_VALUE})
    @ApiOperation(value = "/get_by_id/{loginLogId}", notes = "根据id获取loginLog")
    public JsonResult<LoginLog> getLoginLogById(@ApiParam(name = "id", value = "loginLogId") @PathVariable("loginLogId") Long loginLogId) {
        JsonResult<LoginLog> resJson = new JsonResult<>();
        LoginLog loginLog = loginLogService.selectById(loginLogId);
        resJson.setCode(MagicalValue.CODE_OF_SUCCESS);
        resJson.setData(loginLog);
        resJson.setSuccess(true);
        return resJson;
    }

    /**
     * @description : 通过id获取loginLogMap
     * @author : zhangjk
     * @since : Create in 2018-10-28
     */
    @GetMapping(value = "/get_map_by_id/{loginLogId}", produces = {MediaType.APPLICATION_JSON_VALUE})
    @ApiOperation(value = "/get_map_by_id/{loginLogId}", notes = "根据id获取loginLogMap")
    public JsonResult<Map<String, Object>> getLoginLogByIdForMap(@ApiParam(name = "id", value = "loginLogId") @PathVariable("loginLogId") Long loginLogId) {
        JsonResult<Map<String, Object>> resJson = new JsonResult<>();
        Map<String, Object> loginLog = loginLogService.selectMapById(loginLogId);
        resJson.setCode(MagicalValue.CODE_OF_SUCCESS);
        resJson.setData(loginLog);
        resJson.setSuccess(true);
        return resJson;
    }

    /**
     * @description : 根据id假删除loginLog
     * @author : zhangjk
     * @since : Create in 2018-10-28
     */
    @PutMapping(value = "/delete", produces = {MediaType.APPLICATION_JSON_VALUE}, consumes = {MediaType.APPLICATION_JSON_VALUE})
    @ApiOperation(value = "/delete", notes = "根据id假删除loginLog")
    public JsonResult<LoginLog> fakeDeleteById(@ApiParam(name = "id", value = "loginLogId") @RequestBody Long loginLogId) {
        JsonResult<LoginLog> resJson = new JsonResult<>();
        resJson.setSuccess(loginLogService.fakeDeleteById(loginLogId));
        resJson.setCode(resJson.isSuccess() == true ? MagicalValue.CODE_OF_SUCCESS : MagicalValue.CODE_OF_CUSTOMIZE_EXCEPTION);
        return resJson;
    }

    /**
     * @description : 根据ids批量假删除loginLog
     * @author : zhangjk
     * @since : Create in 2018-10-28
     */
    @PutMapping(value = "/batch_delete", produces = {MediaType.APPLICATION_JSON_VALUE}, consumes = {MediaType.APPLICATION_JSON_VALUE})
    @ApiOperation(value = "/batch_delete", notes = "根据ids批量假删除loginLog")
    public JsonResult<LoginLog> fakeBatchDelete(@ApiParam(name = "ids", value = "loginLogIds") @RequestBody List<Long> loginLogIds) {
        JsonResult<LoginLog> resJson = new JsonResult<>();
        resJson.setSuccess(loginLogService.fakeBatchDelete(loginLogIds));
        resJson.setCode(resJson.isSuccess() == true ? MagicalValue.CODE_OF_SUCCESS : MagicalValue.CODE_OF_CUSTOMIZE_EXCEPTION);
        return resJson;
    }

    /**
     * @description : 新增或修改loginLog
     * @author : zhangjk
     * @since : Create in 2018-10-28
     */
    @PostMapping(value = "/create_update", produces = {MediaType.APPLICATION_JSON_VALUE}, consumes = {MediaType.APPLICATION_JSON_VALUE})
    @ApiOperation(value = "/create_update", notes = "新增或修改loginLog")
    public JsonResult<LoginLog> loginLogCreateUpdate(@ApiParam(name = "LoginLog", value = "LoginLog实体类") @RequestBody LoginLog loginLog) {
        loginLog = loginLogService.loginLogCreateUpdate(loginLog);
        JsonResult<LoginLog> resJson = new JsonResult<>();
        resJson.setCode(MagicalValue.CODE_OF_SUCCESS);
        resJson.setData(loginLog);
        resJson.setSuccess(true);
        return resJson;
    }
}