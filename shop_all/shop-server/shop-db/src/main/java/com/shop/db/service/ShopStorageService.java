package com.shop.db.service;

import com.github.pagehelper.PageHelper;
import com.shop.db.dao.ShopStorageMapper;
import com.shop.db.domain.ShopStorage;
import com.shop.db.domain.ShopStorageExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class ShopStorageService {
    @Resource
    private ShopStorageMapper storageMapper;

    public void deleteByKey(String key) {
        ShopStorageExample example = new ShopStorageExample();
        example.or().andKeyEqualTo(key);
        storageMapper.logicalDeleteByExample(example);
    }

    public void add(ShopStorage storageInfo) {
        storageInfo.setAddTime(LocalDateTime.now());
        storageInfo.setUpdateTime(LocalDateTime.now());
        storageMapper.insertSelective(storageInfo);
    }

    public ShopStorage findByKey(String key) {
        ShopStorageExample example = new ShopStorageExample();
        example.or().andKeyEqualTo(key).andDeletedEqualTo(false);
        return storageMapper.selectOneByExample(example);
    }

    public int update(ShopStorage storageInfo) {
        storageInfo.setUpdateTime(LocalDateTime.now());
        return storageMapper.updateByPrimaryKeySelective(storageInfo);
    }

    public ShopStorage findById(Integer id) {
        return storageMapper.selectByPrimaryKey(id);
    }

    public List<ShopStorage> querySelective(String key, String name, Integer page, Integer limit, String sort, String order) {
        ShopStorageExample example = new ShopStorageExample();
        ShopStorageExample.Criteria criteria = example.createCriteria();

        if (!StringUtils.isEmpty(key)) {
            criteria.andKeyEqualTo(key);
        }
        if (!StringUtils.isEmpty(name)) {
            criteria.andNameLike("%" + name + "%");
        }
        criteria.andDeletedEqualTo(false);

        if (!StringUtils.isEmpty(sort) && !StringUtils.isEmpty(order)) {
            example.setOrderByClause(sort + " " + order);
        }

        PageHelper.startPage(page, limit);
        return storageMapper.selectByExample(example);
    }
}
