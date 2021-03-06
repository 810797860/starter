package com.otoko.startergenerator.example.service.impl;

import com.otoko.startercommon.base.BaseServiceImpl.BaseServiceImpl;
import com.otoko.startergenerator.example.entity.User;
import com.otoko.startergenerator.example.mapper.UserMapper;
import com.otoko.startergenerator.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author 81079
 */

@Service
public class UserServiceImpl extends BaseServiceImpl<UserMapper, User> implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public boolean fakeDeleteById(Long userId) {
        return userMapper.fakeDeleteById(userId);
    }

    @Override
    public boolean fakeBatchDelete(List<Long> userIds) {
        return userMapper.fakeBatchDelete(userIds);
    }

    @Override
    public Map<String, Object> selectMapById(Long userId) {
        return userMapper.selectMapById(userId);
    }

    @Override
    public User userCreateUpdate(User user) {
        Long userId = user.getId();
        if (userId != null) {
            userMapper.insert(user);
        } else {
            userMapper.updateById(user);
        }
        return user;
    }
}
