package com.otoko.starteradminentity.entity.admin.business;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.otoko.startercommon.base.BaseEntity.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author zhangjk
 * @description : LoginLog 实体类
 * ---------------------------------
 * @since 2018-10-28
 */
@TableName("c_business_login_log")
public class LoginLog extends BaseEntity {

    /**
     * 序列化标志
     */
    private static final long serialVersionUID = 1L;

    /**
     * 日志名称
     */
    @ApiModelProperty("日志名称")
    @TableField("logname")

    private String logname;

    /**
     * 管理员id
     */
    @ApiModelProperty("管理员id")
    @TableField("userid")

    private Long userid;

    /**
     * 创建时间
     */
    @ApiModelProperty("创建时间")
    @TableField("createtime")

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")

    private Date createtime;

    /**
     * 是否执行成功
     */
    @ApiModelProperty("是否执行成功")
    @TableField("succeed")

    private String succeed;

    /**
     * 具体消息
     */
    @ApiModelProperty("具体消息")
    @TableField("message")

    private String message;

    /**
     * 登录ip
     */
    @ApiModelProperty("登录ip")
    @TableField("ip")

    private String ip;

    public String getLogname() {
        return logname;
    }

    public void setLogname(String logname) {
        this.logname = logname;
    }

    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getSucceed() {
        return succeed;
    }

    public void setSucceed(String succeed) {
        this.succeed = succeed;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    @Override
    public String toString() {
        return "LoginLog{" +
                ", logname=" + logname +
                ", userid=" + userid +
                ", createtime=" + createtime +
                ", succeed=" + succeed +
                ", message=" + message +
                ", ip=" + ip +
                "}";
    }
}
