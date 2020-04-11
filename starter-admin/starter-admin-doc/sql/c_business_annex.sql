/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : starter

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 08/04/2020 20:31:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for c_business_annex
-- ----------------------------
DROP TABLE IF EXISTS `c_business_annex`;
CREATE TABLE `c_business_annex`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '文件名',
  `type` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '文件类型',
  `extension` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '文件后缀',
  `size` float DEFAULT 0 COMMENT '文件大小',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '文件地址',
  `md5` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '文件md5',
  `content_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '消息头',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '全局id',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT b'0' COMMENT '是否已删除',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_business_front_select_item
-- ----------------------------
DROP TABLE IF EXISTS `c_business_front_select_item`;
CREATE TABLE `c_business_front_select_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '全局id',
  `sort` int(11) DEFAULT 1 COMMENT '排序字段',
  `item_value` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '选择项值',
  `pid` bigint(20) DEFAULT NULL COMMENT '父级',
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT b'0' COMMENT '是否已删除',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业务枚举表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_business_login_log
-- ----------------------------
DROP TABLE IF EXISTS `c_business_login_log`;
CREATE TABLE `c_business_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '日志名称',
  `userid` bigint(65) DEFAULT NULL COMMENT '管理员id',
  `createtime` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否执行成功',
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '具体消息',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录ip',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '全局id',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT b'0' COMMENT '是否已删除',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 220 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登录记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_business_login_log
-- ----------------------------
INSERT INTO `c_business_login_log` VALUES (217, '登录失败日志', NULL, '2018-09-17 06:18:45', '成功', '账号:admin,账号密码错误', '0:0:0:0:0:0:0:1', NULL, NULL, b'0', NULL, '2018-09-20 15:34:20', NULL, '2019-12-04 10:09:38');
INSERT INTO `c_business_login_log` VALUES (218, '登录失败日志', NULL, '2018-09-17 06:18:57', '成功', '账号:admin,账号密码错误', '0:0:0:0:0:0:0:1', NULL, NULL, b'0', NULL, '2018-09-20 15:34:20', NULL, '2019-12-04 10:09:38');
INSERT INTO `c_business_login_log` VALUES (219, '登录日志', 1, '2018-09-17 06:22:02', '成功', NULL, '0:0:0:0:0:0:0:1', NULL, NULL, b'0', NULL, '2018-09-20 15:34:20', NULL, '2019-12-04 10:09:38');

-- ----------------------------
-- Table structure for c_business_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `c_business_operation_log`;
CREATE TABLE `c_business_operation_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logtype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '日志类型',
  `logname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '日志名称',
  `userid` bigint(65) DEFAULT NULL COMMENT '用户id',
  `classname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类名称',
  `method` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '方法名称',
  `createtime` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否成功',
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '备注',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '全局id',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT b'0' COMMENT '是否已删除',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_business_socket_message
-- ----------------------------
DROP TABLE IF EXISTS `c_business_socket_message`;
CREATE TABLE `c_business_socket_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '消息标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '消息内容',
  `sender` bigint(20) DEFAULT NULL COMMENT '发送消息者',
  `recipient` bigint(20) DEFAULT NULL COMMENT '接受消息者',
  `details` longtext CHARACTER SET utf8 COLLATE utf8_bin COMMENT '消息详情',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '全局id',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT b'0' COMMENT '是否已删除',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for c_business_test
-- ----------------------------
DROP TABLE IF EXISTS `c_business_test`;
CREATE TABLE `c_business_test`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '全局id',
  `test12` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '测试字段233',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT b'0' COMMENT '是否已删除',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '测试表单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_business_test
-- ----------------------------
INSERT INTO `c_business_test` VALUES (1, NULL, '22', '33', b'0', NULL, '2019-03-21 10:25:27', NULL, '2019-03-21 10:25:27');

-- ----------------------------
-- Table structure for s_base_button
-- ----------------------------
DROP TABLE IF EXISTS `s_base_button`;
CREATE TABLE `s_base_button`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '按钮名称',
  `icon` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '按钮图标',
  `class_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '按钮类名',
  `script` longtext CHARACTER SET utf8 COLLATE utf8_bin COMMENT '按钮脚本',
  `num` int(11) DEFAULT 0 COMMENT '按钮排序号',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '全局id',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT b'0' COMMENT '是否已删除',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_base_button
-- ----------------------------
INSERT INTO `s_base_button` VALUES (1, '新增表单', 'icon-plus', 'btn btn-sm btn-primary', 'layer.open({\r\n        type: 2,\r\n        title: \'新增表单\',\r\n        shadeClose: false,\r\n        shade: 0.8,\r\n        area: [\'800px\', \'90%\'],\r\n        content: \'/admin/form/create.html\'\r\n    });', 1, NULL, NULL, b'0', NULL, '2018-12-04 19:54:26', NULL, '2019-02-04 10:53:16');
INSERT INTO `s_base_button` VALUES (2, 'title2', 'icon-save', 'btn btn-sm btn-info', 'console.log(\"先放着\");', 2, NULL, NULL, b'0', NULL, '2018-12-04 19:54:44', NULL, '2019-02-05 23:58:37');
INSERT INTO `s_base_button` VALUES (3, '修改表单', 'icon-save', 'btn btn-sm btn-info', 'var selectedIds = getSelectionMessage(\'id\');\r\nconsole.log(selectedIds);\r\nif(selectedIds.length != 1) {\r\n	layer.msg(\"请选择一项！\", function(){});\r\n	return ;\r\n}\r\nwindow.open(selectedIds[0].id + \'/update.html\');', 2, '83f4659a06864605b2371525ad4ae656', NULL, b'0', NULL, '2018-12-04 20:06:26', NULL, '2019-01-30 21:38:40');
INSERT INTO `s_base_button` VALUES (4, '删除表单', 'icon-trash', 'btn btn-sm btn-danger', 'var formId = $(\'#formId\').val();\r\n    var selectedIds = getSelectionMessage(\'id\');\r\nconsole.log(selectedIds);\r\n        if(selectedIds.length === 0) {\r\n        layer.msg(\"至少选择一项！\", function(){});\r\n        return ;\r\n        }\r\n        var ids=[];\r\n        for ( var i = 0; i < selectedIds.length; i++) {\r\n        ids.push(selectedIds[i].id);\r\n        }\r\n        layer.confirm(\'确定删除选中记录?\', {\r\n        icon : 3,\r\n        btn : [ \'确定\', \'取消\' ] },\r\n        function() {\r\n        $.ajax({\r\n        url: \'/admin/form/batch_delete\',\r\n        contentType: \'application/json;charset=utf-8\',\r\n        type: \'put\',\r\n        dataType: \'json\',\r\n        data:JSON.stringify(ids),\r\n        success: function (data) {\r\n        layer.closeAll();\r\n        refreshTable();\r\n        },\r\n        error:function(){\r\n        layer.alert(\'删除失败！\',  {icon: 2});\r\n        }\r\n        });\r\n        }\r\n        );\r\n', 3, NULL, NULL, b'0', NULL, '2018-12-05 18:56:21', NULL, '2019-02-05 17:57:40');
INSERT INTO `s_base_button` VALUES (5, '新增字段', 'icon-plus', 'btn btn-sm btn-primary', 'layer.open({\r\n        type: 2,\r\n        title: \'新增字段\',\r\n        shadeClose: false,\r\n        shade: 0.8,\r\n        area: [\'800px\', \'90%\'],\r\n        content: formId + \'/create.html\'\r\n        });', 1, NULL, NULL, b'0', NULL, '2019-02-02 22:52:16', NULL, '2019-02-04 11:32:37');
INSERT INTO `s_base_button` VALUES (6, '修改字段', 'icon-save', 'btn btn-sm btn-info', 'var selectedIds = getSelectionMessage(\'id\');\r\nconsole.log(selectedIds);\r\nif(selectedIds.length != 1) {\r\n	layer.msg(\"请选择一项！\", function(){});\r\n	return ;\r\n}\r\nwindow.open(formId + \'/\' + selectedIds[0].id + \'/update.html\');', 2, NULL, NULL, b'0', NULL, '2019-02-02 22:52:50', NULL, '2019-02-04 11:40:35');
INSERT INTO `s_base_button` VALUES (7, '删除字段', 'icon-trash', 'btn btn-sm btn-danger', 'var formId = $(\'#formId\').val();\r\n    var selectedIds = getSelectionMessage(\'id\');\r\nconsole.log(selectedIds);\r\n        if(selectedIds.length === 0) {\r\n        layer.msg(\"至少选择一项！\", function(){});\r\n        return ;\r\n        }\r\n        var ids=[];\r\n        for ( var i = 0; i < selectedIds.length; i++) {\r\n        ids.push(selectedIds[i].id);\r\n        }\r\n        layer.confirm(\'确定删除选中记录?\', {\r\n        icon : 3,\r\n        btn : [ \'确定\', \'取消\' ] },\r\n        function() {\r\n        $.ajax({\r\n        url: \'/admin/formField/batch_delete\',\r\n        contentType: \'application/json;charset=utf-8\',\r\n        type: \'put\',\r\n        dataType: \'json\',\r\n        data:JSON.stringify(ids),\r\n        success: function (data) {\r\n        layer.closeAll();\r\n        refreshTable();\r\n        },\r\n        error:function(){\r\n        layer.alert(\'删除失败！\',  {icon: 2});\r\n        }\r\n        });\r\n        }\r\n        );\r\n', 3, NULL, NULL, b'0', NULL, '2019-02-02 22:53:12', NULL, '2019-02-05 17:55:05');
INSERT INTO `s_base_button` VALUES (8, '新增用户', 'icon-plus', 'btn btn-sm btn-primary', '$addUserModal.modal(\'show\')', 1, NULL, NULL, b'0', NULL, '2019-02-05 23:58:10', NULL, '2019-02-06 09:02:55');
INSERT INTO `s_base_button` VALUES (9, '分配角色', 'icon-save', 'btn btn-sm btn-info', 'setUserRole()', 2, NULL, NULL, b'0', NULL, '2019-02-05 23:59:02', NULL, '2019-02-06 16:12:08');
INSERT INTO `s_base_button` VALUES (10, '删除用户', 'icon-trash', 'btn btn-sm btn-danger', 'var formId = $(\'#formId\').val();\r\n    var selectedIds = getSelectionMessage(\'id\');\r\nconsole.log(selectedIds);\r\n        if(selectedIds.length === 0) {\r\n        layer.msg(\"至少选择一项！\", function(){});\r\n        return ;\r\n        }\r\n        var ids=[];\r\n        for ( var i = 0; i < selectedIds.length; i++) {\r\n        ids.push(selectedIds[i].id);\r\n        }\r\n        layer.confirm(\'确定删除选中记录?\', {\r\n        icon : 3,\r\n        btn : [ \'确定\', \'取消\' ] },\r\n        function() {\r\n        $.ajax({\r\n        url: \'/admin/user/batch_delete\',\r\n        contentType: \'application/json;charset=utf-8\',\r\n        type: \'put\',\r\n        dataType: \'json\',\r\n        data:JSON.stringify(ids),\r\n        success: function (data) {\r\n        layer.closeAll();\r\n        refreshTable();\r\n        },\r\n        error:function(){\r\n        layer.alert(\'删除失败！\',  {icon: 2});\r\n        }\r\n        });\r\n        }\r\n        );\r\n', 3, NULL, NULL, b'0', NULL, '2019-02-05 23:59:29', NULL, '2019-02-07 16:09:27');
INSERT INTO `s_base_button` VALUES (11, '新增按钮', 'icon-plus', 'btn btn-sm btn-primary', 'layer.open({\r\n        type: 2,\r\n        title: \'新增按钮\',\r\n        shadeClose: false,\r\n        shade: 0.8,\r\n        area: [\'800px\', \'90%\'],\r\n        content: \'/admin/button/create.html\'\r\n        });', 1, NULL, NULL, b'0', NULL, '2019-02-07 21:30:51', NULL, '2019-02-07 22:00:00');
INSERT INTO `s_base_button` VALUES (12, '修改按钮', 'icon-save', 'btn btn-sm btn-info', 'var selectedIds = getSelectionMessage(\'id\');\r\n    console.log(selectedIds);\r\n            if(selectedIds.length != 1) {\r\n            layer.msg(\"请选择一项！\", function(){});\r\n            return ;\r\n            }\r\n            window.open(selectedIds[0].id + \'/update.html\');', 2, NULL, NULL, b'0', NULL, '2019-02-07 21:31:30', NULL, '2019-02-07 21:37:54');
INSERT INTO `s_base_button` VALUES (13, '删除按钮', 'icon-trash', 'btn btn-sm btn-danger', 'var formId = $(\'#formId\').val();\r\n    var selectedIds = getSelectionMessage(\'id\');\r\n    console.log(selectedIds);\r\n    if(selectedIds.length === 0) {\r\n        layer.msg(\"至少选择一项！\", function(){});\r\n        return ;\r\n    }\r\n    var ids=[];\r\n    for ( var i = 0; i < selectedIds.length; i++) {\r\n        ids.push(selectedIds[i].id);\r\n    }\r\n    layer.confirm(\'确定删除选中记录?\', {\r\n    icon : 3,\r\n    btn : [ \'确定\', \'取消\' ] },\r\n    function() {\r\n        $.ajax({\r\n        url: \'/admin/button/batch_delete\',\r\n        contentType: \'application/json;charset=utf-8\',\r\n        type: \'put\',\r\n        dataType: \'json\',\r\n        data:JSON.stringify(ids),\r\n        success: function (data) {\r\n        layer.closeAll();\r\n        refreshTable();\r\n    },\r\n    error:function(){\r\n        layer.alert(\'删除失败！\',  {icon: 2});\r\n    }\r\n    });\r\n    }\r\n    );', 3, NULL, NULL, b'0', NULL, '2019-02-07 21:33:10', NULL, '2019-02-07 23:13:52');
INSERT INTO `s_base_button` VALUES (15, '新增枚举', 'icon-plus', 'btn btn-sm btn-primary', 'layer.open({\r\n        type: 2,\r\n        title: \'新增枚举\',\r\n        shadeClose: false,\r\n        shade: 0.8,\r\n        area: [\'800px\', \'90%\'],\r\n        content: \'/admin/selectItem/create.html\'\r\n        });', 1, NULL, NULL, b'0', NULL, '2019-02-07 23:13:42', NULL, '2019-02-07 23:17:26');
INSERT INTO `s_base_button` VALUES (16, '修改枚举', 'icon-save', 'btn btn-sm btn-info', 'var selectedIds = getSelectionMessage(\'id\');\r\n    console.log(selectedIds);\r\n            if(selectedIds.length != 1) {\r\n            layer.msg(\"请选择一项！\", function(){});\r\n            return ;\r\n            }\r\n            window.open(selectedIds[0].id + \'/update.html\');', 2, NULL, NULL, b'0', NULL, '2019-02-07 23:14:08', NULL, '2019-02-07 23:17:54');
INSERT INTO `s_base_button` VALUES (17, '删除枚举', 'icon-trash', 'btn btn-sm btn-danger', 'var formId = $(\'#formId\').val();\r\n    var selectedIds = getSelectionMessage(\'id\');\r\n    console.log(selectedIds);\r\n            if(selectedIds.length === 0) {\r\n            layer.msg(\"至少选择一项！\", function(){});\r\n            return ;\r\n            }\r\n            var ids=[];\r\n            for ( var i = 0; i < selectedIds.length; i++) {\r\n        ids.push(selectedIds[i].id);\r\n        }\r\n        layer.confirm(\'确定删除选中记录?\', {\r\n        icon : 3,\r\n        btn : [ \'确定\', \'取消\' ] },\r\n        function() {\r\n        $.ajax({\r\n        url: \'/admin/selectItem/batch_delete\',\r\n        contentType: \'application/json;charset=utf-8\',\r\n        type: \'put\',\r\n        dataType: \'json\',\r\n        data:JSON.stringify(ids),\r\n        success: function (data) {\r\n        layer.closeAll();\r\n        refreshTable();\r\n        },\r\n        error:function(){\r\n        layer.alert(\'删除失败！\',  {icon: 2});\r\n        }\r\n        });\r\n        }\r\n        );', 3, NULL, NULL, b'0', NULL, '2019-02-07 23:14:24', NULL, '2019-02-07 23:18:52');
INSERT INTO `s_base_button` VALUES (18, '确定', 'icon-save', 'btn btn-sm btn-primary', 'var data=$table.bootstrapTable(\"getAllSelections\");\nif(data.length==0){\n   layer.msg(\"未选择任何项！\",function(){});\n   return ;\n}\nif(data.length>1){\n    layer.msg(\"只能选择一个枚举\",function(){});\n    return;\n}\nvar postData={\n   data:data\n}\nconsole.log(data);\nif(parent.window.handleRelevance){\n    parent.window.handleRelevance(postData);\n    layerIndex=parent.layer.getFrameIndex(window.name);\n    parent.layer.close(layerIndex)\n}', 1, NULL, '关联选择枚举', b'0', NULL, '2019-02-08 10:36:17', NULL, '2019-02-08 10:37:15');
INSERT INTO `s_base_button` VALUES (19, '新增权限', 'icon-plus', 'btn btn-sm btn-primary', 'layer.open({\r\n        type: 2,\r\n        title: \'新增权限\',\r\n        shadeClose: false,\r\n        shade: 0.8,\r\n        area: [\'800px\', \'90%\'],\r\n        content: \'/admin/resources/create.html\'\r\n        });', 1, NULL, NULL, b'0', NULL, '2019-02-08 11:53:05', NULL, '2019-02-08 11:53:42');
INSERT INTO `s_base_button` VALUES (20, '修改权限', 'icon-save', 'btn btn-sm btn-info', 'var selectedIds = getSelectionMessage(\'id\');\n    console.log(selectedIds);\n            if(selectedIds.length != 1) {\n            layer.msg(\"请选择一项！\", function(){});\n            return ;\n            }\n            window.open(selectedIds[0].id + \'/update.html\');', 2, NULL, '修改权限', b'0', NULL, '2019-02-08 11:54:44', NULL, '2019-05-03 02:06:19');
INSERT INTO `s_base_button` VALUES (21, '删除权限', 'icon-trash', 'btn btn-sm btn-danger', 'var formId = $(\'#formId\').val();\n    var selectedIds = getSelectionMessage(\'id\');\n    console.log(selectedIds);\n            if(selectedIds.length === 0) {\n            layer.msg(\"至少选择一项！\", function(){});\n            return ;\n            }\n            var ids=[];\n            for ( var i = 0; i < selectedIds.length; i++) {\n        ids.push(selectedIds[i].id);\n        }\n        layer.confirm(\'确定删除选中记录?\', {\n        icon : 3,\n        btn : [ \'确定\', \'取消\' ] },\n        function() {\n        $.ajax({\n        url: \'/admin/resources/batch_delete\',\n        contentType: \'application/json;charset=utf-8\',\n        type: \'put\',\n        dataType: \'json\',\n        data:JSON.stringify(ids),\n        success: function (data) {\n        layer.closeAll();\n        refreshTable();\n        },\n        error:function(){\n        layer.alert(\'删除失败！\',  {icon: 2});\n        }\n        });\n        }\n        );', 3, NULL, '删除权限', b'0', NULL, '2019-02-08 11:55:19', NULL, '2019-05-03 02:06:35');
INSERT INTO `s_base_button` VALUES (22, '刷新表单', 'refresh', 'layui-icon layui-icon-refresh', 'refresh();\r\n                layer.msg(\'刷新成功\');', 1, NULL, '刷新表单', b'0', NULL, '2020-04-05 16:20:35', NULL, '2020-04-05 19:18:56');
INSERT INTO `s_base_button` VALUES (23, '增加表单', 'add', 'layui-icon layui-icon-add-1', '//跳转到新增页面\r\n                layer.open({\r\n                    type: 2\r\n                    ,title: \'新增表单\'\r\n                    ,content: [\'/admin/form/create.html?id=\', \'no\']\r\n                    ,maxmin: true\r\n                    ,area: [\'550px\', \'550px\']\r\n                    ,btn: [\'确定\', \'取消\']\r\n                    ,yes: function (index, layro) {\r\n                        var submit = layro.find(\'iframe\').contents().find(\'#modifyBtn\');\r\n                        submit.click();\r\n                        layer.msg(\"新增成功\");\r\n                    }\r\n                });', 2, NULL, '增加表单', b'0', NULL, '2020-04-05 16:24:59', NULL, '2020-04-05 16:24:59');
INSERT INTO `s_base_button` VALUES (24, '修改表单', 'update', 'layui-icon layui-icon-edit', 'if(data.length === 0){\r\n                    layer.msg(\'请选择一行\');\r\n                } else if(data.length > 1){\r\n                    layer.msg(\'只能同时修改一个\');\r\n                } else {\r\n                    //跳转到修改页面\r\n                    var index = layer.open({\r\n                        type: 2\r\n                        ,title: \'修改表单\'\r\n                        ,content: \'/admin/form/\' + checkStatus.data[0].id + \'/update.html\'\r\n                        ,maxmin: true\r\n                        ,area: [\'550px\', \'550px\']\r\n                        ,btn: [\'确定\', \'取消\']\r\n                        ,yes: function (index, layro) {\r\n                            var submit = layro.find(\'iframe\').contents().find(\'#modifyBtn\');\r\n                            submit.click();\r\n                            layer.msg(\'修改成功\');\r\n                        }\r\n                    });\r\n                    //窗口默认最大化\r\n                    layer.full(index);\r\n                }', 3, NULL, '修改表单', b'0', NULL, '2020-04-05 16:25:44', NULL, '2020-04-05 16:25:44');
INSERT INTO `s_base_button` VALUES (25, '删除表单', 'delete', 'layui-icon layui-icon-delete', 'if(data.length === 0){\r\n                    layer.msg(\'请选择一行\');\r\n                } else {\r\n                    //先获取要删除的行\r\n                    var dataList = checkStatus.data,\r\n                        deleteParam = [];\r\n                    for (var i = 0; i < dataList.length; i++){\r\n                        deleteParam.push(dataList[i].id);\r\n                    }\r\n                    //开始删除\r\n	   //弹出提示框\r\n                    layer.open({\r\n                        type: 1\r\n                        ,title: \'提示\'\r\n                        ,content: \'是否删除所选列\'\r\n                        ,btn: [\'确定\', \'取消\']\r\n                        ,yes: function (index, layro) {\r\n                            $.ajax({\r\n                        type: \'put\'\r\n                        , url: \'/admin/form/batch_delete\'\r\n                        , contentType: \'application/json;charset=utf-8\'\r\n                        , dataType: \'json\'\r\n                        , data: JSON.stringify(deleteParam)\r\n                        , success: function (data) {\r\n                            switch (data.code) {\r\n                                case 200:\r\n                                    refresh();\r\n                                    layer.msg(\'删除成功\');\r\n                                    break;\r\n                            }\r\n                        }\r\n                    });\r\n                            layer.close(index);\r\n                        },no: function (index, layro) {\r\n                            // break;\r\n                        }\r\n                    });\r\n                }', 4, NULL, '删除表单', b'0', NULL, '2020-04-05 16:26:50', NULL, '2020-04-05 19:58:57');
INSERT INTO `s_base_button` VALUES (26, '搜索表单', 'search', 'layui-icon layui-icon-search', '//展开搜索项\r\n                $(\"#ojbk-search\").show();', 5, NULL, '搜索表单', b'0', NULL, '2020-04-05 16:27:28', NULL, '2020-04-05 16:27:28');

-- ----------------------------
-- Table structure for s_base_form
-- ----------------------------
DROP TABLE IF EXISTS `s_base_form`;
CREATE TABLE `s_base_form`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '全局id',
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `collection` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '数据库表名',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT b'0' COMMENT '是否已删除',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 235 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_base_form
-- ----------------------------
INSERT INTO `s_base_form` VALUES (202, '32bbe754dc4811e89ad3ace2d34b4464', '表单表', 's_base_form', '表单表', b'0', NULL, '2018-10-30 21:31:50', NULL, '2018-10-30 21:31:50');
INSERT INTO `s_base_form` VALUES (203, '81e26547dcb611e89ad3ace2d34b4464', '表单字段表', 's_base_form_field', '表单字段表', b'0', NULL, '2018-10-31 10:41:33', NULL, '2018-10-31 10:41:33');
INSERT INTO `s_base_form` VALUES (207, '917aeb04e3cc11e88eebace2d34b4464', '系统枚举表', 's_base_select_item', '系统枚举表', b'0', NULL, '2018-11-09 11:07:03', NULL, '2018-11-09 11:07:03');
INSERT INTO `s_base_form` VALUES (215, 'bf57ca8ae65311e88eebace2d34b4464', '资源表', 's_base_resources', '资源表', b'0', NULL, '2018-11-12 16:19:16', NULL, '2018-11-12 16:19:16');
INSERT INTO `s_base_form` VALUES (217, '709f7c1fb71d4cebab5e3781882a23a6', '角色资源表', 's_base_role_resources', '角色资源表', b'0', NULL, '2018-11-13 10:27:38', NULL, '2018-11-13 10:27:38');
INSERT INTO `s_base_form` VALUES (218, '490e509684e84a79a9f4c2be76ee584e', '角色表', 's_base_role', '角色表', b'0', NULL, '2018-11-13 11:02:04', NULL, '2018-11-13 11:02:04');
INSERT INTO `s_base_form` VALUES (219, '85794bb0ba964fa191141f5d01f739e6', '用户表', 's_base_user', '用户表', b'0', NULL, '2018-11-15 19:41:00', NULL, '2018-11-15 19:41:00');
INSERT INTO `s_base_form` VALUES (220, '7b450cd58e61445db64878f846d7ed96', '用户角色表', 's_base_user_role', '用户角色表', b'0', NULL, '2018-11-23 18:51:22', NULL, '2018-11-23 18:51:22');
INSERT INTO `s_base_form` VALUES (221, '5c484fc7300d4fdda5b85d1b77798e09', '菜单表', 's_base_menu', '菜单表', b'0', NULL, '2018-11-29 21:51:54', NULL, '2018-11-29 21:51:54');
INSERT INTO `s_base_form` VALUES (222, '6eb14f7959b4488d842e276a88e7ab26', '角色菜单表', 's_base_role_menu', '角色菜单表', b'0', NULL, '2018-12-02 20:01:36', NULL, '2018-12-02 20:01:36');
INSERT INTO `s_base_form` VALUES (223, 'f40bc7660a894fa6912d2f1d804ce695', '按钮表', 's_base_button', '按钮表', b'0', NULL, '2018-12-04 19:51:24', NULL, '2018-12-04 19:51:24');
INSERT INTO `s_base_form` VALUES (224, '66851e8e2ae74768a5e316c7741c6a58', '角色按钮表', 's_base_role_button', '角色按钮表', b'0', NULL, '2018-12-04 20:50:13', NULL, '2018-12-04 20:50:13');
INSERT INTO `s_base_form` VALUES (225, '4bb1b4ef90014ce7addc2c321e38853a', '菜单按钮表', 's_base_menu_button', '菜单按钮表', b'0', NULL, '2018-12-06 14:58:49', NULL, '2018-12-06 14:58:49');
INSERT INTO `s_base_form` VALUES (226, 'dfff048bc980475396b3a7536c6b5943', '附件表', 'c_business_annex', '附件表', b'0', NULL, '2018-12-14 16:23:44', NULL, '2018-12-14 16:23:44');
INSERT INTO `s_base_form` VALUES (227, '1251094882f54ccfa2177066dcdacdc6', 'socket消息表', 'c_business_socket_message', 'socket消息表', b'0', NULL, '2018-12-25 10:05:47', NULL, '2018-12-25 10:05:47');
INSERT INTO `s_base_form` VALUES (234, 'fcde987556664fa29443c12586e29e79', '测试表单', 'c_business_test', '测试表单233', b'0', NULL, '2019-02-03 16:25:42', NULL, '2019-02-03 16:25:42');

-- ----------------------------
-- Table structure for s_base_form_field
-- ----------------------------
DROP TABLE IF EXISTS `s_base_form_field`;
CREATE TABLE `s_base_form_field`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '全局id',
  `form_id` bigint(20) DEFAULT NULL COMMENT '所属表单id',
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `field_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字段名--数据库字段名',
  `field_type` bigint(20) DEFAULT NULL COMMENT '字段类型',
  `show_type` bigint(20) DEFAULT NULL COMMENT '展示类型',
  `required` bit(1) DEFAULT b'0' COMMENT '是否必填',
  `default_value` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '默认值',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT b'0' COMMENT '是否已删除',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1607 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_base_form_field
-- ----------------------------
INSERT INTO `s_base_form_field` VALUES (1340, 'c30106496c3e4bf38188fe0ba677318d', 202, '标题', 'title', 100305, 100205, b'0', NULL, '标题', b'0', NULL, '2018-11-12 20:45:44', NULL, '2018-11-12 20:45:44');
INSERT INTO `s_base_form_field` VALUES (1341, '9169d4de8fbb46f09ba696b493f95a48', 202, '数据库表名', 'collection', 100305, 100205, b'0', NULL, '数据库表名', b'0', NULL, '2018-11-12 20:45:44', NULL, '2018-11-12 20:45:44');
INSERT INTO `s_base_form_field` VALUES (1342, 'ef69e13f4e4046daa7d7d6c727daccd8', 203, '所属表单id', 'form_id', 100301, 100201, b'0', NULL, '所属表单id', b'0', NULL, '2018-11-12 20:46:39', NULL, '2018-11-12 20:46:39');
INSERT INTO `s_base_form_field` VALUES (1343, '738a2f22a26c4b17a4069a71ec861f03', 203, '标题', 'title', 100305, 100205, b'0', NULL, '标题', b'0', NULL, '2018-11-12 20:46:39', NULL, '2018-11-12 20:46:39');
INSERT INTO `s_base_form_field` VALUES (1344, '1255983a0ccb410ea40faa3c85834189', 203, '字段名', 'field_name', 100305, 100205, b'0', NULL, '字段名--数据库字段名', b'0', NULL, '2018-11-12 20:46:39', NULL, '2018-11-12 20:46:39');
INSERT INTO `s_base_form_field` VALUES (1345, '1811f6a3e1a742248bc1c74a58abeef8', 203, '字段类型', 'field_type', 100301, 100201, b'0', NULL, '字段类型', b'0', NULL, '2018-11-12 20:46:39', NULL, '2018-11-12 20:46:39');
INSERT INTO `s_base_form_field` VALUES (1346, '94a3f7a88a114de794e8680fe6a817de', 203, '展示类型', 'show_type', 100301, 100201, b'0', NULL, '展示类型', b'0', NULL, '2018-11-12 20:46:39', NULL, '2018-11-12 20:46:39');
INSERT INTO `s_base_form_field` VALUES (1347, '35ef3fbea8b743cb913f431815251c85', 203, '是否必填', 'required', 100309, 100206, b'0', 'b\'0\'', '是否必填', b'0', NULL, '2018-11-12 20:46:39', NULL, '2018-11-12 20:46:39');
INSERT INTO `s_base_form_field` VALUES (1348, '0a2c07d74b10406ba31cb3cf7aa6b7a4', 203, '默认值', 'default_value', 100305, 100205, b'0', NULL, '默认值', b'0', NULL, '2018-11-12 20:46:39', NULL, '2018-11-12 20:46:39');
INSERT INTO `s_base_form_field` VALUES (1349, 'a37967d8a2e04e249c12f824cb3ab383', 207, '标题', 'title', 100305, 100205, b'1', NULL, '标题', b'0', NULL, '2018-11-12 20:52:54', NULL, '2018-11-12 20:52:54');
INSERT INTO `s_base_form_field` VALUES (1350, '8fac1b653e394376a0bb75c1c91c8933', 207, '父级', 'pid', 100301, 100201, b'0', NULL, '父级', b'0', NULL, '2018-11-12 20:52:54', NULL, '2018-11-12 20:52:54');
INSERT INTO `s_base_form_field` VALUES (1351, 'de5f067ca6f4425db6f9a207eab5dfb5', 207, '选择项值', 'item_value', 100305, 100205, b'0', NULL, '选择项值', b'0', NULL, '2018-11-12 20:52:54', NULL, '2018-11-12 20:52:54');
INSERT INTO `s_base_form_field` VALUES (1352, 'f6c25e5f005a4dc29721aeef2f979af1', 207, '排序字段', 'sort', 100312, 100208, b'0', '1', '排序字段', b'0', NULL, '2018-11-12 20:52:54', NULL, '2018-11-12 20:52:54');
INSERT INTO `s_base_form_field` VALUES (1353, '33bb8524b04649bdb08ba3f033f9a62f', 215, '资源标题', 'title', 100305, 100205, b'0', NULL, '资源标题', b'0', NULL, '2018-11-12 20:54:01', NULL, '2018-11-12 20:54:01');
INSERT INTO `s_base_form_field` VALUES (1354, '0acfea0d8a6a47a3b556bd4185832857', 215, '资源url', 'url', 100306, 100205, b'0', NULL, '资源url', b'0', NULL, '2018-11-12 20:54:01', NULL, '2018-11-12 20:54:01');
INSERT INTO `s_base_form_field` VALUES (1355, '352dd6bf9f4f46628e716b12e48737a1', 217, '角色id', 'role_id', 100301, 100201, b'1', NULL, '角色id', b'0', NULL, '2018-11-13 10:30:10', NULL, '2018-11-13 10:30:10');
INSERT INTO `s_base_form_field` VALUES (1356, 'e4317e81bbd0458c9fddcc1a018b3a9c', 217, '资源id', 'resources_id', 100301, 100201, b'1', NULL, '资源id', b'0', NULL, '2018-11-13 10:30:10', NULL, '2018-11-13 10:30:10');
INSERT INTO `s_base_form_field` VALUES (1357, '53a741d37cda4c21967b0e7e1cd2dfc6', 218, '角色名', 'role_desc', 100305, 100205, b'0', NULL, '角色名', b'0', NULL, '2018-11-13 11:02:44', NULL, '2018-11-13 11:02:44');
INSERT INTO `s_base_form_field` VALUES (1358, '39f04d4c496a4f2cbb05a4797d2f4fc4', 218, '父角色id', 'pid', 100301, 100201, b'0', NULL, '父角色id', b'0', NULL, '2018-11-13 11:02:44', NULL, '2018-11-13 11:02:44');
INSERT INTO `s_base_form_field` VALUES (1359, '3169cea1c0bc40358a6521c35eab7e07', 219, '头像', 'avatar', 100303, 100203, b'0', NULL, '头像', b'0', NULL, '2018-11-15 19:42:13', NULL, '2018-11-15 19:42:13');
INSERT INTO `s_base_form_field` VALUES (1360, '736a3e89545f43abaa583ce531f1bc60', 219, '账号', 'account', 100305, 100205, b'0', NULL, '账号', b'0', NULL, '2018-11-15 19:42:13', NULL, '2018-11-15 19:42:13');
INSERT INTO `s_base_form_field` VALUES (1361, '545bd5ed23024a868be69532cbc8ee0f', 219, '密码', 'password', 100305, 100205, b'0', NULL, '密码', b'0', NULL, '2018-11-15 19:42:13', NULL, '2018-11-15 19:42:13');
INSERT INTO `s_base_form_field` VALUES (1362, 'ab169b1d8de84dd89d197962cb28a973', 219, '名字', 'user_name', 100305, 100205, b'0', NULL, '名字', b'0', NULL, '2018-11-15 19:42:13', NULL, '2018-11-15 19:42:13');
INSERT INTO `s_base_form_field` VALUES (1363, 'd327c6fee4734c88ab2322b60f615b89', 219, '生日', 'birthday', 100304, 100204, b'0', NULL, '生日', b'1', NULL, '2018-11-15 19:42:13', NULL, '2018-11-15 19:42:13');
INSERT INTO `s_base_form_field` VALUES (1364, 'f2127d443e9c4a818be925d2503bf380', 219, '性别', 'sex', 100301, 100201, b'0', NULL, '性别', b'0', NULL, '2018-11-15 19:42:13', NULL, '2018-11-15 19:42:13');
INSERT INTO `s_base_form_field` VALUES (1365, 'd89fe5e1fc19423da8181a24561c61bd', 219, '电子邮件', 'email', 100305, 100205, b'0', NULL, '电子邮件', b'0', NULL, '2018-11-15 19:42:13', NULL, '2018-11-15 19:42:13');
INSERT INTO `s_base_form_field` VALUES (1366, '1be4d3e7be8f4476b734902169f49416', 219, '电话', 'phone', 100305, 100205, b'0', NULL, '电话', b'0', NULL, '2018-11-15 19:42:13', NULL, '2018-11-15 19:42:13');
INSERT INTO `s_base_form_field` VALUES (1367, '42ef9e2364df4f9a9c165f7fb0a1799e', 220, '用户id', 'user_id', 100301, 100201, b'0', NULL, '用户id', b'0', NULL, '2018-11-23 18:51:46', NULL, '2018-11-23 18:51:46');
INSERT INTO `s_base_form_field` VALUES (1368, 'b67a83b4b9de4e2796bedbf1f521b80d', 220, '角色id', 'role_id', 100301, 100201, b'0', NULL, '角色id', b'0', NULL, '2018-11-23 18:51:46', NULL, '2018-11-23 18:51:46');
INSERT INTO `s_base_form_field` VALUES (1369, 'e9369318c14b486f9ddb8a2a5d6f67e6', 221, '菜单名称', 'name', 100305, 100205, b'0', NULL, '菜单名称', b'0', NULL, '2018-11-29 21:52:22', NULL, '2018-11-29 21:52:22');
INSERT INTO `s_base_form_field` VALUES (1370, '43e8af8531f04c48ae7acdae55964360', 221, '按钮样式', 'style', 100305, 100205, b'0', NULL, '按钮样式', b'0', NULL, '2018-11-29 21:52:22', NULL, '2018-11-29 21:52:22');
INSERT INTO `s_base_form_field` VALUES (1371, '88eb27622c33466e835e68ec6056c3a5', 221, '菜单图标', 'icon', 100303, 100203, b'0', NULL, '菜单图标', b'0', NULL, '2018-11-29 21:52:22', NULL, '2018-11-29 21:52:22');
INSERT INTO `s_base_form_field` VALUES (1372, '600c555e1667420d9145a4a99429fafb', 221, 'url地址', 'url', 100306, 100205, b'0', NULL, 'url地址', b'0', NULL, '2018-11-29 21:52:22', NULL, '2018-11-29 21:52:22');
INSERT INTO `s_base_form_field` VALUES (1373, 'aa1e1acbb4484c98bb8a6c05206a9e8b', 221, '菜单排序号', 'num', 100312, 100208, b'0', '1', '菜单排序号', b'0', NULL, '2018-11-29 21:52:22', NULL, '2018-11-29 21:52:22');
INSERT INTO `s_base_form_field` VALUES (1374, '6f4970e238544a33b1827a88c2920d7f', 221, '菜单父级id', 'pid', 100301, 100201, b'0', NULL, '菜单父级id', b'0', NULL, '2018-11-29 21:52:22', NULL, '2018-11-29 21:52:22');
INSERT INTO `s_base_form_field` VALUES (1375, '4375c4afed9d49ff8da2d894641de3ab', 221, '打开方式', 'open_mode', 100301, 100201, b'0', NULL, '打开方式', b'0', NULL, '2018-11-29 21:52:22', NULL, '2018-11-29 21:52:22');
INSERT INTO `s_base_form_field` VALUES (1376, '71927001e63e497c9d2a76e984dad256', 222, '角色id', 'role_id', 100301, 100201, b'1', NULL, '角色id', b'0', NULL, '2018-12-02 20:01:55', NULL, '2018-12-02 20:01:55');
INSERT INTO `s_base_form_field` VALUES (1377, '2aa621d2af7f482eb73c013bb03e9a05', 222, '菜单id', 'menu_id', 100301, 100201, b'1', NULL, '菜单id', b'0', NULL, '2018-12-02 20:01:55', NULL, '2018-12-02 20:01:55');
INSERT INTO `s_base_form_field` VALUES (1378, 'cb57d34e733c4e80b8c6c6fc48cd5b7b', 223, '按钮名称', 'title', 100305, 100205, b'0', NULL, '按钮名称', b'0', NULL, '2018-12-04 19:51:42', NULL, '2018-12-04 19:51:42');
INSERT INTO `s_base_form_field` VALUES (1379, '5145cdedefcb41d6bb16e5e46a52efe2', 223, '按钮图标', 'icon', 100305, 100205, b'0', NULL, '按钮图标', b'0', NULL, '2018-12-04 19:51:42', NULL, '2018-12-04 19:51:42');
INSERT INTO `s_base_form_field` VALUES (1380, 'c944a46539d94aa394b4a2ca88816f21', 223, '按钮类名', 'class_name', 100305, 100205, b'0', NULL, '按钮类名', b'0', NULL, '2018-12-04 19:51:42', NULL, '2018-12-04 19:51:42');
INSERT INTO `s_base_form_field` VALUES (1381, '3574d1fb10f7480199dab896fe84861e', 223, '按钮脚本', 'script', 100302, 100202, b'0', NULL, '按钮脚本', b'0', NULL, '2018-12-04 19:51:42', NULL, '2018-12-04 19:51:42');
INSERT INTO `s_base_form_field` VALUES (1382, '9f6c4bfdb19b4391bcb6d8986dfa23ff', 223, '按钮排序号', 'num', 100312, 100208, b'0', '0', '按钮排序号', b'0', NULL, '2018-12-04 19:51:42', NULL, '2018-12-04 19:51:42');
INSERT INTO `s_base_form_field` VALUES (1383, 'dec3e07ef2e24bc9ac125495e4e4a1e9', 224, '角色id', 'role_id', 100301, 100201, b'1', NULL, '角色id', b'0', NULL, '2018-12-04 20:50:30', NULL, '2018-12-04 20:50:30');
INSERT INTO `s_base_form_field` VALUES (1384, 'e9ded76c7d4b431fa20c964769c276df', 224, '按钮id', 'button_id', 100301, 100201, b'1', NULL, '按钮id', b'0', NULL, '2018-12-04 20:50:30', NULL, '2018-12-04 20:50:30');
INSERT INTO `s_base_form_field` VALUES (1385, '1f48c7660003413b8111b84503344c71', 225, '菜单id', 'menu_id', 100301, 100201, b'1', NULL, '菜单id', b'0', NULL, '2018-12-06 14:59:16', NULL, '2018-12-06 14:59:16');
INSERT INTO `s_base_form_field` VALUES (1386, 'f6af195bbccf4d85b96c05190b196623', 225, '按钮id', 'button_id', 100301, 100201, b'1', NULL, '按钮id', b'0', NULL, '2018-12-06 14:59:17', NULL, '2018-12-06 14:59:17');
INSERT INTO `s_base_form_field` VALUES (1387, 'f4037dedec6e4f07ac47e8dff27c0134', 226, '文件名', 'name', 100305, 100205, b'0', NULL, '文件名', b'0', NULL, '2018-12-14 16:24:06', NULL, '2018-12-14 16:24:06');
INSERT INTO `s_base_form_field` VALUES (1388, '48193cfaa727470bb02e2291005e9c35', 226, '文件类型', 'type', 100305, 100205, b'0', NULL, '文件类型', b'0', NULL, '2018-12-14 16:24:06', NULL, '2018-12-14 16:24:06');
INSERT INTO `s_base_form_field` VALUES (1389, '77f6ad1798444229a615735651be410b', 226, '文件后缀', 'extension', 100305, 100205, b'0', NULL, '文件后缀', b'0', NULL, '2018-12-14 16:24:07', NULL, '2018-12-14 16:24:07');
INSERT INTO `s_base_form_field` VALUES (1390, '805ff946befa4b60af5001d2f2bd110b', 226, '文件大小', 'size', 100310, 100207, b'0', '0', '文件大小', b'0', NULL, '2018-12-14 16:24:07', NULL, '2018-12-14 16:24:07');
INSERT INTO `s_base_form_field` VALUES (1391, 'e053dffa1aea46639e6540340158ebea', 226, '文件地址', 'path', 100305, 100205, b'0', NULL, '文件地址', b'0', NULL, '2018-12-14 16:24:07', NULL, '2018-12-14 16:24:07');
INSERT INTO `s_base_form_field` VALUES (1392, '5b998ebe96f946809ea7d100b5401fc8', 226, '文件md5', 'md5', 100305, 100205, b'0', NULL, '文件md5', b'0', NULL, '2018-12-14 16:24:07', NULL, '2018-12-14 16:24:07');
INSERT INTO `s_base_form_field` VALUES (1393, '1158e3f5f08a4bebaa10bc916079fa9c', 226, '消息头', 'content_type', 100305, 100205, b'0', NULL, '消息头', b'0', NULL, '2018-12-14 16:24:07', NULL, '2018-12-14 16:24:07');
INSERT INTO `s_base_form_field` VALUES (1394, '6719c083f78b431f84f5ad4d12f927e7', 227, '消息标题', 'title', 100305, 100205, b'0', NULL, '消息标题', b'0', NULL, '2018-12-25 10:06:18', NULL, '2018-12-25 10:06:18');
INSERT INTO `s_base_form_field` VALUES (1395, 'f2e08ae8d1fa405c84c96c73f9161291', 227, '消息内容', 'content', 100306, 100205, b'0', NULL, '消息内容', b'0', NULL, '2018-12-25 10:06:18', NULL, '2018-12-25 10:06:18');
INSERT INTO `s_base_form_field` VALUES (1396, '61c25641dead4d29b60ae338c7111bb9', 227, '发送消息者', 'sender', 100301, 100201, b'0', NULL, '发送消息者', b'0', NULL, '2018-12-25 10:06:18', NULL, '2018-12-25 10:06:18');
INSERT INTO `s_base_form_field` VALUES (1397, 'cab494fcc91342a0be22ac6c97639bf8', 227, '接受消息者', 'recipient', 100301, 100201, b'0', NULL, '接受消息者', b'0', NULL, '2018-12-25 10:06:18', NULL, '2018-12-25 10:06:18');
INSERT INTO `s_base_form_field` VALUES (1398, '35cbd75b67df4bcc8279209f1d28217f', 227, '消息详情', 'details', 100302, 100202, b'0', NULL, '消息详情', b'0', NULL, '2018-12-25 10:06:18', NULL, '2018-12-25 10:06:18');
INSERT INTO `s_base_form_field` VALUES (1399, NULL, 219, '用户类型', 'type', 100301, 100201, b'0', NULL, NULL, b'0', NULL, '2018-12-27 15:25:00', NULL, '2018-12-27 15:25:00');
INSERT INTO `s_base_form_field` VALUES (1405, '9a86e7374aba461984d8384621b7ff64', 234, '测试字段', 'test12', 100306, 100205, b'1', '0', '测试字段233', b'0', NULL, '2019-02-04 11:39:44', NULL, '2019-02-04 11:39:44');
INSERT INTO `s_base_form_field` VALUES (1605, '663af92af0ab4416b5e1b9e7e31062c1', 219, '学校住址', 'school_address', 100301, 100201, b'0', NULL, '学校住址', b'0', NULL, '2019-04-08 22:18:20', NULL, '2019-04-08 22:18:20');
INSERT INTO `s_base_form_field` VALUES (1606, 'f889ba12fb9c4eaf8afdc6956c4c506a', 219, '余额', 'balance', 100310, 100207, b'0', '0', '余额', b'0', NULL, '2019-05-18 13:36:37', NULL, '2019-05-18 13:36:37');

-- ----------------------------
-- Table structure for s_base_menu
-- ----------------------------
DROP TABLE IF EXISTS `s_base_menu`;
CREATE TABLE `s_base_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单名称',
  `style` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '按钮样式',
  `icon` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单图标',
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT 'url地址',
  `num` int(11) DEFAULT 1 COMMENT '菜单排序号',
  `pid` bigint(20) DEFAULT NULL COMMENT '菜单父级id',
  `open_mode` bigint(20) DEFAULT NULL COMMENT '打开方式',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '全局id',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT b'0' COMMENT '是否已删除',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 185 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_base_menu
-- ----------------------------
INSERT INTO `s_base_menu` VALUES (105, '系统管理', NULL, 'fa-user', '#', 4, 1, 1, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2018-12-14 14:44:14');
INSERT INTO `s_base_menu` VALUES (106, '用户管理', NULL, '', '/mgr', 1, 2, 0, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:02');
INSERT INTO `s_base_menu` VALUES (107, '添加用户', NULL, NULL, '/mgr/add', 1, 3, 0, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:02');
INSERT INTO `s_base_menu` VALUES (108, '修改用户', NULL, NULL, '/mgr/edit', 2, 3, 0, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:02');
INSERT INTO `s_base_menu` VALUES (109, '删除用户', NULL, NULL, '/mgr/delete', 3, 3, 0, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:02');
INSERT INTO `s_base_menu` VALUES (110, '重置密码', NULL, NULL, '/mgr/reset', 4, 3, 0, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:02');
INSERT INTO `s_base_menu` VALUES (111, '冻结用户', NULL, NULL, '/mgr/freeze', 5, 3, 0, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (112, '解除冻结用户', NULL, NULL, '/mgr/unfreeze', 6, 3, 0, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (113, '分配角色', NULL, NULL, '/mgr/setRole', 7, 3, 0, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (114, '角色管理', NULL, NULL, '/role', 2, 2, 0, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (115, '添加角色', NULL, NULL, '/role/add', 1, 3, 0, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (116, '修改角色', NULL, NULL, '/role/edit', 2, 3, 0, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (117, '删除角色', NULL, NULL, '/role/remove', 3, 3, 0, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (118, '配置权限', NULL, NULL, '/role/setAuthority', 4, 3, 0, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (119, '菜单管理', NULL, NULL, '/menu', 4, 2, 0, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (120, '添加菜单', NULL, NULL, '/menu/add', 1, 3, 0, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (121, '修改菜单', NULL, NULL, '/menu/edit', 2, 3, 0, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (122, '删除菜单', NULL, NULL, '/menu/remove', 3, 3, 0, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (128, '业务日志', NULL, NULL, '/log', 6, 2, 0, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (130, '监控管理', NULL, NULL, '/druid', 7, 2, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (131, '部门管理', NULL, NULL, '/dept', 3, 2, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (132, '字典管理', NULL, NULL, '/dict', 4, 2, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (133, '登录日志', NULL, NULL, '/loginLog', 6, 2, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (134, '清空日志', NULL, NULL, '/log/delLog', 3, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (135, '添加部门', NULL, NULL, '/dept/add', 1, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (136, '修改部门', NULL, NULL, '/dept/update', 1, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (137, '删除部门', NULL, NULL, '/dept/delete', 1, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (138, '添加字典', NULL, NULL, '/dict/add', 1, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (139, '修改字典', NULL, NULL, '/dict/update', 1, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (140, '删除字典', NULL, NULL, '/dict/delete', 1, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (141, '通知管理', NULL, NULL, '/notice', 9, 2, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (142, '添加通知', NULL, NULL, '/notice/add', 1, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (143, '修改通知', NULL, NULL, '/notice/update', 2, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (144, '删除通知', NULL, NULL, '/notice/delete', 3, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:03');
INSERT INTO `s_base_menu` VALUES (145, '通知', NULL, 'fa-rocket', '/notice/hello', 1, 1, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:04');
INSERT INTO `s_base_menu` VALUES (148, '代码生成', NULL, 'fa-code', '/code', 3, 1, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:04');
INSERT INTO `s_base_menu` VALUES (149, '接口文档', NULL, 'fa-leaf', '/swagger-ui.html', 2, 1, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:04');
INSERT INTO `s_base_menu` VALUES (150, '菜单编辑跳转', NULL, '', '/menu/menu_edit', 4, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:04');
INSERT INTO `s_base_menu` VALUES (151, '菜单列表', NULL, '', '/menu/list', 5, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:04');
INSERT INTO `s_base_menu` VALUES (152, '修改部门跳转', NULL, '', '/dept/dept_update', 4, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:04');
INSERT INTO `s_base_menu` VALUES (153, '部门列表', NULL, '', '/dept/list', 5, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:04');
INSERT INTO `s_base_menu` VALUES (154, '部门详情', NULL, '', '/dept/detail', 6, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:04');
INSERT INTO `s_base_menu` VALUES (155, '修改菜单跳转', NULL, '', '/dict/dict_edit', 4, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:04');
INSERT INTO `s_base_menu` VALUES (156, '字典列表', NULL, '', '/dict/list', 5, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:04');
INSERT INTO `s_base_menu` VALUES (157, '字典详情', NULL, '', '/dict/detail', 6, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:04');
INSERT INTO `s_base_menu` VALUES (158, '日志列表', NULL, '', '/log/list', 2, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:04');
INSERT INTO `s_base_menu` VALUES (159, '日志详情', NULL, '', '/log/detail', 3, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:04');
INSERT INTO `s_base_menu` VALUES (160, '清空登录日志', NULL, '', '/loginLog/delLoginLog', 1, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:04');
INSERT INTO `s_base_menu` VALUES (161, '登录日志列表', NULL, '', '/loginLog/list', 2, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:04');
INSERT INTO `s_base_menu` VALUES (162, '修改角色跳转', NULL, '', '/role/role_edit', 5, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:04');
INSERT INTO `s_base_menu` VALUES (163, '角色分配跳转', NULL, '', '/role/role_assign', 6, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:04');
INSERT INTO `s_base_menu` VALUES (164, '角色列表', NULL, '', '/role/list', 7, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:04');
INSERT INTO `s_base_menu` VALUES (165, '分配角色跳转', NULL, '', '/mgr/role_assign', 8, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:04');
INSERT INTO `s_base_menu` VALUES (166, '编辑用户跳转', NULL, '', '/mgr/user_edit', 9, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:04');
INSERT INTO `s_base_menu` VALUES (167, '用户列表', NULL, '', '/mgr/list', 10, 3, NULL, NULL, NULL, b'1', NULL, '2018-09-20 15:57:21', NULL, '2019-02-05 18:00:04');
INSERT INTO `s_base_menu` VALUES (168, '系统管理', NULL, 'layui-icon-set-fill', NULL, 1, NULL, NULL, '12d04dc18e614858a5a0af1ed9909510', NULL, b'0', NULL, '2018-11-30 21:32:07', NULL, '2020-01-26 18:53:32');
INSERT INTO `s_base_menu` VALUES (169, '表单管理', NULL, 'icon-th-list\r\n', '/admin/form/tabulation.html', 1, 168, NULL, NULL, NULL, b'0', NULL, '2019-01-29 22:24:28', NULL, '2019-01-29 23:07:33');
INSERT INTO `s_base_menu` VALUES (170, '字段管理', NULL, NULL, '/admin/formField/tabulation.html', 1, 169, NULL, NULL, NULL, b'0', NULL, '2019-01-31 21:18:18', NULL, '2019-01-31 21:19:03');
INSERT INTO `s_base_menu` VALUES (171, '菜单管理', NULL, 'icon-th-list', '/admin/menu/tabulation.html', 2, 168, NULL, NULL, NULL, b'0', NULL, '2019-02-04 13:30:14', NULL, '2019-11-28 17:07:33');
INSERT INTO `s_base_menu` VALUES (176, '用户管理', NULL, 'icon-th-list\r\n', '/admin/user/tabulation.html', 3, 168, NULL, NULL, NULL, b'0', NULL, '2019-02-05 23:37:58', NULL, '2019-02-05 23:38:29');
INSERT INTO `s_base_menu` VALUES (177, '角色管理', NULL, 'icon-th-list\r\n', '/admin/role/tabulation.html', 4, 168, NULL, NULL, NULL, b'0', NULL, '2019-02-07 20:10:49', NULL, '2019-02-08 19:26:41');
INSERT INTO `s_base_menu` VALUES (178, '按钮管理', NULL, 'icon-th-list\r\n', '/admin/button/tabulation.html', 5, 168, NULL, NULL, NULL, b'0', NULL, '2019-02-07 20:11:43', NULL, '2019-02-07 20:12:01');
INSERT INTO `s_base_menu` VALUES (179, '枚举管理', NULL, 'icon-th-list\r\n', '/admin/selectItem/tabulation.html', 6, 168, NULL, NULL, NULL, b'0', NULL, '2019-02-07 23:15:14', NULL, '2019-02-07 23:15:45');
INSERT INTO `s_base_menu` VALUES (180, '父级枚举管理', NULL, NULL, '/admin/selectItem/tabulation.html', 1, 179, NULL, NULL, NULL, b'0', NULL, '2019-02-08 10:26:38', NULL, '2019-02-08 10:26:50');
INSERT INTO `s_base_menu` VALUES (181, '权限管理', NULL, 'icon-th-list\r\n', '/admin/resources/tabulation.html', 7, 168, NULL, NULL, NULL, b'0', NULL, '2019-02-08 11:40:52', NULL, '2019-02-08 11:41:12');
INSERT INTO `s_base_menu` VALUES (182, '数据管理', NULL, 'layui-icon-template-1', NULL, 2, NULL, NULL, 'bfbfb841b7e14bbcb9bd5a52d1f526a7', '数据管理', b'0', NULL, '2019-05-02 19:57:50', NULL, '2020-01-26 18:53:48');
INSERT INTO `s_base_menu` VALUES (183, '测试菜单', NULL, 'javascript:;', 'layui-icon layui-icon-template-1', 1, 182, NULL, '26498b6264014777acc4e661a4d46ead', '测试菜单222', b'0', NULL, '2020-02-11 15:56:32', NULL, '2020-02-11 16:00:05');
INSERT INTO `s_base_menu` VALUES (184, '测试菜单2', NULL, 'javascript:;', '/admin/home.html', 2, 182, NULL, '4e3b0fd3ccd446cf98397a3985049e19', '测试菜单2', b'1', NULL, '2020-02-11 16:03:14', NULL, '2020-02-11 17:27:02');

-- ----------------------------
-- Table structure for s_base_menu_button
-- ----------------------------
DROP TABLE IF EXISTS `s_base_menu_button`;
CREATE TABLE `s_base_menu_button`  (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单id',
  `button_id` bigint(20) NOT NULL COMMENT '按钮id',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '全局id',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT b'0' COMMENT '是否已删除',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`menu_id`, `button_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_base_menu_button
-- ----------------------------
INSERT INTO `s_base_menu_button` VALUES (105, 1, NULL, NULL, b'0', NULL, '2018-12-09 15:24:13', NULL, '2018-12-09 15:24:13');
INSERT INTO `s_base_menu_button` VALUES (105, 2, NULL, NULL, b'0', NULL, '2018-12-09 15:24:16', NULL, '2018-12-09 15:24:16');
INSERT INTO `s_base_menu_button` VALUES (169, 22, 'ca48fa03c3a342d8be8298d0c7ebde4b', NULL, b'0', NULL, '2018-12-10 10:14:12', NULL, '2020-04-05 19:09:58');
INSERT INTO `s_base_menu_button` VALUES (169, 23, 'a5e10f96f711478aacc3f69f6b9ab6ed', NULL, b'0', NULL, '2018-12-10 10:13:30', NULL, '2020-04-05 19:09:59');
INSERT INTO `s_base_menu_button` VALUES (169, 24, 'dfa6bb933aaa458eafb190d7c914e3e5', NULL, b'0', NULL, '2018-12-10 10:13:30', NULL, '2020-04-05 19:10:07');
INSERT INTO `s_base_menu_button` VALUES (169, 25, NULL, NULL, b'0', NULL, '2020-04-05 19:10:16', NULL, '2020-04-05 19:10:16');
INSERT INTO `s_base_menu_button` VALUES (169, 26, NULL, NULL, b'0', NULL, '2020-04-05 19:10:22', NULL, '2020-04-05 19:10:22');
INSERT INTO `s_base_menu_button` VALUES (170, 5, NULL, NULL, b'0', NULL, '2019-02-02 22:56:06', NULL, '2019-02-02 22:56:06');
INSERT INTO `s_base_menu_button` VALUES (170, 6, NULL, NULL, b'0', NULL, '2019-02-02 22:56:09', NULL, '2019-02-02 22:56:09');
INSERT INTO `s_base_menu_button` VALUES (170, 7, NULL, NULL, b'0', NULL, '2019-02-02 22:56:11', NULL, '2019-02-02 22:56:11');
INSERT INTO `s_base_menu_button` VALUES (176, 8, NULL, NULL, b'0', NULL, '2019-02-06 00:04:50', NULL, '2019-02-06 00:04:50');
INSERT INTO `s_base_menu_button` VALUES (176, 9, NULL, NULL, b'0', NULL, '2019-02-06 00:04:53', NULL, '2019-02-06 00:04:53');
INSERT INTO `s_base_menu_button` VALUES (176, 10, NULL, NULL, b'0', NULL, '2019-02-06 00:04:56', NULL, '2019-02-06 00:04:56');
INSERT INTO `s_base_menu_button` VALUES (178, 11, NULL, NULL, b'0', NULL, '2019-02-07 21:57:54', NULL, '2019-02-07 21:57:54');
INSERT INTO `s_base_menu_button` VALUES (178, 12, NULL, NULL, b'0', NULL, '2019-02-07 21:57:58', NULL, '2019-02-07 21:57:58');
INSERT INTO `s_base_menu_button` VALUES (178, 13, NULL, NULL, b'0', NULL, '2019-02-07 21:58:02', NULL, '2019-02-07 21:58:02');
INSERT INTO `s_base_menu_button` VALUES (179, 15, NULL, NULL, b'0', NULL, '2019-02-07 23:16:00', NULL, '2019-02-07 23:16:00');
INSERT INTO `s_base_menu_button` VALUES (179, 16, NULL, NULL, b'0', NULL, '2019-02-07 23:16:04', NULL, '2019-02-07 23:16:04');
INSERT INTO `s_base_menu_button` VALUES (179, 17, NULL, NULL, b'0', NULL, '2019-02-07 23:16:15', NULL, '2019-02-07 23:16:15');
INSERT INTO `s_base_menu_button` VALUES (180, 18, NULL, NULL, b'0', NULL, '2019-02-08 10:39:39', NULL, '2019-02-08 10:39:39');
INSERT INTO `s_base_menu_button` VALUES (181, 19, 'a47f58862b2740daaff3b517b6b9e468', NULL, b'0', NULL, '2019-02-08 17:26:07', NULL, '2019-02-08 17:26:07');
INSERT INTO `s_base_menu_button` VALUES (181, 20, '687a77acca5840cb96f32d873c4a315b', NULL, b'0', NULL, '2019-02-08 17:26:07', NULL, '2019-02-08 17:26:07');
INSERT INTO `s_base_menu_button` VALUES (181, 21, '0c6c5a442c2044f39443c1e13c945f5a', NULL, b'0', NULL, '2019-02-08 17:26:07', NULL, '2019-02-08 17:26:07');

-- ----------------------------
-- Table structure for s_base_relation
-- ----------------------------
DROP TABLE IF EXISTS `s_base_relation`;
CREATE TABLE `s_base_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menuid` bigint(11) DEFAULT NULL COMMENT '菜单id',
  `roleid` bigint(11) DEFAULT NULL COMMENT '角色id',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '全局id',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT b'0' COMMENT '是否已删除',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3792 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_base_relation
-- ----------------------------
INSERT INTO `s_base_relation` VALUES (3377, 105, 5, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3378, 106, 5, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3379, 107, 5, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3380, 108, 5, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3381, 109, 5, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3382, 110, 5, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3383, 111, 5, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3384, 112, 5, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3385, 113, 5, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3386, 114, 5, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3387, 115, 5, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3388, 116, 5, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3389, 117, 5, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3390, 118, 5, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3391, 119, 5, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3392, 120, 5, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3393, 121, 5, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3394, 122, 5, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3395, 150, 5, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3396, 151, 5, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3737, 105, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3738, 106, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3739, 107, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3740, 108, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3741, 109, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3742, 110, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3743, 111, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3744, 112, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3745, 113, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3746, 165, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3747, 166, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3748, 167, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3749, 114, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3750, 115, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3751, 116, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3752, 117, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3753, 118, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3754, 162, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3755, 163, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3756, 164, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3757, 119, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3758, 120, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3759, 121, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3760, 122, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3761, 150, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3762, 151, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3763, 128, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3764, 134, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3765, 158, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3766, 159, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3767, 130, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3768, 131, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3769, 135, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3770, 136, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3771, 137, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3772, 152, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3773, 153, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3774, 154, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3775, 132, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3776, 138, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3777, 139, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3778, 140, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3779, 155, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3780, 156, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3781, 157, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3782, 133, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3783, 160, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3784, 161, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3785, 141, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3786, 142, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3787, 143, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3788, 144, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3789, 145, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3790, 148, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');
INSERT INTO `s_base_relation` VALUES (3791, 149, 1, NULL, NULL, b'0', NULL, '2018-09-21 16:28:41', NULL, '2018-09-21 16:29:52');

-- ----------------------------
-- Table structure for s_base_resources
-- ----------------------------
DROP TABLE IF EXISTS `s_base_resources`;
CREATE TABLE `s_base_resources`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源标题',
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '资源url',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '全局id',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT b'0' COMMENT '是否已删除',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 178 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_base_resources
-- ----------------------------
INSERT INTO `s_base_resources` VALUES (1, '系统设置', '/system', NULL, '系统设置', b'0', NULL, '2018-10-20 17:08:02', NULL, '2018-11-12 11:01:10');
INSERT INTO `s_base_resources` VALUES (2, '用户管理', '/usersPage', NULL, '用户管理', b'0', NULL, '2018-10-20 17:08:02', NULL, '2018-11-12 11:01:10');
INSERT INTO `s_base_resources` VALUES (3, '角色管理', '/rolesPage', NULL, '角色管理', b'0', NULL, '2018-10-20 17:08:02', NULL, '2018-11-12 11:01:10');
INSERT INTO `s_base_resources` VALUES (4, '资源管理', '/resourcesPage', NULL, '资源管理', b'0', NULL, '2018-10-20 17:08:02', NULL, '2018-11-12 11:01:10');
INSERT INTO `s_base_resources` VALUES (5, '添加用户', '/users/add', NULL, '添加用户', b'0', NULL, '2018-10-20 17:08:02', NULL, '2018-11-12 11:01:10');
INSERT INTO `s_base_resources` VALUES (6, '删除用户', '/users/delete', NULL, '删除用户', b'0', NULL, '2018-10-20 17:08:02', NULL, '2018-11-12 11:01:10');
INSERT INTO `s_base_resources` VALUES (7, '添加角色', '/roles/add', NULL, '添加角色', b'0', NULL, '2018-10-20 17:08:02', NULL, '2018-11-12 11:01:10');
INSERT INTO `s_base_resources` VALUES (8, '假删除角色', '/roles/delete', NULL, '假删除角色', b'0', NULL, '2018-10-20 17:08:02', NULL, '2018-11-13 10:37:43');
INSERT INTO `s_base_resources` VALUES (9, '添加资源', '/resources/add', NULL, '添加资源', b'0', NULL, '2018-10-20 17:08:02', NULL, '2018-11-12 11:01:10');
INSERT INTO `s_base_resources` VALUES (10, '删除资源', '/resources/delete', NULL, '删除资源', b'0', NULL, '2018-10-20 17:08:02', NULL, '2018-11-12 11:01:10');
INSERT INTO `s_base_resources` VALUES (11, '分配角色', '/users/saveUserRoles', NULL, '分配角色', b'0', NULL, '2018-10-20 17:08:02', NULL, '2018-11-12 11:01:10');
INSERT INTO `s_base_resources` VALUES (13, '分配权限', '/roles/saveRoleResources', NULL, '分配权限', b'0', NULL, '2018-10-20 17:08:02', NULL, '2018-11-12 11:01:10');
INSERT INTO `s_base_resources` VALUES (14, '新增或修改form', '/admin/form/create_update', NULL, '新增或修改form', b'0', NULL, '2018-11-08 22:29:59', NULL, '2018-11-12 11:01:10');
INSERT INTO `s_base_resources` VALUES (15, '新增或修改formField', '/admin/formField/create_update', NULL, '新增或修改formField', b'0', NULL, '2018-11-09 14:30:25', NULL, '2018-11-12 11:01:10');
INSERT INTO `s_base_resources` VALUES (16, '根据id假删除formField', '/admin/formField/delete', NULL, '根据id假删除formField', b'0', NULL, '2018-11-10 22:45:16', NULL, '2018-11-12 11:01:10');
INSERT INTO `s_base_resources` VALUES (17, '批量假删除role', '/admin/role/batch_delete', NULL, '批量假删除role', b'0', NULL, '2018-11-11 20:39:02', NULL, '2018-11-12 11:01:10');
INSERT INTO `s_base_resources` VALUES (18, '批量假删除formField', '/admin/formField/batch_delete', NULL, '批量假删除formField', b'0', NULL, '2018-11-11 20:39:29', NULL, '2018-11-12 11:01:10');
INSERT INTO `s_base_resources` VALUES (19, '根据id假删除form', '/admin/form/delete', NULL, '根据id假删除form', b'0', NULL, '2018-11-11 20:48:20', NULL, '2018-11-12 11:01:10');
INSERT INTO `s_base_resources` VALUES (20, '批量假删除form', '/admin/form/batch_delete', NULL, '批量假删除form', b'0', NULL, '2018-11-11 20:48:45', NULL, '2018-11-12 11:01:10');
INSERT INTO `s_base_resources` VALUES (21, '新增或修改resources', '/admin/resources/create_update', NULL, '新增或修改resources', b'0', NULL, '2018-11-12 10:24:59', NULL, '2018-11-12 11:01:10');
INSERT INTO `s_base_resources` VALUES (22, '根据id假删除resources', '/admin/resources/delete', NULL, '根据id假删除resources', b'0', NULL, '2018-11-12 10:25:26', NULL, '2018-11-12 11:01:10');
INSERT INTO `s_base_resources` VALUES (23, '批量假删除resources', '/admin/resources/batch_delete', NULL, '批量假删除resources', b'0', NULL, '2018-11-12 10:26:30', NULL, '2018-11-12 11:01:10');
INSERT INTO `s_base_resources` VALUES (29, '新增或修改roleResources', '/admin/roleResources/create_update', 'ae41b26f2e0745559c76624feee584dd', '新增或修改roleResources', b'0', NULL, '2018-11-13 10:27:38', NULL, '2018-11-13 10:27:38');
INSERT INTO `s_base_resources` VALUES (30, '根据id假删除roleResources', '/admin/roleResources/delete', '0b155e33db2f462c9994df64a78788a1', '根据id假删除roleResources', b'0', NULL, '2018-11-13 10:27:38', NULL, '2018-11-13 10:27:38');
INSERT INTO `s_base_resources` VALUES (31, '批量假删除roleResources', '/admin/roleResources/batch_delete', 'bb6e9c0f13f341d2a2b2eb061d49e3d5', '批量假删除roleResources', b'0', NULL, '2018-11-13 10:27:38', NULL, '2018-11-13 10:27:38');
INSERT INTO `s_base_resources` VALUES (32, '新增或修改role', '/admin/role/create_update', '04e666013c5b42cc96a1f42a12c8582f', '新增或修改role', b'0', NULL, '2018-11-13 11:02:04', NULL, '2018-11-13 11:02:04');
INSERT INTO `s_base_resources` VALUES (33, '根据id假删除role', '/admin/role/delete', 'f97575bf43474b5d850f9fc422eaea1d', '根据id假删除role', b'0', NULL, '2018-11-13 11:02:04', NULL, '2018-11-13 11:02:04');
INSERT INTO `s_base_resources` VALUES (34, '批量假删除role', '/admin/role/batch_delete', '9db0d1bd99234d2d9f9f5e01226567e3', '批量假删除role', b'0', NULL, '2018-11-13 11:02:04', NULL, '2018-11-13 15:30:31');
INSERT INTO `s_base_resources` VALUES (35, '批量新增roleResources', '/admin/roleResources/batch_create', NULL, '批量新增roleResources', b'0', NULL, '2018-11-13 15:59:50', NULL, '2018-11-13 15:59:50');
INSERT INTO `s_base_resources` VALUES (36, '新增或修改user', '/admin/user/create_update', 'f628ef2013d3491eb5a51251f6cefbd5', '新增或修改user', b'0', NULL, '2018-11-15 19:41:00', NULL, '2018-11-15 19:41:00');
INSERT INTO `s_base_resources` VALUES (37, '根据id假删除user', '/admin/user/delete', '8bbd80739f604a1e8bce68d391c38878', '根据id假删除user', b'0', NULL, '2018-11-15 19:41:00', NULL, '2018-11-15 19:41:00');
INSERT INTO `s_base_resources` VALUES (38, '批量假删除user', '/admin/user/batch_delete', 'c9fbb7f105f54b95b45a4aade8fb5275', '批量假删除user', b'0', NULL, '2018-11-15 19:41:00', NULL, '2018-11-15 19:41:00');
INSERT INTO `s_base_resources` VALUES (39, '新增或修改userRole', '/admin/userRole/create_update', 'f85b01ff3dcb4a678d7e2104174314f9', '新增或修改userRole', b'0', NULL, '2018-11-23 18:51:22', NULL, '2018-11-23 18:51:22');
INSERT INTO `s_base_resources` VALUES (40, '根据id假删除userRole', '/admin/userRole/delete', '570f9d0b998a42409ad284094994197c', '根据id假删除userRole', b'0', NULL, '2018-11-23 18:51:22', NULL, '2018-11-23 18:51:22');
INSERT INTO `s_base_resources` VALUES (41, '批量假删除userRole', '/admin/userRole/batch_delete', '34056d0a5f1c47bf9e6b9424f4a5c15d', '批量假删除userRole', b'0', NULL, '2018-11-23 18:51:22', NULL, '2018-11-23 18:51:22');
INSERT INTO `s_base_resources` VALUES (42, 'roleResources获取可以增加的权限', '/admin/roleResources/query_enable_create', NULL, 'roleResources获取可以增加的权限', b'0', NULL, '2018-11-24 21:34:58', NULL, '2018-11-24 21:35:27');
INSERT INTO `s_base_resources` VALUES (43, 'userRole获取可以增加的角色', '/admin/userRole/query_enable_create', NULL, 'userRole获取可以增加的角色', b'0', NULL, '2018-11-25 19:15:56', NULL, '2018-12-09 15:28:44');
INSERT INTO `s_base_resources` VALUES (44, '新增或修改menu', '/admin/menu/create_update', '21fd8eda520d40adb864d482ab0b5ba6', '新增或修改menu', b'0', NULL, '2018-11-29 21:51:54', NULL, '2018-11-29 21:51:54');
INSERT INTO `s_base_resources` VALUES (45, '根据id假删除menu', '/admin/menu/delete', '17e6028be27a4ceb92a186a00fbb6fd7', '根据id假删除menu', b'0', NULL, '2018-11-29 21:51:54', NULL, '2018-11-29 21:51:54');
INSERT INTO `s_base_resources` VALUES (46, '批量假删除menu', '/admin/menu/batch_delete', 'da42e0aa45c44c95b759fdca30d4bcb6', '批量假删除menu', b'0', NULL, '2018-11-29 21:51:54', NULL, '2018-11-29 21:51:54');
INSERT INTO `s_base_resources` VALUES (47, '新增或修改roleMenu', '/admin/roleMenu/create_update', '48c21286cf3e4ecc8fa43c39a0bde432', '新增或修改roleMenu', b'0', NULL, '2018-12-02 20:01:36', NULL, '2018-12-02 20:01:36');
INSERT INTO `s_base_resources` VALUES (48, '根据id假删除roleMenu', '/admin/roleMenu/delete', 'ea2979c4b38148d6aa17e91283c58567', '根据id假删除roleMenu', b'0', NULL, '2018-12-02 20:01:36', NULL, '2018-12-02 20:01:36');
INSERT INTO `s_base_resources` VALUES (49, '批量假删除roleMenu', '/admin/roleMenu/batch_delete', '0ff66308d8f44c37a97174eff28c18ec', '批量假删除roleMenu', b'0', NULL, '2018-12-02 20:01:36', NULL, '2018-12-02 20:01:36');
INSERT INTO `s_base_resources` VALUES (50, 'roleMenu获取可以增加的菜单', '/admin/roleMenu/query_enable_create', NULL, 'roleMenu获取可以增加的菜单', b'0', NULL, '2018-12-02 23:24:56', NULL, '2018-12-02 23:25:14');
INSERT INTO `s_base_resources` VALUES (51, '批量新增roleMenu', '/admin/roleMenu/batch_create', NULL, '批量新增roleMenu', b'0', NULL, '2018-12-04 19:29:37', NULL, '2018-12-04 19:29:59');
INSERT INTO `s_base_resources` VALUES (52, '新增或修改button', '/admin/button/create_update', '3e292a9378544108b0a0a8968b8ec4b4', '新增或修改button', b'0', NULL, '2018-12-04 19:51:24', NULL, '2018-12-04 19:51:24');
INSERT INTO `s_base_resources` VALUES (53, '根据id假删除button', '/admin/button/delete', '36c98744668747c0abb9c9e5d63011e5', '根据id假删除button', b'0', NULL, '2018-12-04 19:51:24', NULL, '2018-12-04 19:51:24');
INSERT INTO `s_base_resources` VALUES (54, '批量假删除button', '/admin/button/batch_delete', 'e1f7d1be609c415d8dddfbd216be0d54', '批量假删除button', b'0', NULL, '2018-12-04 19:51:24', NULL, '2018-12-04 19:51:24');
INSERT INTO `s_base_resources` VALUES (55, '新增或修改roleButton', '/admin/roleButton/create_update', '8fa2fd1b8f464b02b2e73a1ae5abef99', '新增或修改roleButton', b'0', NULL, '2018-12-04 20:50:13', NULL, '2018-12-04 20:50:13');
INSERT INTO `s_base_resources` VALUES (56, '根据id假删除roleButton', '/admin/roleButton/delete', '8b276dc8aad44902a7143d091b881df3', '根据id假删除roleButton', b'0', NULL, '2018-12-04 20:50:13', NULL, '2018-12-04 20:50:13');
INSERT INTO `s_base_resources` VALUES (57, '批量假删除roleButton', '/admin/roleButton/batch_delete', 'd3e766b5ff7e4cbbaf0003ea94045c3c', '批量假删除roleButton', b'0', NULL, '2018-12-04 20:50:13', NULL, '2018-12-04 20:50:13');
INSERT INTO `s_base_resources` VALUES (58, 'roleButton获取可以增加的按钮', '/admin/roleButton/query_enable_create', NULL, 'roleButton获取可以增加的按钮', b'0', NULL, '2018-12-05 18:36:12', NULL, '2018-12-09 15:28:21');
INSERT INTO `s_base_resources` VALUES (59, '批量新增roleButton', '/admin/roleButton/batch_create', NULL, '批量新增roleButton', b'0', NULL, '2018-12-05 18:52:43', NULL, '2018-12-05 18:53:07');
INSERT INTO `s_base_resources` VALUES (60, '新增或修改menuButton', '/admin/menuButton/create_update', '76909fb3904c4d71a367ad3efb0bc3aa', '新增或修改menuButton', b'0', NULL, '2018-12-06 14:58:49', NULL, '2018-12-06 14:58:49');
INSERT INTO `s_base_resources` VALUES (61, '根据id假删除menuButton', '/admin/menuButton/delete', 'a7c024fb56924eba92034cb936f8cf12', '根据id假删除menuButton', b'0', NULL, '2018-12-06 14:58:50', NULL, '2018-12-06 14:58:50');
INSERT INTO `s_base_resources` VALUES (62, '批量假删除menuButton', '/admin/menuButton/batch_delete', 'a954f6e2480f40649115eb38db6eb24c', '批量假删除menuButton', b'0', NULL, '2018-12-06 14:58:50', NULL, '2018-12-06 14:58:50');
INSERT INTO `s_base_resources` VALUES (63, 'menuButton获取可以增加的按钮', '/admin/menuButton/query_enable_create', NULL, 'menuButton获取可以增加的按钮', b'0', NULL, '2018-12-09 15:27:28', NULL, '2018-12-09 15:28:00');
INSERT INTO `s_base_resources` VALUES (64, '批量新增menuButton', '/admin/menuButton/batch_create', NULL, '批量新增menuButton', b'0', NULL, '2018-12-09 15:30:14', NULL, '2018-12-09 15:30:35');
INSERT INTO `s_base_resources` VALUES (65, '新增或修改annex', '/admin/annex/create_update', '9f8fca56ebb34d089aa7cb7c6758dae6', '新增或修改annex', b'0', NULL, '2018-12-14 16:23:44', NULL, '2018-12-14 16:23:44');
INSERT INTO `s_base_resources` VALUES (66, '根据id假删除annex', '/admin/annex/delete', '27e531f91dbd493694eb91ec9b7189a7', '根据id假删除annex', b'0', NULL, '2018-12-14 16:23:44', NULL, '2018-12-14 16:23:44');
INSERT INTO `s_base_resources` VALUES (67, '批量假删除annex', '/admin/annex/batch_delete', '8fea0d5951164e59a12b795a940f9386', '批量假删除annex', b'0', NULL, '2018-12-14 16:23:44', NULL, '2018-12-14 16:23:44');
INSERT INTO `s_base_resources` VALUES (69, '新增或修改socketMessage', '/admin/socketMessage/create_update', 'e3cb54933d244d35993992125216b488', '新增或修改socketMessage', b'0', NULL, '2018-12-25 10:05:47', NULL, '2018-12-25 10:05:47');
INSERT INTO `s_base_resources` VALUES (70, '根据id假删除socketMessage', '/admin/socketMessage/delete', 'fcdbe4521f724f3b9d57f2e6fed7cad2', '根据id假删除socketMessage', b'0', NULL, '2018-12-25 10:05:47', NULL, '2018-12-25 10:05:47');
INSERT INTO `s_base_resources` VALUES (71, '批量假删除socketMessage', '/admin/socketMessage/batch_delete', 'c1636ef0989142cf8a737aae8ac17e5b', '批量假删除socketMessage', b'0', NULL, '2018-12-25 10:05:47', NULL, '2018-12-25 10:05:47');
INSERT INTO `s_base_resources` VALUES (72, '新增或修改selectItem', '/admin/selectItem/create_update', NULL, '新增或修改selectItem', b'0', NULL, '2019-02-08 10:43:22', NULL, '2019-02-08 10:43:42');
INSERT INTO `s_base_resources` VALUES (73, '批量假删除selectItem', '/admin/selectItem/batch_delete', NULL, '批量假删除selectItem', b'0', NULL, '2019-02-08 10:43:58', NULL, '2019-02-08 10:44:22');
INSERT INTO `s_base_resources` VALUES (177, '文件上传', '/admin/annex/upload', 'c895984a6d4a4e1e9ffd79de3e1531b2', '文件上传', b'0', NULL, '2019-05-25 11:28:38', NULL, '2019-05-25 11:28:38');

-- ----------------------------
-- Table structure for s_base_role
-- ----------------------------
DROP TABLE IF EXISTS `s_base_role`;
CREATE TABLE `s_base_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_desc` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL COMMENT '父角色id',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '全局id',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT b'0' COMMENT '是否已删除',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_base_role
-- ----------------------------
INSERT INTO `s_base_role` VALUES (1, '管理员', NULL, NULL, NULL, b'0', NULL, '2018-10-24 15:20:09', NULL, '2018-11-06 22:25:24');
INSERT INTO `s_base_role` VALUES (2, '普通用户', NULL, NULL, NULL, b'0', NULL, '2018-10-24 15:20:18', NULL, '2018-11-06 22:25:25');
INSERT INTO `s_base_role` VALUES (3, '超级管理员', NULL, NULL, NULL, b'0', NULL, '2018-10-24 15:20:25', NULL, '2018-10-24 15:20:25');
INSERT INTO `s_base_role` VALUES (4, '前台用户', NULL, '975a4ba077a94ff0baa688d9abd76419', NULL, b'0', NULL, '2018-11-13 11:11:36', NULL, '2018-12-27 16:25:31');

-- ----------------------------
-- Table structure for s_base_role_button
-- ----------------------------
DROP TABLE IF EXISTS `s_base_role_button`;
CREATE TABLE `s_base_role_button`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `button_id` bigint(20) NOT NULL COMMENT '按钮id',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '全局id',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT b'0' COMMENT '是否已删除',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`role_id`, `button_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_base_role_button
-- ----------------------------
INSERT INTO `s_base_role_button` VALUES (1, 1, 'b42a6fbd96de442b93e940f759f0a5c1', NULL, b'0', NULL, '2018-12-06 14:32:07', NULL, '2019-02-09 10:23:26');
INSERT INTO `s_base_role_button` VALUES (1, 3, '3dcbb0ae5ec14271a3e4d8134f88ae63', NULL, b'0', NULL, '2018-12-06 14:32:07', NULL, '2019-02-09 10:23:23');
INSERT INTO `s_base_role_button` VALUES (1, 4, NULL, NULL, b'0', NULL, '2019-02-09 10:23:30', NULL, '2019-02-09 10:23:30');
INSERT INTO `s_base_role_button` VALUES (1, 5, NULL, NULL, b'0', NULL, '2019-02-09 10:23:33', NULL, '2019-02-09 10:23:33');
INSERT INTO `s_base_role_button` VALUES (1, 6, NULL, NULL, b'0', NULL, '2019-02-09 10:23:40', NULL, '2019-02-09 10:23:40');
INSERT INTO `s_base_role_button` VALUES (1, 7, NULL, NULL, b'0', NULL, '2019-02-09 10:23:43', NULL, '2019-02-09 10:23:43');
INSERT INTO `s_base_role_button` VALUES (1, 8, NULL, NULL, b'0', NULL, '2019-02-09 10:24:01', NULL, '2019-02-09 10:24:01');
INSERT INTO `s_base_role_button` VALUES (1, 9, NULL, NULL, b'0', NULL, '2019-02-09 10:24:16', NULL, '2019-02-09 10:24:16');
INSERT INTO `s_base_role_button` VALUES (1, 10, NULL, NULL, b'0', NULL, '2019-02-09 10:24:22', NULL, '2019-02-09 10:24:22');
INSERT INTO `s_base_role_button` VALUES (1, 11, NULL, NULL, b'0', NULL, '2019-02-09 10:24:24', NULL, '2019-02-09 10:24:24');
INSERT INTO `s_base_role_button` VALUES (1, 12, NULL, NULL, b'0', NULL, '2019-02-09 10:24:30', NULL, '2019-02-09 10:24:30');
INSERT INTO `s_base_role_button` VALUES (1, 13, NULL, NULL, b'0', NULL, '2019-02-09 10:24:37', NULL, '2019-02-09 10:24:37');
INSERT INTO `s_base_role_button` VALUES (1, 15, NULL, NULL, b'0', NULL, '2019-02-09 10:24:42', NULL, '2019-02-09 10:24:42');
INSERT INTO `s_base_role_button` VALUES (1, 16, NULL, NULL, b'0', NULL, '2019-02-09 10:24:45', NULL, '2019-02-09 10:24:45');
INSERT INTO `s_base_role_button` VALUES (1, 17, NULL, NULL, b'0', NULL, '2019-02-09 10:24:48', NULL, '2019-02-09 10:24:48');
INSERT INTO `s_base_role_button` VALUES (1, 18, NULL, NULL, b'0', NULL, '2019-02-09 10:24:52', NULL, '2019-02-09 10:24:52');
INSERT INTO `s_base_role_button` VALUES (1, 19, NULL, NULL, b'0', NULL, '2019-02-09 10:25:02', NULL, '2019-02-09 10:25:02');
INSERT INTO `s_base_role_button` VALUES (1, 20, NULL, NULL, b'0', NULL, '2019-02-09 10:25:08', NULL, '2019-02-09 10:25:08');
INSERT INTO `s_base_role_button` VALUES (1, 21, NULL, NULL, b'0', NULL, '2019-02-09 10:25:11', NULL, '2019-02-09 10:25:11');
INSERT INTO `s_base_role_button` VALUES (1, 22, NULL, NULL, b'0', NULL, '2020-04-05 19:13:33', NULL, '2020-04-05 19:13:33');
INSERT INTO `s_base_role_button` VALUES (1, 23, NULL, NULL, b'0', NULL, '2020-04-05 19:13:40', NULL, '2020-04-05 19:13:40');
INSERT INTO `s_base_role_button` VALUES (1, 24, NULL, NULL, b'0', NULL, '2020-04-05 19:13:43', NULL, '2020-04-05 19:13:43');
INSERT INTO `s_base_role_button` VALUES (1, 25, NULL, NULL, b'0', NULL, '2020-04-05 19:13:45', NULL, '2020-04-05 19:13:45');
INSERT INTO `s_base_role_button` VALUES (1, 26, NULL, NULL, b'0', NULL, '2020-04-05 19:13:48', NULL, '2020-04-05 19:13:48');

-- ----------------------------
-- Table structure for s_base_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `s_base_role_menu`;
CREATE TABLE `s_base_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单id',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '全局id',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT b'0' COMMENT '是否已删除',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_base_role_menu
-- ----------------------------
INSERT INTO `s_base_role_menu` VALUES (1, 168, NULL, NULL, b'0', NULL, '2018-12-02 22:44:06', NULL, '2019-01-25 15:00:44');
INSERT INTO `s_base_role_menu` VALUES (1, 169, NULL, NULL, b'0', NULL, '2019-01-29 22:27:04', NULL, '2019-01-29 22:27:04');
INSERT INTO `s_base_role_menu` VALUES (1, 170, NULL, NULL, b'0', NULL, '2019-02-04 13:31:18', NULL, '2019-02-04 13:31:18');
INSERT INTO `s_base_role_menu` VALUES (1, 171, NULL, NULL, b'0', NULL, '2019-02-04 13:31:21', NULL, '2019-02-04 13:31:21');
INSERT INTO `s_base_role_menu` VALUES (1, 176, NULL, NULL, b'0', NULL, '2019-02-05 23:38:43', NULL, '2019-02-05 23:38:43');
INSERT INTO `s_base_role_menu` VALUES (1, 177, NULL, NULL, b'0', NULL, '2019-02-07 21:21:00', NULL, '2019-02-07 21:21:00');
INSERT INTO `s_base_role_menu` VALUES (1, 178, NULL, NULL, b'0', NULL, '2019-02-07 21:21:03', NULL, '2019-02-07 21:21:03');
INSERT INTO `s_base_role_menu` VALUES (1, 179, NULL, NULL, b'0', NULL, '2019-02-07 23:21:32', NULL, '2019-02-07 23:21:32');
INSERT INTO `s_base_role_menu` VALUES (1, 180, NULL, NULL, b'0', NULL, '2019-02-08 10:35:34', NULL, '2019-02-08 10:35:34');
INSERT INTO `s_base_role_menu` VALUES (1, 181, NULL, NULL, b'0', NULL, '2019-02-08 11:42:09', NULL, '2019-02-08 11:42:09');
INSERT INTO `s_base_role_menu` VALUES (1, 182, '533f3e2289cc4a068014fa0920a96519', NULL, b'0', NULL, '2019-05-02 19:57:50', NULL, '2019-05-02 19:57:50');
INSERT INTO `s_base_role_menu` VALUES (10, 168, 'dd449c3e351e4893bf1b9da365532215', NULL, b'0', NULL, '2019-02-09 19:52:09', NULL, '2019-02-09 19:52:09');
INSERT INTO `s_base_role_menu` VALUES (10, 179, '765ac023ddd2441c913017920d2ffa4c', NULL, b'0', NULL, '2019-02-09 19:52:09', NULL, '2019-02-09 19:52:09');
INSERT INTO `s_base_role_menu` VALUES (10, 180, '565ab4596fe3464ca0f6136a096445dd', NULL, b'0', NULL, '2019-02-09 19:52:09', NULL, '2019-02-09 19:52:09');

-- ----------------------------
-- Table structure for s_base_role_resources
-- ----------------------------
DROP TABLE IF EXISTS `s_base_role_resources`;
CREATE TABLE `s_base_role_resources`  (
  `role_id` bigint(20) NOT NULL,
  `resources_id` bigint(20) NOT NULL,
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '全局id',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT b'0' COMMENT '是否已删除',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`role_id`, `resources_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_base_role_resources
-- ----------------------------
INSERT INTO `s_base_role_resources` VALUES (1, 2, '07f29225e62811e88eebace2d34b4464', NULL, b'1', NULL, '2018-10-20 17:20:48', NULL, '2018-11-14 14:52:51');
INSERT INTO `s_base_role_resources` VALUES (1, 3, '07f5ab23e62811e88eebace2d34b4464', NULL, b'1', NULL, '2018-10-20 17:20:48', NULL, '2018-11-14 14:52:52');
INSERT INTO `s_base_role_resources` VALUES (1, 4, '07f5aefee62811e88eebace2d34b4464', NULL, b'1', NULL, '2018-10-20 17:20:48', NULL, '2018-11-14 14:52:54');
INSERT INTO `s_base_role_resources` VALUES (1, 5, '07f5b0b8e62811e88eebace2d34b4464', NULL, b'1', NULL, '2018-10-20 17:20:48', NULL, '2018-11-14 14:52:55');
INSERT INTO `s_base_role_resources` VALUES (1, 6, '07f5b25de62811e88eebace2d34b4464', NULL, b'1', NULL, '2018-10-20 17:20:48', NULL, '2018-11-14 14:52:56');
INSERT INTO `s_base_role_resources` VALUES (1, 7, '07f5b46fe62811e88eebace2d34b4464', NULL, b'1', NULL, '2018-10-20 17:20:48', NULL, '2018-11-14 14:52:57');
INSERT INTO `s_base_role_resources` VALUES (1, 8, '07f5b648e62811e88eebace2d34b4464', NULL, b'0', NULL, '2018-10-20 17:20:48', NULL, '2018-11-13 17:02:59');
INSERT INTO `s_base_role_resources` VALUES (1, 9, '07f5b79be62811e88eebace2d34b4464', NULL, b'0', NULL, '2018-10-20 17:20:48', NULL, '2018-11-13 17:02:59');
INSERT INTO `s_base_role_resources` VALUES (1, 10, '07f5b85ee62811e88eebace2d34b4464', NULL, b'0', NULL, '2018-10-20 17:20:48', NULL, '2018-11-13 17:02:59');
INSERT INTO `s_base_role_resources` VALUES (1, 11, '07f5b917e62811e88eebace2d34b4464', NULL, b'0', NULL, '2018-10-20 17:20:48', NULL, '2018-11-13 17:02:59');
INSERT INTO `s_base_role_resources` VALUES (1, 13, '07f5baf0e62811e88eebace2d34b4464', NULL, b'0', NULL, '2018-10-20 17:20:48', NULL, '2018-11-13 17:02:59');
INSERT INTO `s_base_role_resources` VALUES (1, 14, '07f5bc34e62811e88eebace2d34b4464', NULL, b'0', NULL, '2018-11-08 22:32:02', NULL, '2018-11-13 17:02:59');
INSERT INTO `s_base_role_resources` VALUES (1, 15, '07f5bda1e62811e88eebace2d34b4464', NULL, b'0', NULL, '2018-11-09 17:07:56', NULL, '2018-11-13 17:02:59');
INSERT INTO `s_base_role_resources` VALUES (1, 16, '07f5be5fe62811e88eebace2d34b4464', NULL, b'0', NULL, '2018-11-10 22:47:03', NULL, '2018-11-13 17:02:59');
INSERT INTO `s_base_role_resources` VALUES (1, 17, '07f5bf18e62811e88eebace2d34b4464', NULL, b'0', NULL, '2018-11-11 20:49:36', NULL, '2018-11-13 17:02:59');
INSERT INTO `s_base_role_resources` VALUES (1, 18, '07f5bfd1e62811e88eebace2d34b4464', NULL, b'0', NULL, '2018-11-11 20:49:40', NULL, '2018-11-13 17:02:59');
INSERT INTO `s_base_role_resources` VALUES (1, 19, '07f5c110e62811e88eebace2d34b4464', NULL, b'0', NULL, '2018-11-11 20:49:42', NULL, '2018-11-13 17:02:59');
INSERT INTO `s_base_role_resources` VALUES (1, 20, '07f5c1bfe62811e88eebace2d34b4464', NULL, b'0', NULL, '2018-11-11 20:49:45', NULL, '2018-11-13 17:02:59');
INSERT INTO `s_base_role_resources` VALUES (1, 21, '07f5c282e62811e88eebace2d34b4464', NULL, b'0', NULL, '2018-11-12 10:27:14', NULL, '2018-11-13 17:02:59');
INSERT INTO `s_base_role_resources` VALUES (1, 22, '07f5c3eae62811e88eebace2d34b4464', NULL, b'0', NULL, '2018-11-12 10:27:21', NULL, '2018-11-13 17:02:59');
INSERT INTO `s_base_role_resources` VALUES (1, 23, '07f5c4a8e62811e88eebace2d34b4464', NULL, b'0', NULL, '2018-11-12 10:27:24', NULL, '2018-11-13 17:02:59');
INSERT INTO `s_base_role_resources` VALUES (1, 29, 'fa6c14a516fb471cb2b465ac33601b2d', NULL, b'0', NULL, '2018-11-13 10:27:38', NULL, '2018-11-13 17:02:59');
INSERT INTO `s_base_role_resources` VALUES (1, 30, '07b4756d06f941bf8db7c8d500c04b64', NULL, b'0', NULL, '2018-11-13 10:27:38', NULL, '2018-11-13 17:02:59');
INSERT INTO `s_base_role_resources` VALUES (1, 31, 'dfaa143996e740319cc670fa98999c6e', NULL, b'0', NULL, '2018-11-13 10:27:38', NULL, '2018-11-13 17:02:59');
INSERT INTO `s_base_role_resources` VALUES (1, 32, '3db55e776c764c239067b1e3f13a0b0e', NULL, b'0', NULL, '2018-11-13 11:02:04', NULL, '2018-11-13 17:02:59');
INSERT INTO `s_base_role_resources` VALUES (1, 33, 'd901d45c623441ef9deb41f6469b55c2', NULL, b'0', NULL, '2018-11-13 11:02:04', NULL, '2018-11-13 17:02:59');
INSERT INTO `s_base_role_resources` VALUES (1, 34, '075e1b2ef55f4dcf9c2a5506bf9b1f47', NULL, b'0', NULL, '2018-11-13 11:02:04', NULL, '2018-11-13 17:12:33');
INSERT INTO `s_base_role_resources` VALUES (1, 35, NULL, NULL, b'0', NULL, '2018-11-13 15:59:59', NULL, '2018-11-13 17:12:33');
INSERT INTO `s_base_role_resources` VALUES (1, 36, 'e2f76fc4f48f47d997e068fcc32df5fe', NULL, b'0', NULL, '2018-11-15 19:41:00', NULL, '2018-11-15 19:41:00');
INSERT INTO `s_base_role_resources` VALUES (1, 37, 'b837860a789146d083a100b0ec235378', NULL, b'0', NULL, '2018-11-15 19:41:00', NULL, '2018-11-15 19:41:00');
INSERT INTO `s_base_role_resources` VALUES (1, 38, '33862bf1a1044058949ccc867d14ad0a', NULL, b'0', NULL, '2018-11-15 19:41:00', NULL, '2018-11-15 19:41:00');
INSERT INTO `s_base_role_resources` VALUES (1, 39, 'a69b88e4fe9341f8a6e50a188cd8e455', NULL, b'0', NULL, '2018-11-23 18:51:22', NULL, '2018-11-23 18:51:22');
INSERT INTO `s_base_role_resources` VALUES (1, 40, '9c5fc003202e4473a6a5f36b9347e8cf', NULL, b'0', NULL, '2018-11-23 18:51:22', NULL, '2018-11-23 18:51:22');
INSERT INTO `s_base_role_resources` VALUES (1, 41, '689f64a39a55402e95411d19814e5187', NULL, b'0', NULL, '2018-11-23 18:51:22', NULL, '2018-11-23 18:51:22');
INSERT INTO `s_base_role_resources` VALUES (1, 42, NULL, NULL, b'0', NULL, '2018-11-24 21:35:40', NULL, '2018-11-24 21:35:40');
INSERT INTO `s_base_role_resources` VALUES (1, 43, NULL, NULL, b'0', NULL, '2018-11-25 20:58:28', NULL, '2018-11-25 20:58:28');
INSERT INTO `s_base_role_resources` VALUES (1, 44, '79ad80a1302143b4bfaaf9cec0363bcf', NULL, b'0', NULL, '2018-11-29 21:51:54', NULL, '2018-11-29 21:51:54');
INSERT INTO `s_base_role_resources` VALUES (1, 45, 'c5453633c8654c6988487c0ad72568a2', NULL, b'0', NULL, '2018-11-29 21:51:54', NULL, '2018-11-29 21:51:54');
INSERT INTO `s_base_role_resources` VALUES (1, 46, '4acb4b04ff614f799845f3f2ba91276e', NULL, b'0', NULL, '2018-11-29 21:51:54', NULL, '2018-11-29 21:51:54');
INSERT INTO `s_base_role_resources` VALUES (1, 47, '3cee95bae5a9464c8662f929293a88bd', NULL, b'0', NULL, '2018-12-02 20:01:36', NULL, '2018-12-02 20:01:36');
INSERT INTO `s_base_role_resources` VALUES (1, 48, '8b63c08c8bc34adc98eecacec59cba60', NULL, b'0', NULL, '2018-12-02 20:01:36', NULL, '2018-12-02 20:01:36');
INSERT INTO `s_base_role_resources` VALUES (1, 49, '5776841145954bf0aff1d7e241f00f4d', NULL, b'0', NULL, '2018-12-02 20:01:36', NULL, '2018-12-02 20:01:36');
INSERT INTO `s_base_role_resources` VALUES (1, 50, NULL, NULL, b'0', NULL, '2018-12-02 23:25:41', NULL, '2018-12-02 23:25:41');
INSERT INTO `s_base_role_resources` VALUES (1, 51, NULL, NULL, b'0', NULL, '2018-12-04 19:30:19', NULL, '2018-12-04 19:30:19');
INSERT INTO `s_base_role_resources` VALUES (1, 52, '692366fdc0a54837be1bec329b0935e2', NULL, b'0', NULL, '2018-12-04 19:51:24', NULL, '2018-12-04 19:51:24');
INSERT INTO `s_base_role_resources` VALUES (1, 53, '605a84e8c4d34781913e1f2d3eba921d', NULL, b'0', NULL, '2018-12-04 19:51:24', NULL, '2018-12-04 19:51:24');
INSERT INTO `s_base_role_resources` VALUES (1, 54, 'ce19ee34ec6f46c082ccb135e199ea33', NULL, b'0', NULL, '2018-12-04 19:51:24', NULL, '2018-12-04 19:51:24');
INSERT INTO `s_base_role_resources` VALUES (1, 55, 'be9cfd2b872a409bbb2c665a2626872e', NULL, b'0', NULL, '2018-12-04 20:50:13', NULL, '2018-12-04 20:50:13');
INSERT INTO `s_base_role_resources` VALUES (1, 56, '3cdbecf57df146acaf0aab6ead393a10', NULL, b'0', NULL, '2018-12-04 20:50:13', NULL, '2018-12-04 20:50:13');
INSERT INTO `s_base_role_resources` VALUES (1, 57, '340ec17d450f43d78417c5ae70fcf94c', NULL, b'0', NULL, '2018-12-04 20:50:13', NULL, '2018-12-04 20:50:13');
INSERT INTO `s_base_role_resources` VALUES (1, 58, NULL, NULL, b'0', NULL, '2018-12-05 18:36:51', NULL, '2018-12-05 18:36:51');
INSERT INTO `s_base_role_resources` VALUES (1, 59, NULL, NULL, b'0', NULL, '2018-12-05 18:53:20', NULL, '2018-12-05 18:53:20');
INSERT INTO `s_base_role_resources` VALUES (1, 60, '71c3ff57a5c442b1881a00846d77256e', NULL, b'0', NULL, '2018-12-06 14:58:50', NULL, '2018-12-06 14:58:50');
INSERT INTO `s_base_role_resources` VALUES (1, 61, 'e8a3ebc94f6547d7a25c3325fbfd0f04', NULL, b'0', NULL, '2018-12-06 14:58:50', NULL, '2018-12-06 14:58:50');
INSERT INTO `s_base_role_resources` VALUES (1, 62, '3c833dfcb8d9480f9515ffcc0c976fb9', NULL, b'0', NULL, '2018-12-06 14:58:50', NULL, '2018-12-06 14:58:50');
INSERT INTO `s_base_role_resources` VALUES (1, 63, NULL, NULL, b'0', NULL, '2018-12-09 15:32:39', NULL, '2018-12-09 15:32:39');
INSERT INTO `s_base_role_resources` VALUES (1, 64, NULL, NULL, b'0', NULL, '2018-12-09 15:32:43', NULL, '2018-12-09 15:32:43');
INSERT INTO `s_base_role_resources` VALUES (1, 65, '5df81fd6cae8455a8043b9a21cf393d1', NULL, b'0', NULL, '2018-12-14 16:23:44', NULL, '2018-12-14 16:23:44');
INSERT INTO `s_base_role_resources` VALUES (1, 66, '17b90bcd3258408ab465bc6168c807c4', NULL, b'0', NULL, '2018-12-14 16:23:44', NULL, '2018-12-14 16:23:44');
INSERT INTO `s_base_role_resources` VALUES (1, 67, 'e7004fd45398414eb82f4a7ddfece098', NULL, b'0', NULL, '2018-12-14 16:23:44', NULL, '2018-12-14 16:23:44');
INSERT INTO `s_base_role_resources` VALUES (1, 69, '479597667970445cbf0a71fb193392ad', NULL, b'0', NULL, '2018-12-25 10:05:47', NULL, '2018-12-25 10:05:47');
INSERT INTO `s_base_role_resources` VALUES (1, 70, '58abc027b1ac41e5b9d635a3239666fe', NULL, b'0', NULL, '2018-12-25 10:05:47', NULL, '2018-12-25 10:05:47');
INSERT INTO `s_base_role_resources` VALUES (1, 71, '52dc4ee48ba5442e96a40338e817a5de', NULL, b'0', NULL, '2018-12-25 10:05:47', NULL, '2018-12-25 10:05:47');
INSERT INTO `s_base_role_resources` VALUES (1, 72, NULL, NULL, b'0', NULL, '2019-02-08 10:44:42', NULL, '2019-02-08 10:44:42');
INSERT INTO `s_base_role_resources` VALUES (1, 73, NULL, NULL, b'0', NULL, '2019-02-08 10:44:46', NULL, '2019-02-08 10:44:46');
INSERT INTO `s_base_role_resources` VALUES (2, 2, '07f5c625e62811e88eebace2d34b4464', NULL, b'0', NULL, '2018-10-20 17:20:48', NULL, '2018-11-13 17:02:59');
INSERT INTO `s_base_role_resources` VALUES (2, 3, '07f5c6dee62811e88eebace2d34b4464', NULL, b'0', NULL, '2018-10-20 17:20:48', NULL, '2018-11-13 17:02:59');
INSERT INTO `s_base_role_resources` VALUES (2, 4, '07f5c797e62811e88eebace2d34b4464', NULL, b'0', NULL, '2018-10-20 17:20:48', NULL, '2018-11-13 17:02:59');
INSERT INTO `s_base_role_resources` VALUES (2, 9, '07f5c850e62811e88eebace2d34b4464', NULL, b'0', NULL, '2018-10-20 17:20:48', NULL, '2018-11-13 17:03:00');
INSERT INTO `s_base_role_resources` VALUES (3, 2, 'b25e49bef027400d9d8ced1f6123dbfd', NULL, b'0', NULL, '2019-02-10 09:56:20', NULL, '2019-02-10 09:56:20');
INSERT INTO `s_base_role_resources` VALUES (3, 3, '4d17f09cca10443dbab9309c20e73707', NULL, b'0', NULL, '2019-02-10 09:56:20', NULL, '2019-02-10 09:56:20');
INSERT INTO `s_base_role_resources` VALUES (3, 4, 'fa4aabd08db44392a116dc547439d93d', NULL, b'0', NULL, '2019-02-10 09:56:20', NULL, '2019-02-10 09:56:20');
INSERT INTO `s_base_role_resources` VALUES (3, 5, '3fbbe68d2f984afa9f7874cc4841dd22', NULL, b'0', NULL, '2019-02-10 09:56:20', NULL, '2019-02-10 09:56:20');
INSERT INTO `s_base_role_resources` VALUES (3, 7, '64c2cf1fa91b4f8fb9517f1408544cdd', NULL, b'0', NULL, '2019-02-10 09:56:20', NULL, '2019-02-10 09:56:20');
INSERT INTO `s_base_role_resources` VALUES (3, 8, 'a74e60c668d144019e9543433a68a8d6', NULL, b'0', NULL, '2019-02-10 09:56:20', NULL, '2019-02-10 09:56:20');
INSERT INTO `s_base_role_resources` VALUES (3, 9, '9df19ea0066f45a781da566b0c91e783', NULL, b'0', NULL, '2019-02-10 09:56:20', NULL, '2019-02-10 09:56:20');
INSERT INTO `s_base_role_resources` VALUES (3, 10, 'cb64120d2ab2487fa06c1480e4b22126', NULL, b'0', NULL, '2019-02-10 09:56:20', NULL, '2019-02-10 09:56:20');
INSERT INTO `s_base_role_resources` VALUES (4, 177, '515dd119e43645feb8311280fdb5b495', NULL, b'0', NULL, '2019-05-25 11:28:38', NULL, '2019-05-25 11:29:00');
INSERT INTO `s_base_role_resources` VALUES (9, 9, '07f5d02ae62811e88eebace2d34b4464', NULL, b'0', NULL, '2018-10-20 17:20:48', NULL, '2018-11-13 17:03:00');

-- ----------------------------
-- Table structure for s_base_select_item
-- ----------------------------
DROP TABLE IF EXISTS `s_base_select_item`;
CREATE TABLE `s_base_select_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `pid` bigint(20) DEFAULT NULL COMMENT '父级',
  `item_value` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '选择项值',
  `sort` int(11) DEFAULT 1 COMMENT '排序字段',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '全局id',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT b'0' COMMENT '是否已删除',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `父级`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100511 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '枚举选择项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_base_select_item
-- ----------------------------
INSERT INTO `s_base_select_item` VALUES (100001, '系统配置', NULL, NULL, 1, '5df6c3bfe3c011e88eebace2d34b4464', '系统配置', b'0', NULL, '2018-11-09 09:40:15', NULL, '2018-11-09 11:05:05');
INSERT INTO `s_base_select_item` VALUES (100002, '表单配置', 100001, NULL, 1, 'f53c8c7ee3ca11e88eebace2d34b4464', '表单配置', b'0', NULL, '2018-11-09 09:40:33', NULL, '2018-11-09 11:37:09');
INSERT INTO `s_base_select_item` VALUES (100003, '常用类型', 100001, NULL, 2, NULL, '常用类型', b'0', NULL, '2018-11-13 17:33:39', NULL, '2019-03-16 00:18:52');
INSERT INTO `s_base_select_item` VALUES (100101, '展示类型', 100002, NULL, 1, 'fa9410aee3ca11e88eebace2d34b4464', '展示类型', b'0', NULL, '2018-11-09 09:56:15', NULL, '2018-11-09 11:37:09');
INSERT INTO `s_base_select_item` VALUES (100201, '关联选择', 100101, NULL, 1, 'ff0ab8ede3ca11e88eebace2d34b4464', '关联选择', b'0', NULL, '2018-11-09 10:03:46', NULL, '2018-11-09 11:37:09');
INSERT INTO `s_base_select_item` VALUES (100202, 'HTML编辑器', 100101, NULL, 2, '0316a7e2e3cb11e88eebace2d34b4464', 'HTML编辑器', b'0', NULL, '2018-11-09 10:05:29', NULL, '2019-03-16 00:18:59');
INSERT INTO `s_base_select_item` VALUES (100203, '附件', 100101, NULL, 3, '0316a7e2e3cb11e88eebace2d34b4464', '附件', b'0', NULL, '2018-11-09 10:06:26', NULL, '2019-03-16 00:19:00');
INSERT INTO `s_base_select_item` VALUES (100204, '日期', 100101, NULL, 4, '1972fda1e3cb11e88eebace2d34b4464', '日期', b'0', NULL, '2018-11-09 10:07:36', NULL, '2019-03-16 00:19:01');
INSERT INTO `s_base_select_item` VALUES (100205, '文本', 100101, NULL, 5, '1e2fd84ae3cb11e88eebace2d34b4464', '文本', b'0', NULL, '2018-11-09 10:08:11', NULL, '2019-03-16 00:19:01');
INSERT INTO `s_base_select_item` VALUES (100206, '比特', 100101, NULL, 6, '2351d0b1e3cb11e88eebace2d34b4464', '比特', b'0', NULL, '2018-11-09 10:08:31', NULL, '2019-03-16 00:19:02');
INSERT INTO `s_base_select_item` VALUES (100207, '浮点型', 100101, NULL, 7, '283865b1e3cb11e88eebace2d34b4464', '浮点型', b'0', NULL, '2018-11-09 10:08:49', NULL, '2019-03-16 00:19:03');
INSERT INTO `s_base_select_item` VALUES (100208, '整型', 100101, NULL, 8, '2d130625e3cb11e88eebace2d34b4464', '整形', b'0', NULL, '2018-11-09 10:09:09', NULL, '2019-03-16 00:19:05');
INSERT INTO `s_base_select_item` VALUES (100301, 'bigint(20)', 100201, NULL, 1, '31f813e1e3cb11e88eebace2d34b4464', 'bigint(20)', b'0', NULL, '2018-11-09 10:34:56', NULL, '2018-11-09 11:37:09');
INSERT INTO `s_base_select_item` VALUES (100302, 'longtext', 100202, NULL, 1, '36034442e3cb11e88eebace2d34b4464', 'longtext', b'0', NULL, '2018-11-09 10:39:41', NULL, '2018-11-09 11:37:09');
INSERT INTO `s_base_select_item` VALUES (100303, 'text', 100203, NULL, 1, '3a73b311e3cb11e88eebace2d34b4464', 'text', b'0', NULL, '2018-11-09 10:40:34', NULL, '2018-11-09 11:37:09');
INSERT INTO `s_base_select_item` VALUES (100304, 'datetime', 100204, NULL, 1, '3e709dede3cb11e88eebace2d34b4464', 'datetime', b'0', NULL, '2018-11-09 10:42:20', NULL, '2019-03-24 11:51:15');
INSERT INTO `s_base_select_item` VALUES (100305, 'varchar(128)', 100205, NULL, 1, '42ab8372e3cb11e88eebace2d34b4464', 'varchar(128)', b'0', NULL, '2018-11-09 10:47:32', NULL, '2018-11-25 22:09:19');
INSERT INTO `s_base_select_item` VALUES (100306, 'text', 100205, NULL, 2, '57c9764de3cb11e88eebace2d34b4464', 'text', b'0', NULL, '2018-11-09 10:48:06', NULL, '2019-03-16 00:19:15');
INSERT INTO `s_base_select_item` VALUES (100307, 'mediumtext', 100205, NULL, 3, '5c52a404e3cb11e88eebace2d34b4464', 'mediumText', b'0', NULL, '2018-11-09 10:48:23', NULL, '2019-03-16 00:19:15');
INSERT INTO `s_base_select_item` VALUES (100308, 'longtext', 100205, NULL, 4, '6010ba5de3cb11e88eebace2d34b4464', 'longText', b'0', NULL, '2018-11-09 10:48:36', NULL, '2019-03-16 00:19:18');
INSERT INTO `s_base_select_item` VALUES (100309, 'bit(1)', 100206, NULL, 1, '6423f4ebe3cb11e88eebace2d34b4464', 'bit(1)', b'0', NULL, '2018-11-09 10:50:11', NULL, '2018-11-09 11:37:09');
INSERT INTO `s_base_select_item` VALUES (100310, 'float', 100207, NULL, 1, '67fbc16be3cb11e88eebace2d34b4464', 'float', b'0', NULL, '2018-11-09 10:51:10', NULL, '2018-11-09 11:37:09');
INSERT INTO `s_base_select_item` VALUES (100311, 'double', 100207, NULL, 2, '6c078486e3cb11e88eebace2d34b4464', 'double', b'0', NULL, '2018-11-09 10:51:25', NULL, '2019-03-16 00:19:21');
INSERT INTO `s_base_select_item` VALUES (100312, 'int(11)', 100208, NULL, 1, '6fc25c3be3cb11e88eebace2d34b4464', 'int(11)', b'0', NULL, '2018-11-09 10:51:58', NULL, '2018-11-09 11:37:09');
INSERT INTO `s_base_select_item` VALUES (100313, 'bigint(20)', 100208, NULL, 2, '73bf5c41e3cb11e88eebace2d34b4464', 'bigint(20)', b'0', NULL, '2018-11-09 10:52:26', NULL, '2019-03-16 00:19:24');
INSERT INTO `s_base_select_item` VALUES (100401, '性别', 100003, NULL, 1, NULL, '性别', b'0', NULL, '2018-11-13 17:35:11', NULL, '2018-11-13 17:38:58');
INSERT INTO `s_base_select_item` VALUES (100402, '打开方式', 100003, NULL, 2, NULL, '打开方式', b'0', NULL, '2018-11-30 21:29:18', NULL, '2019-03-16 00:19:27');
INSERT INTO `s_base_select_item` VALUES (100403, '用户类型', 100003, NULL, 3, NULL, '用户类型', b'0', NULL, '2018-12-27 16:00:47', NULL, '2019-04-08 23:12:06');
INSERT INTO `s_base_select_item` VALUES (100404, '后台审核状态', 100003, NULL, 1, '4d29e7b799504b588b41a20f8714e5c1', '后台审核状态', b'0', NULL, '2019-04-09 10:36:29', NULL, '2019-04-09 10:36:49');
INSERT INTO `s_base_select_item` VALUES (100501, '男', 100401, NULL, 1, NULL, '男', b'0', NULL, '2018-11-13 17:36:10', NULL, '2018-11-13 17:38:55');
INSERT INTO `s_base_select_item` VALUES (100502, '女', 100401, NULL, 2, NULL, '女', b'0', NULL, '2018-11-13 17:36:44', NULL, '2019-03-16 00:19:32');
INSERT INTO `s_base_select_item` VALUES (100503, '本页打开', 100402, NULL, 1, NULL, '本页打开', b'0', NULL, '2018-11-30 21:30:22', NULL, '2018-11-30 21:30:22');
INSERT INTO `s_base_select_item` VALUES (100504, '新页打开', 100402, NULL, 2, NULL, '新页打开', b'0', NULL, '2018-11-30 21:30:45', NULL, '2019-03-16 00:19:34');
INSERT INTO `s_base_select_item` VALUES (100505, '后台用户', 100403, NULL, 1, NULL, '后台用户', b'0', NULL, '2018-12-27 16:01:16', NULL, '2019-04-08 23:12:10');
INSERT INTO `s_base_select_item` VALUES (100506, '前台用户', 100403, NULL, 2, NULL, '前台用户', b'0', NULL, '2018-12-27 16:01:38', NULL, '2019-04-08 23:12:13');
INSERT INTO `s_base_select_item` VALUES (100507, '微信用户', 100403, NULL, 3, NULL, '微信用户', b'0', NULL, '2018-12-27 16:01:49', NULL, '2019-04-08 23:12:16');
INSERT INTO `s_base_select_item` VALUES (100508, '待审核', 100404, NULL, 1, 'cd364402f8294c09b18ab3b346c904bd', '待审核', b'0', NULL, '2019-04-09 10:37:33', NULL, '2019-04-09 10:40:05');
INSERT INTO `s_base_select_item` VALUES (100509, '审核通过', 100404, NULL, 2, '98c0b8b514b24ee6a79cbb14feba1b4d', '审核通过', b'0', NULL, '2019-04-09 10:37:57', NULL, '2019-04-09 10:39:26');
INSERT INTO `s_base_select_item` VALUES (100510, '审核不通过', 100404, NULL, 3, 'e24992901e09421aa18b7cde600ed33a', '审核不通过', b'0', NULL, '2019-04-09 10:38:18', NULL, '2019-04-09 10:39:31');

-- ----------------------------
-- Table structure for s_base_user
-- ----------------------------
DROP TABLE IF EXISTS `s_base_user`;
CREATE TABLE `s_base_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `avatar` bigint(20) DEFAULT NULL COMMENT '头像',
  `account` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '账号',
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `user_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名字',
  `sex` bigint(20) DEFAULT NULL COMMENT '性别',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '电话',
  `type` bigint(20) DEFAULT NULL COMMENT '用户类型',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '全局id',
  `balance` float DEFAULT 0 COMMENT '余额',
  `school_address` bigint(20) DEFAULT NULL COMMENT '学校住址',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT b'0' COMMENT '是否已删除',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_base_user
-- ----------------------------
INSERT INTO `s_base_user` VALUES (1, 647, 'admin', 'm4NZlUcqju0=', 'admin', 100502, 'sn93@qq.com', '18200000000', 100505, NULL, 0, NULL, '3ef7164d1f6167cb9f2658c07d3c2f0a', b'0', NULL, '2018-09-21 16:44:55', NULL, '2018-12-27 16:49:13');
INSERT INTO `s_base_user` VALUES (44, NULL, 'test', '45abb7879f6a8268f1ef600e6038ac73', 'test', 100501, 'abc@123.com', '', 100505, NULL, 0, NULL, NULL, b'0', NULL, '2018-09-21 16:44:55', NULL, '2018-12-27 16:49:13');
INSERT INTO `s_base_user` VALUES (45, NULL, 'boss', '71887a5ad666a18f709e1d4e693d5a35', '老板', 100501, '', '', 100505, NULL, 0, NULL, NULL, b'0', NULL, '2018-09-21 16:44:55', NULL, '2018-12-27 16:49:13');
INSERT INTO `s_base_user` VALUES (46, NULL, 'manager', 'b53cac62e7175637d4beb3b16b2f7915', '经理', 100501, '', '', 100505, NULL, 0, NULL, NULL, b'0', NULL, '2018-09-21 16:44:55', NULL, '2018-12-27 16:49:13');
INSERT INTO `s_base_user` VALUES (48, 647, '2015034743042', 'ZEr559FnMAo=', '大帅哥111', 100501, '810797861@qq.com', '13652288354', 100506, '965115b821d54908b1fa1ac9641756b4', 1.05, NULL, NULL, b'0', NULL, '2018-12-27 16:34:46', NULL, '2019-05-29 12:48:17');
INSERT INTO `s_base_user` VALUES (53, NULL, 'test1', 'ZEr559FnMAo=', '测试用户', NULL, '13655555555@163.com', '13655555555', 100505, 'eb95a8952806419382f70d018269b1cf', 0.01, NULL, NULL, b'0', NULL, '2019-02-06 16:10:17', NULL, '2019-02-07 16:10:23');
INSERT INTO `s_base_user` VALUES (54, NULL, 't3', 'ZEr559FnMAo=', 't2', NULL, NULL, NULL, 100505, '213c9076fc9448759eaa595e4657de33', 0, NULL, NULL, b'0', NULL, '2019-03-13 19:12:16', NULL, '2019-03-26 21:27:16');
INSERT INTO `s_base_user` VALUES (55, NULL, '2015034743003', 'ZEr559FnMAo=', '帅哥', NULL, NULL, NULL, 100506, '887a53e4871244d19acbd4096690f7c9', 0, NULL, NULL, b'0', NULL, '2019-03-29 22:58:53', NULL, '2019-03-29 22:58:53');
INSERT INTO `s_base_user` VALUES (56, NULL, '2015034743004', 'ZEr559FnMAo=', '大帅哥', NULL, NULL, NULL, 100506, 'aca3181db90b4adeb1c429339f12fd8a', 0, NULL, NULL, b'0', NULL, '2019-03-29 23:00:52', NULL, '2019-03-29 23:00:52');

-- ----------------------------
-- Table structure for s_base_user_role
-- ----------------------------
DROP TABLE IF EXISTS `s_base_user_role`;
CREATE TABLE `s_base_user_role`  (
  `user_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '全局id',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT b'0' COMMENT '是否已删除',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_base_user_role
-- ----------------------------
INSERT INTO `s_base_user_role` VALUES (23, 2, NULL, NULL, b'0', NULL, '2018-10-20 17:33:53', NULL, '2018-10-20 17:34:46');
INSERT INTO `s_base_user_role` VALUES (1, 1, NULL, NULL, b'0', NULL, '2018-10-20 17:33:53', NULL, '2018-11-25 21:43:26');
INSERT INTO `s_base_user_role` VALUES (2, 2, NULL, NULL, b'0', NULL, '2018-10-20 17:33:53', NULL, '2018-10-20 17:34:46');
INSERT INTO `s_base_user_role` VALUES (52, 2, NULL, NULL, b'0', NULL, '2019-02-06 15:53:58', NULL, '2019-02-06 15:53:58');
INSERT INTO `s_base_user_role` VALUES (53, 2, NULL, NULL, b'0', NULL, '2019-02-07 16:06:08', NULL, '2019-02-07 16:06:08');
INSERT INTO `s_base_user_role` VALUES (54, 4, '17af48f79feb4086b3cc75f649f22594', NULL, b'0', NULL, '2019-03-13 19:12:16', NULL, '2019-03-15 17:14:08');
INSERT INTO `s_base_user_role` VALUES (55, 4, 'a0c966e19c7347a5af653f8a6bf6229a', NULL, b'0', NULL, '2019-03-29 22:58:53', NULL, '2019-03-29 22:58:53');
INSERT INTO `s_base_user_role` VALUES (56, 4, 'cbcd11e51c9341edae4f4a05fee9b415', NULL, b'0', NULL, '2019-03-29 23:00:52', NULL, '2019-03-29 23:00:52');
INSERT INTO `s_base_user_role` VALUES (48, 4, NULL, NULL, b'0', NULL, '2019-04-25 21:09:55', NULL, '2019-04-25 21:09:55');

-- ----------------------------
-- Table structure for z_abandon_test
-- ----------------------------
DROP TABLE IF EXISTS `z_abandon_test`;
CREATE TABLE `z_abandon_test`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '全局id',
  `test_field_name_222` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `test_field_name_111` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT b'0' COMMENT '是否已删除',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '测试建表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
