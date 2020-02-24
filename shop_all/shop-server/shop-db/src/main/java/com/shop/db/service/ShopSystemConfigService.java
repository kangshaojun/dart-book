package com.shop.db.service;

import com.shop.db.dao.ShopSystemMapper;
import com.shop.db.domain.ShopSystem;
import com.shop.db.domain.ShopSystemExample;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ShopSystemConfigService {
    @Resource
    private ShopSystemMapper systemMapper;

    public Map<String, String> queryAll() {
        ShopSystemExample example = new ShopSystemExample();
        example.or().andDeletedEqualTo(false);

        List<ShopSystem> systemList = systemMapper.selectByExample(example);
        Map<String, String> systemConfigs = new HashMap<>();
        for (ShopSystem item : systemList) {
            systemConfigs.put(item.getKeyName(), item.getKeyValue());
        }

        return systemConfigs;
    }

    public Map<String, String> listMail() {
        ShopSystemExample example = new ShopSystemExample();
        example.or().andKeyNameLike("shop_mall_%").andDeletedEqualTo(false);
        List<ShopSystem> systemList = systemMapper.selectByExample(example);
        Map<String, String> data = new HashMap<>();
        for(ShopSystem system : systemList){
            data.put(system.getKeyName(), system.getKeyValue());
        }
        return data;
    }

    public Map<String, String> listApp() {
        ShopSystemExample example = new ShopSystemExample();
        example.or().andKeyNameLike("shop_app_%").andDeletedEqualTo(false);
        List<ShopSystem> systemList = systemMapper.selectByExample(example);
        Map<String, String> data = new HashMap<>();
        for(ShopSystem system : systemList){
            data.put(system.getKeyName(), system.getKeyValue());
        }
        return data;
    }

    public Map<String, String> listOrder() {
        ShopSystemExample example = new ShopSystemExample();
        example.or().andKeyNameLike("shop_order_%").andDeletedEqualTo(false);
        List<ShopSystem> systemList = systemMapper.selectByExample(example);
        Map<String, String> data = new HashMap<>();
        for(ShopSystem system : systemList){
            data.put(system.getKeyName(), system.getKeyValue());
        }
        return data;
    }

    public Map<String, String> listExpress() {
        ShopSystemExample example = new ShopSystemExample();
        example.or().andKeyNameLike("shop_express_%").andDeletedEqualTo(false);
        List<ShopSystem> systemList = systemMapper.selectByExample(example);
        Map<String, String> data = new HashMap<>();
        for(ShopSystem system : systemList){
            data.put(system.getKeyName(), system.getKeyValue());
        }
        return data;
    }

    public void updateConfig(Map<String, String> data) {
        for (Map.Entry<String, String> entry : data.entrySet()) {
            ShopSystemExample example = new ShopSystemExample();
            example.or().andKeyNameEqualTo(entry.getKey()).andDeletedEqualTo(false);

            ShopSystem system = new ShopSystem();
            system.setKeyName(entry.getKey());
            system.setKeyValue(entry.getValue());
            system.setUpdateTime(LocalDateTime.now());
            systemMapper.updateByExampleSelective(system, example);
        }

    }

    public void addConfig(String key, String value) {
        ShopSystem system = new ShopSystem();
        system.setKeyName(key);
        system.setKeyValue(value);
        system.setAddTime(LocalDateTime.now());
        system.setUpdateTime(LocalDateTime.now());
        systemMapper.insertSelective(system);
    }
}
