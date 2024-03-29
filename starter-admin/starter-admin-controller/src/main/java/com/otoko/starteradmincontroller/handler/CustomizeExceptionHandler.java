package com.otoko.starteradmincontroller.handler;

import com.otoko.startercommon.jsonResult.JsonResult;
import com.otoko.startercommon.pojo.CustomizeException;
import com.otoko.startercommon.pojo.MagicalValue;
import io.swagger.annotations.Api;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author 81079
 */
@ControllerAdvice
@ResponseBody
@Api(description = "异常拦截器")
public class CustomizeExceptionHandler{

    @ExceptionHandler(CustomizeException.class)
    public JsonResult<CustomizeException> handle(CustomizeException ex){
        JsonResult<CustomizeException> resJson = new JsonResult<>();
        resJson.setSuccess(false);
        resJson.setMessage(ex.getMessage());
        resJson.setData(ex);
        resJson.setCode(ex.getCode());
        return resJson;
    }

    @ExceptionHandler(UnauthorizedException.class)
    public JsonResult<UnauthorizedException> handle(UnauthorizedException ex){
        JsonResult<UnauthorizedException> resJson = new JsonResult<>();
        resJson.setSuccess(false);
        resJson.setMessage(ex.getMessage());
        resJson.setData(ex);
        resJson.setCode(MagicalValue.CODE_OF_UNAUTHORIZED_EXCEPTION);
        return resJson;
    }
}
