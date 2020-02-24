package com.shop.db.service;

import com.github.pagehelper.PageHelper;
import com.shop.db.dao.ShopAddressMapper;
import com.shop.db.domain.ShopAddress;
import com.shop.db.domain.ShopAddressExample;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class ShopAddressService {
    @Resource
    private ShopAddressMapper addressMapper;

    public List<ShopAddress> queryByUid(Integer uid) {
        ShopAddressExample example = new ShopAddressExample();
        example.or().andUserIdEqualTo(uid).andDeletedEqualTo(false);
        return addressMapper.selectByExample(example);
    }

    public ShopAddress query(Integer userId, Integer id) {
        ShopAddressExample example = new ShopAddressExample();
        example.or().andIdEqualTo(id).andUserIdEqualTo(userId).andDeletedEqualTo(false);
        return addressMapper.selectOneByExample(example);
    }

    public int add(ShopAddress address) {
        address.setAddTime(LocalDateTime.now());
        address.setUpdateTime(LocalDateTime.now());
        return addressMapper.insertSelective(address);
    }

    public int update(ShopAddress address) {
        address.setUpdateTime(LocalDateTime.now());
        return addressMapper.updateByPrimaryKeySelective(address);
    }

    public void delete(Integer id) {
        addressMapper.logicalDeleteByPrimaryKey(id);
    }

    public ShopAddress findDefault(Integer userId) {
        ShopAddressExample example = new ShopAddressExample();
        example.or().andUserIdEqualTo(userId).andIsDefaultEqualTo(true).andDeletedEqualTo(false);
        return addressMapper.selectOneByExample(example);
    }

    public void resetDefault(Integer userId) {
        ShopAddress address = new ShopAddress();
        address.setIsDefault(false);
        address.setUpdateTime(LocalDateTime.now());
        ShopAddressExample example = new ShopAddressExample();
        example.or().andUserIdEqualTo(userId).andDeletedEqualTo(false);
        addressMapper.updateByExampleSelective(address, example);
    }

    public List<ShopAddress> querySelective(Integer userId, String name, Integer page, Integer limit, String sort, String order) {
        ShopAddressExample example = new ShopAddressExample();
        ShopAddressExample.Criteria criteria = example.createCriteria();

        if (userId != null) {
            criteria.andUserIdEqualTo(userId);
        }
        if (!StringUtils.isEmpty(name)) {
            criteria.andNameLike("%" + name + "%");
        }
        criteria.andDeletedEqualTo(false);

        if (!StringUtils.isEmpty(sort) && !StringUtils.isEmpty(order)) {
            example.setOrderByClause(sort + " " + order);
        }

        PageHelper.startPage(page, limit);
        return addressMapper.selectByExample(example);
    }
}
