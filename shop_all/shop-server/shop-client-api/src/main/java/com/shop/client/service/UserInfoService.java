package com.shop.client.service;

import com.shop.client.dto.UserInfo;
import com.shop.db.domain.ShopUser;
import com.shop.db.service.ShopUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

@Service
public class UserInfoService {
    @Autowired
    private ShopUserService userService;


    public UserInfo getInfo(Integer userId) {
        ShopUser user = userService.findById(userId);
        Assert.state(user != null, "用户不存在");
        UserInfo userInfo = new UserInfo();
        userInfo.setNickName(user.getNickname());
        userInfo.setAvatarUrl(user.getAvatar());
        return userInfo;
    }
}
