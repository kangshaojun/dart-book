package com.shop.db.service;

import com.shop.db.dao.ShopPermissionMapper;
import com.shop.db.domain.ShopPermission;
import com.shop.db.domain.ShopPermissionExample;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class ShopPermissionService {
    @Resource
    private ShopPermissionMapper permissionMapper;

    public Set<String> queryByRoleIds(Integer[] roleIds) {
        Set<String> permissions = new HashSet<String>();
        if(roleIds.length == 0){
            return permissions;
        }

        ShopPermissionExample example = new ShopPermissionExample();
        example.or().andRoleIdIn(Arrays.asList(roleIds)).andDeletedEqualTo(false);
        List<ShopPermission> permissionList = permissionMapper.selectByExample(example);

        for(ShopPermission permission : permissionList){
            permissions.add(permission.getPermission());
        }

        return permissions;
    }


    public Set<String> queryByRoleId(Integer roleId) {
        Set<String> permissions = new HashSet<String>();
        if(roleId == null){
            return permissions;
        }

        ShopPermissionExample example = new ShopPermissionExample();
        example.or().andRoleIdEqualTo(roleId).andDeletedEqualTo(false);
        List<ShopPermission> permissionList = permissionMapper.selectByExample(example);

        for(ShopPermission permission : permissionList){
            permissions.add(permission.getPermission());
        }

        return permissions;
    }

    public boolean checkSuperPermission(Integer roleId) {
        if(roleId == null){
            return false;
        }

        ShopPermissionExample example = new ShopPermissionExample();
        example.or().andRoleIdEqualTo(roleId).andPermissionEqualTo("*").andDeletedEqualTo(false);
        return permissionMapper.countByExample(example) != 0;
    }

    public void deleteByRoleId(Integer roleId) {
        ShopPermissionExample example = new ShopPermissionExample();
        example.or().andRoleIdEqualTo(roleId).andDeletedEqualTo(false);
        permissionMapper.logicalDeleteByExample(example);
    }

    public void add(ShopPermission shopPermission) {
        shopPermission.setAddTime(LocalDateTime.now());
        shopPermission.setUpdateTime(LocalDateTime.now());
        permissionMapper.insertSelective(shopPermission);
    }
}
